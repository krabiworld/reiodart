// Copyright (c) MineEjo.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import 'dart:html';
import 'dart:math';

import '../foundation/expanded/map.dart';
import '../widget/html/tag/element_tag_br.dart';
import '../widget/html/tag/element_tag_wbr.dart';
import 'virtual_node_attr.dart';

// const String reioWidget = 'reio-widget';

int totalGenerated = 0;
String genWidgetNumber() {
  totalGenerated++;
  return totalGenerated.toString();
}

/// The virtual virtual_dom used in the virtual DOM
/// tries to be similar to the HTML.
abstract class ReioNode {
  String tag;
  String value;
  List<ReioNodeAttr>? attrs;
  List<ReioNode>? children;

  // Used as an identifier for a widget.
  String number = genWidgetNumber();

  // Stores all unique values of a widget,
  // for checking them in the future.
  // For example, to see if the new value was the original value.
  List<String> values = [];
  bool isNewValue(String value) => (values.length > 1 && values[0] != value);
  bool isOldValue(String value) => (values.length == 1 && values[0] == value);

  // Stores the element from the DOM,
  // to change the HTML, because Reio uses virtual.
  Element? element;

  ReioNode({required this.tag, required this.value, this.attrs, this.children});

  void destroy();

  void init([Node? htmlNode]);

  void updateTo(ReioNode newNode);

  void saveValue(dynamic value) {
    // Saves the original values, if there are more than 1,
    // for checking them in the future.
    // For example, to see if the new value was the original value.
    if (!values.contains(value)) {
      values.add(value);
      // if there are more than 1, it reverses the list and
      // trims the rest, leaving the standard and new values.
      if (values.length > 1) values = values.reversed.toList().sublist(0, 2);
    }
  }
}

/// Initializes or overwrites a [ReioNode].
class ReioNodeController {
  final ReioNode node;
  ReioNode? minorNode;

  bool isUpdate = false;

  ReioNodeController(this.node, [this.minorNode]) {
    // The new virtual_dom, must update the old one, so the update is true.
    if (minorNode != null) isUpdate = true;
  }

  // void initData([Element? element]) {
  //   if (element == null) return;
  //   element.setAttribute(reioWidget, node.number);
  // }

  void initValue([Element? element]) {
    // Tags that are allowed in the element value.
    final List<String> possibleTags = [
      '<${Wbr().node.tag}>',
      '<${Br().node.tag}>'
    ];

    Element spanValue = document.createElement('span');
    bool isWithHtml = false;

    if (isUpdate) {
      ReioNode newNode = minorNode as ReioNode;

      // No element = no value in the element.
      if (newNode.element == null ||
          newNode.value == node.value && node.isOldValue(newNode.value)) return;

      // As a rule, the first child is the value.
      Node? childValue = newNode.element?.firstChild;
      if (childValue == null) return;

      for (String tag in possibleTags) {
        if (newNode.value.contains(tag)) {
          isWithHtml = true;
          break;
        }
      }

      if (isWithHtml) {
        spanValue.innerHtml = newNode.value;
        childValue.replaceWith(spanValue);
      } else {
        childValue.text = newNode.value;
      }
    } else {
      // No element = no value in the element.
      if (element == null || node.value.isEmpty) return;

      for (String tag in possibleTags) {
        if (node.value.contains(tag)) {
          isWithHtml = true;
          break;
        }
      }

      if (isWithHtml) {
        spanValue.innerHtml = node.value;
        element.append(spanValue);
      } else {
        element.appendText(node.value);
      }
    }
  }

  void initAttrs([Element? element]) {
    // final List<String> ignore = [reioWidget];

    if (isUpdate) {
      // No element = no attributes in the element.
      if (minorNode?.element == null || minorNode?.attrs == null) return;
      ReioNode newNode = minorNode as ReioNode;
      Element newElement = minorNode!.element as Element;

      if (compareMapOfList(
          node.attrs, newNode.attrs, (m) => m.name + m.value)) {
        return;
      }

      // Cleaning old attributes.
      List<String> keys = node.element!.attributes.keys.toList();
      List<String> newKeys = [];
      newNode.attrs?.toSet().forEach((attr) => newKeys.add(attr.name));
      for (var key in keys) {
        if (/* ignore.contains(key) || */ newKeys.contains(key)) continue;
        newElement.removeAttribute(key);
      }

      // Inserts new attributes.
      List<ReioNodeAttr> attrs = newNode.attrs as List<ReioNodeAttr>;
      for (ReioNodeAttr attr in attrs) {
        newElement.setAttribute(attr.name, attr.value);
      }
    } else {
      // No element = no attributes in the element.
      if (element == null || node.attrs == null) return;
      List<ReioNodeAttr> attrs = node.attrs as List<ReioNodeAttr>;

      for (ReioNodeAttr attr in attrs) {
        element.setAttribute(attr.name, attr.value);
      }
    }
  }

  void initChildren([Element? element]) {
    if (isUpdate) {
      if (minorNode?.element == null || minorNode?.children == null) return;
      List<ReioNode> newChildren = minorNode!.children as List<ReioNode>;

      if (node.children != null) {
        List<ReioNode> children = node.children as List<ReioNode>;

        // A loop that compares the children of
        // the current virtual_dom with the children of the new virtual_dom.
        for (int i = 0; i < min(children.length, newChildren.length); i++) {
          children[i].updateTo(newChildren[i]);
        }

        // If the new virtual_dom has fewer children than
        // the current one, the excess children are removed.
        if (children.length > newChildren.length) {
          children.sublist(newChildren.length).forEach((child) {
            return child.destroy();
          });
        }
      }

      // If the new virtual_dom has more children than
      // the current one, the children are added.
      int length = (node.children?.length != null) ? node.children!.length : 0;
      if (newChildren.length > length) {
        newChildren.sublist(length).forEach((child) {
          return child.init();
        });
      }
    } else {
      // No element = no attributes in the element.
      if (element == null || node.children == null) return;

      for (var child in node.children!) {
        child.init(element);
      }
    }
  }
}

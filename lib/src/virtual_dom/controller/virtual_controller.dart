import 'dart:html';
import 'dart:math';

import '../../expand/expand_list.dart';
import '../../widget/html/html.dart';
import '../node/virtual_node.dart';
import '../virtual_attr.dart';

/// Initializes or overwrites a [VirtualNode].
class VirtualController {
  final VirtualNode node;
  VirtualNode? minorNode;

  bool isUpdate = false;

  VirtualController(this.node, [this.minorNode]) {
    // The new virtual_dom, must update the old one,
    // so the update is true.
    if (minorNode != null) isUpdate = true;
  }

  // Ready-made code that can help at any time.
  // void initData([Element? element]) {
  //   if (element == null) return;
  //   element.setAttribute('reio-widget', node.number);
  // }

  void initValue([Element? element]) {
    // Tags that are allowed in the element value.
    final List<String> allowedTags = [wbr, br];
    Element spanValue = document.createElement('span');

    bool isWithHtml(String value) {
      for (String tag in allowedTags) {
        if (value.contains(tag)) return true;
      }
      return false;
    }

    if (isUpdate) {
      VirtualNode newNode = minorNode as VirtualNode;

      // No element = no value in the element.
      if (newNode.element == null ||
          newNode.value == node.value && node.isOldValue(newNode.value)) return;

      // As a rule, the first child is the value.
      Node? childValue = newNode.element?.firstChild;
      if (childValue == null) return;

      if (isWithHtml(newNode.value)) {
        spanValue.innerHtml = newNode.value;
        childValue.replaceWith(spanValue);
      } else {
        childValue.text = newNode.value;
      }
    } else {
      // No element = no value in the element.
      if (element == null || node.value.isEmpty) return;

      if (isWithHtml(node.value)) {
        spanValue.innerHtml = node.value;
        element.append(spanValue);
      } else {
        element.appendText(node.value);
      }
    }
  }

  void initAttrs([Element? element]) {
    // Ready-made code that can help at any time.
    // final List<String> ignore = ['reio-widget'];

    if (isUpdate) {
      // No element = no attributes in the element.
      if (minorNode?.element == null || minorNode?.attrs == null) return;
      VirtualNode newNode = minorNode as VirtualNode;
      Element newElement = minorNode!.element as Element;

      if (compareMapOfList(node.attrs, newNode.attrs, (m) {
        m as VirtualAttr;
        return m.name + m.value;
      })) {
        return;
      }

      // Cleaning old attributes.
      List<String> keys = node.element!.attributes.keys.toList();
      List<String> newKeys = [];
      newNode.attrs?.toSet().forEach((attr) => newKeys.add(attr.name));
      for (var key in keys) {
        // Ready-made code that can help at any time.
        if (/* ignore.contains(key) || */ newKeys.contains(key)) continue;
        newElement.removeAttribute(key);
      }

      // Inserts new attributes.
      List<VirtualAttr> attrs = newNode.attrs as List<VirtualAttr>;
      for (VirtualAttr attr in attrs) {
        newElement.setAttribute(attr.name, attr.value);
      }
    } else {
      // No element = no attributes in the element.
      if (element == null || node.attrs == null) return;
      List<VirtualAttr> attrs = node.attrs as List<VirtualAttr>;

      for (VirtualAttr attr in attrs) {
        element.setAttribute(attr.name, attr.value);
      }
    }
  }

  void initChildren([Element? element]) {
    if (isUpdate) {
      if (minorNode?.element == null || minorNode?.children == null) return;
      List<VirtualNode> newChildren = minorNode!.children as List<VirtualNode>;

      if (node.children != null) {
        List<VirtualNode> children = node.children as List<VirtualNode>;

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
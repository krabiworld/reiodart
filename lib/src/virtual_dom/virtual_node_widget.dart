// Copyright (c) MineEjo.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import 'dart:html';

import 'virtual_node.dart';

class ReioNodeWidget extends ReioNode {
  // Events that will be triggered after
  // the corresponding name has been activated.
  Function(Element)? onMount;
  Function()? onDestroy;
  Function()? onRemove;
  Function(Element)? onAdd;

  bool isMount = false;
  bool? isAdd;
  bool? isRemove;
  bool? isDestroy;

  //  HTML CSS styles: `<style>...<style>`.
  String? styles;

  /// Creates a node for the widget
  /// with its main functionality.
  ReioNodeWidget(
      {required super.tag,
      required super.value,
      super.attrs,
      super.children,
      this.onRemove,
      this.onAdd,
      this.onMount,
      this.onDestroy});

  /// Removes element from DOM, works only with HTML element,
  /// so easier to destroy.
  void remove() {
    if (element == null) return;

    // Removing an HTML element.
    element!.remove();

    // Event Calling.
    onRemove?.call();

    isAdd = false;
    isRemove = true;
  }

  /// Inserts element into parent,
  /// works only with HTML element,
  /// so easier to mount.
  void add(Element parent, int number) {
    if (element == null) return;

    if (parent.childNodes.length == number) {
      // If the number of elements equals the position,
      // then the element can be inserted
      // at the end of the array.
      parent.append(element!);
    } else {
      // Otherwise, it will be inserted
      // in the same position it was in before.
      parent.insertBefore(element!, parent.children[number]);
    }

    // Event Calling.
    onAdd?.call(element!);

    isAdd = false;
    isRemove = false;
  }

  @override
  void destroy() {
    // Removing an HTML element.
    element?.remove();
    element = null;

    // Event Calling.
    onDestroy?.call();

    isMount = false;
    isDestroy = true;
  }

  /// Initializes a [ReioNodeWidget] in the HTML DOM.
  /// Takes an [htmlNode] to insert into an element
  /// and [replace] to denote insertion
  /// in place of that element.
  @override
  void init([Node? htmlNode, bool? replace]) {
    // Saves the initial value.
    saveValue(value);

    final Element newElement = document.createElement(tag);
    ReioNodeWidgetController(this)
      // Ready-made code that can help at any time.
      // ..initData(newElement)
      ..initValue(newElement)
      ..initAttrs(newElement)
      ..initStyles(newElement)
      ..initChildren(newElement);
    element = newElement;

    // Mounting an element at once.
    if (htmlNode != null) {
      if (replace == true) {
        htmlNode.replaceWith(newElement);
      } else {
        htmlNode.append(newElement);
      }
    }

    // Event Calling.
    onMount?.call(element!);

    isMount = true;
    isDestroy = false;
  }

  /// Replaces the values of the old [ReioNodeWidget]
  /// with those of the new [ReioNodeWidget].
  @override
  void updateTo(ReioNode newNode) {
    newNode as ReioNodeWidget;

    // With different tags, recreates
    // a ReioNodeWidget in the same parent.
    if (tag != newNode.tag) {
      newNode.init(element?.parentNode);
      // This ReioNodeWidget is destroyed because
      // a new ReioNodeWidget has been created.
      destroy();
    } else {
      saveValue(newNode.value);

      // ReioNodeWidget does not have its own
      // element in the DOM at this stage,
      // but it must keep the data of the previous one.
      newNode.element = element;
      newNode.number = number;

      ReioNodeWidgetController(this, newNode)
        ..initValue()
        ..initAttrs()
        ..initStyles()
        ..initChildren();
    }
  }
}

const String styleHtmlTag = 'style';
const String stylePrefix = 'reio-style-';
const String styleQuery = '$styleHtmlTag.$stylePrefix';

/// Initializes or overwrites a [ReioNodeWidget].
class ReioNodeWidgetController extends ReioNodeController {
  ReioNodeWidgetController(super.node, [super.newNode]);

  void initStyles([Element? element]) {
    ReioNodeWidget curNode = node as ReioNodeWidget;

    if (curNode.styles == null) return;

    // Clears the line with
    // the style from the `<style>` tag.
    String? clearStyle(String? style) {
      return style
          ?.replaceFirst('<$styleHtmlTag>', '')
          .replaceFirst('</$styleHtmlTag>', '')
          .trim();
    }

    if (isUpdate) {
      // The style is updated only when there
      // is reactivity in it, that is, all the work
      // is on the watcher, and no additional
      // checks are required.

      Element? style =
          curNode.element?.querySelector(styleQuery + curNode.number);

      style?.text = clearStyle(curNode.styles);
    } else {
      if (element == null) return;

      Element style = StyleElement();
      style.className = stylePrefix + curNode.number;
      style.text = clearStyle(curNode.styles!);

      element.append(style);
    }
  }
}

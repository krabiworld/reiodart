// Copyright (c) MineEjo.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import 'dart:html';

import '../controller/virtual_controller_widget.dart';
import 'virtual_node.dart';

class VirtualNodeWidget extends VirtualNode {
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
  VirtualNodeWidget(
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

  /// Initializes a [VirtualNodeWidget] in the HTML DOM.
  /// Takes an [htmlNode] to insert into an element
  /// and [replace] to denote insertion
  /// in place of that element.
  @override
  void init([Node? htmlNode, bool? replace]) {
    // Saves the initial value.
    saveValue(value);

    final Element newElement = document.createElement(tag);
    VirtualControllerWidget(this)
      ..initData(newElement)
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

  /// Replaces the values of the old [VirtualNodeWidget]
  /// with those of the new [VirtualNodeWidget].
  @override
  void updateTo(VirtualNode newNode) {
    newNode as VirtualNodeWidget;

    // With different tags, recreates
    // a widget in the same parent.
    if (tag != newNode.tag) {
      newNode.init(element?.parentNode);
      // This widget is destroyed because
      // a new widget has been created.
      destroy();
    } else {
      saveValue(newNode.value);

      // The widget does not have its own
      // element in the DOM at this stage,
      // but it must keep the data of the previous one.
      newNode.element = element;
      newNode.number = number;

      VirtualControllerWidget(this, newNode)
        ..initValue()
        ..initAttrs()
        ..initStyles()
        ..initChildren();
    }
  }
}

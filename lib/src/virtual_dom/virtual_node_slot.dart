// Copyright (c) MineEjo.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import 'dart:html';

import 'virtual_node.dart';

class ReioNodeSlot extends ReioNode {
  ReioNodeSlot({super.tag = 'div', required super.value});

  @override
  void destroy() {
    // Removing an HTML element.
    element?.remove();
    element = null;
  }

  @override
  void init([Node? htmlNode]) {
    saveValue(value);

    final Element newElement = document.createElement(tag);
    newElement.id = value;
    element = newElement;

    // Mounting an element at once.
    if (htmlNode != null) htmlNode.append(newElement);
  }

  @override
  void updateTo(ReioNode newNode) {}
}

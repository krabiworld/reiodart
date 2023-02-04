// Copyright (c) MineEjo.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import 'dart:html';

import '../virtual_attr.dart';

int _totalGenerated = 0;

int _genWidgetNumber() => ++_totalGenerated;

abstract class VirtualNode {
  String tag;
  String value;
  List<VirtualAttr>? attrs;
  List<VirtualNode>? children;

  // Used as an identifier for a widget.
  String number = _genWidgetNumber().toString();

  // Contains the initial value and the actual value.
  List<String> values = [];

  bool isNewValue(String value) => (values.length > 1 && values[0] != value);

  bool isOldValue(String value) => (values.length == 1 && values[0] == value);

  // Stores the element from the DOM,
  // to change the HTML, because Reio uses virtual.
  Element? element;

  /// The virtual virtual_dom used in the virtual DOM
  /// tries to be similar to the HTML.
  VirtualNode({required this.tag, required this.value, this.attrs, this.children});

  void destroy();

  void init([Node? htmlNode]);

  void updateTo(VirtualNode newNode);

  void saveValue(dynamic value) {
    // Saves the original values, if there are more than 1,
    // for checking them in the future.
    // For example, to see if the new value was the original value.
    if (!values.contains(value)) {
      values.add(value);
      // if there are more than 1, it reverses the list and
      // trims the rest, leaving the initial and actual value.
      if (values.length > 1) values = values.reversed.toList().sublist(0, 2);
    }
  }
}

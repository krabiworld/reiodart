// Copyright (c) MineEjo.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import 'dart:html';

import '../../../virtual_dom/virtual_attr.dart';
import '../html_element.dart';
import '../html_element_visible.dart';

// Experimental, not standard or obsolete tags and attributes
// are not and will not be implemented. If you notice this,
// send it as a issue to https://github.com/MineEjo/reiodart/issues
// Adapted for HTML version 5.

/// Contains [WidgetElement] that contains a virtual node
/// with the `<li>` tag.
class Li extends WidgetElementVisible {
  /// The `<li>` HTML element is used
  /// to represent an item in a list.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/li)
  Li([super.value]) {
    tag = 'li';
  }

  /// This attribute indicates the current
  /// ordinal value of the list item
  /// as defined by the `<ol>` element.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/li#attr-value)
  Li value(int number, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('value', number.toString());
      node.attrs!.add(attr);
    }
    return this;
  }

  /// The scroll event fires when an element
  /// has been scrolled.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/Element/scroll_event)
  Li onScroll(Function(Element, Event)? fun) {
    if (fun != null) on.call('scroll', fun);
    return this;
  }
}

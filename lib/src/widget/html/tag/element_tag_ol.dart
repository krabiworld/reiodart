// Copyright (c) MineEjo.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import 'dart:html';

import '../../../virtual_dom/virtual_node_attr.dart';
import '../html_element.dart';
import '../html_element_visible.dart';

// Experimental, not standard or obsolete tags and attributes
// are not and will not be implemented. If you notice this,
// send it as a issue to https://github.com/MineEjo/reiodart/issues
// Adapted for HTML version 5.

/// Contains [ReioElement] that contains a virtual_dom
/// with the `<ol>` tag.
class Ol extends ReioElementVisible {
  /// The `<ol>` HTML element represents an ordered list
  /// of items — typically rendered as a numbered list.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/ol)
  Ol([super.value]) {
    setHtmlTag('ol');
  }

  /// The scroll event fires when an element
  /// has been scrolled.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/Element/scroll_event)
  Ol onScroll(Function(Element, Event)? fun) {
    if (fun != null) on.call('scroll', fun);
    return this;
  }

  /// This attribute specifies that
  /// the list's items are in reverse order.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/ol#attr-reversed)
  Ol reversed(bool boolean) {
    if (boolean && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('reversed', '');
      node.attrs!.add(attr);
    }
    return this;
  }

  /// Start counting from for the list items.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/ol#attr-start)
  Ol start(int number, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('start', number.toString());
      node.attrs!.add(attr);
    }
    return this;
  }

  /// Sets the numbering type.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/ol#attr-type)
  Ol type(String numberingType, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('type', numberingType);
      node.attrs!.add(attr);
    }
    return this;
  }
}

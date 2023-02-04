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

/// Contains [WidgetElement] that contains a virtual_dom
/// with the `<blockquote>` tag.
class BlockQuote extends WidgetElementVisible {
  /// The `<blockquote>` HTML element indicates
  /// that the enclosed text is an extended quotation.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/blockquote)
  BlockQuote([super.value]) {
    tag = 'blockquote';
  }

  /// The scroll event fires when an element
  /// has been scrolled.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/Element/scroll_event)
  BlockQuote onScroll(Function(Element, Event)? fun) {
    if (fun != null) on.call('scroll', fun);
    return this;
  }

  /// A URL that designates a source document
  /// or message for the information quoted.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/blockquote#attr-cite)
  BlockQuote cite(String url, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('cite', url);
      node.attrs!.add(attr);
    }
    return this;
  }
}

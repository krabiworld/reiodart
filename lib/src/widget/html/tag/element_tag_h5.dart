// Copyright (c) MineEjo.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import 'dart:html';

import '../html_element.dart';
import '../html_element_visible.dart';

// Experimental, not standard or obsolete tags and attributes
// are not and will not be implemented. If you notice this,
// send it as a issue to https://github.com/MineEjo/reiodart/issues
// Adapted for HTML version 5.

/// Contains [ReioElement] that contains a virtual_dom
/// with the `<h5>` tag.
class H5 extends ReioElementVisible {
  /// The `<h1>` to `<h6>` HTML element represents
  /// a document section containing interactive controls
  /// for submitting information.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/Heading_Elements)
  H5([super.value]) {
    setHtmlTag('h5');
  }

  /// The scroll event fires when an element
  /// has been scrolled.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/Element/scroll_event)
  H5 onScroll(Function(Element, Event)? fun) {
    if (fun != null) on.call('scroll', fun);
    return this;
  }
}

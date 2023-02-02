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
/// with the `<dt>` tag.
class Dt extends ReioElementVisible {
  /// The `<dt>` HTML element specifies
  /// a term in a description or definition list,
  /// and as such must be used inside
  /// a `<dl>` element.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/dt)
  Dt([super.value]) {
    setHtmlTag('dt');
  }

  /// The scroll event fires when an element
  /// has been scrolled.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/Element/scroll_event)
  Dt onScroll(Function(Element, Event)? fun) {
    if (fun != null) on.call('scroll', fun);
    return this;
  }
}

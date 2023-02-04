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

/// Contains [WidgetElement] that contains a virtual node
/// with the `<menu>` tag.
class Menu extends WidgetElementVisible {
  /// The `<menu>` HTML element is described
  /// in the HTML specification as a semantic
  /// alternative to `<ul>`, but treated by browsers
  /// (and exposed through the accessibility tree)
  /// as no different than `<ul>`.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/menu)
  Menu([super.value]) {
    tag = 'menu';
  }

  /// The scroll event fires when an element
  /// has been scrolled.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/Element/scroll_event)
  Menu onScroll(Function(Element, Event)? fun) {
    if (fun != null) on.call('scroll', fun);
    return this;
  }
}

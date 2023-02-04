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

/// Contains [WidgetElement] that contains a virtual_dom
/// with the `<tbody>` tag.
class TBody extends WidgetElementVisible {
  /// The `<tbody>` HTML element encapsulates a set
  /// of table rows (`<tr>` elements),
  /// indicating that they comprise the body of the table (`<table>`).
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/tbody)
  TBody([super.value]) {
    tag = 'tbody';
  }

  /// The scroll event fires when an element
  /// has been scrolled.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/Element/scroll_event)
  TBody onScroll(Function(Element, Event)? fun) {
    if (fun != null) on.call('scroll', fun);
    return this;
  }
}

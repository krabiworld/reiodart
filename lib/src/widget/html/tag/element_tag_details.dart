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
/// with the `<details>` tag.
class Details extends WidgetElementVisible {
  /// The `<details>` HTML element creates
  /// a disclosure widget in which information
  /// is visible only when the widget
  /// is toggled into an "open" state.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/details)
  Details([super.value]) {
    tag = 'details';
  }

  /// The toggle event fires when the open/closed
  /// state of a `<details>` element is toggled.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/HTMLDetailsElement/toggle_event)
  Details onToggle(Function(Element, Event)? fun) {
    if (fun != null) on.call('toggle', fun);
    return this;
  }

  /// This attribute indicates whether the details
  /// — that is, the contents of the `<details>`
  /// element — are currently visible.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/details#attr-open)
  Details open(bool boolean) {
    if (boolean && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('open', '');
      node.attrs!.add(attr);
    }
    return this;
  }
}

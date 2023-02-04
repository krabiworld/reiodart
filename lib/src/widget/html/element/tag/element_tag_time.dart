// Copyright (c) MineEjo.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import '../../../../virtual_dom/virtual_attr.dart';
import '../html_element.dart';
import '../html_element_visible.dart';

// Experimental, not standard or obsolete tags and attributes
// are not and will not be implemented. If you notice this,
// send it as a issue to https://github.com/MineEjo/reiodart/issues
// Adapted for HTML version 5.

/// Contains [WidgetElement] that contains a virtual node
/// with the `<time>` tag.
class Time extends WidgetElementVisible {
  /// The `<time>` HTML element represents
  /// a specific period in time.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/time)
  Time([super.value]) {
    tag = 'time';
  }

  /// This attribute indicates the time and/or
  /// date of the element and must be in one
  /// of the formats described below.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/time#attr-datetime)
  Time dateTime(String time, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('datetime', time);
      node.attrs!.add(attr);
    }
    return this;
  }
}

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
/// with the `<colgroup>` tag.
class ColGroup extends WidgetElementVisible {
  /// The `<colgroup>` HTML element defines a group
  /// of columns within a table.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/colgroup)
  ColGroup([super.value]) {
    tag = 'colgroup';
  }

  /// This attribute contains a positive integer
  /// indicating the number of consecutive columns
  /// the `<colgroup>` element spans.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/colgroup#attr-span)
  ColGroup span(int number, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('span', number.toString());
      node.attrs!.add(attr);
    }
    return this;
  }
}

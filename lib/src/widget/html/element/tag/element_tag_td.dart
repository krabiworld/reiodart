// Copyright (c) MineEjo.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import '../../../../virtual_dom/virtual_attr.dart';
import '../../html.dart';
import '../html_element.dart';
import '../html_element_visible.dart';

// Experimental, not standard or obsolete tags and attributes
// are not and will not be implemented. If you notice this,
// send it as a issue to https://github.com/MineEjo/reiodart/issues
// Adapted for HTML version 5.

WidgetHtml _html = WidgetHtml();

/// Contains [WidgetElement] that contains a virtual node
/// with the `<td>` tag.
class Td extends WidgetElementVisible {
  /// The `<td>` HTML element defines a cell
  /// of a table that contains data.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/td)
  Td([super.value]) {
    tag = 'td';
  }

  /// This attribute contains a non-negative
  /// integer value that indicates
  /// for how many columns the cell extends.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/td#attr-colspan)
  Td colSpan(int number, {bool? removeIf}) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('colspan', number.toString());
      node.attrs!.add(attr);
    }
    return this;
  }

  /// This attribute contains a list each corresponding
  /// to the id attribute of the `<th>` elements
  /// that apply to this element.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/td#attr-headers)
  Td headers(List<String> idList, {bool? removeIf}) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('headers', _html.listToSpaces(idList));
      node.attrs!.add(attr);
    }
    return this;
  }

  /// This attribute contains a non-negative
  /// integer value that indicates
  /// for how many rows the cell extends.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/td#attr-rowspan)
  Td rowSpan(int number, {bool? removeIf}) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('rowspan', number.toString());
      node.attrs!.add(attr);
    }
    return this;
  }
}

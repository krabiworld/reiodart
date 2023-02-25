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
/// with the `<th>` tag.
class Th extends WidgetElementVisible {
  /// The `<th>` HTML element defines a cell as header
  /// of a group of table cells.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/th)
  Th([super.value]) {
    tag = 'th';
  }

  /// This attribute contains a short abbreviated
  /// description of the cell's content.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/th#attr-abbr)
  Th abbr(String text, {bool? removeIf}) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('abbr', text);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// This attribute contains a non-negative
  /// integer value that indicates
  /// for how many columns the cell extends.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/th#attr-colspan)
  Th colSpan(int number, {bool? removeIf}) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('colspan', number.toString());
      node.attrs!.add(attr);
    }
    return this;
  }

  /// This attribute contains a list each corresponding
  /// to the id attribute of the `<th>` elements
  /// that apply to this element.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/th#attr-headers)
  Th headers(List<String> idList, {bool? removeIf}) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('headers', _html.listToSpaces(idList));
      node.attrs!.add(attr);
    }
    return this;
  }

  /// This attribute contains a non-negative
  /// integer value that indicates
  /// for how many rows the cell extends.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/th#attr-rowspan)
  Th rowSpan(int number, {bool? removeIf}) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('rowspan', number.toString());
      node.attrs!.add(attr);
    }
    return this;
  }

  /// This attribute defines the cells
  /// that the header (defined in the `<th>`)
  /// element relates to.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/th#attr-scope)
  Th scope(String value, {bool? removeIf}) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('scope', value);
      node.attrs!.add(attr);
    }
    return this;
  }
}

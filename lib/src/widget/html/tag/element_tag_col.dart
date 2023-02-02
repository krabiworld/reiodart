// Copyright (c) MineEjo.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import '../../../virtual_dom/virtual_node_attr.dart';
import '../html_element.dart';
import '../html_element_visible.dart';

// Experimental, not standard or obsolete tags and attributes
// are not and will not be implemented. If you notice this,
// send it as a issue to https://github.com/MineEjo/reiodart/issues
// Adapted for HTML version 5.

/// Contains [ReioElement] that contains a virtual_dom
/// with the `<col>` tag.
class Col extends ReioElementVisible {
  /// The `<col>` HTML element defines
  /// a column within a table and is used
  /// for defining common semantics
  /// on all common cells.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/col)
  Col([super.value]) {
    setHtmlTag('col');
  }

  /// This attribute contains a positive integer
  /// indicating the number of consecutive columns
  /// the `<col>` element spans.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/col#attr-span)
  Col span(int number, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('span', number.toString());
      node.attrs!.add(attr);
    }
    return this;
  }
}

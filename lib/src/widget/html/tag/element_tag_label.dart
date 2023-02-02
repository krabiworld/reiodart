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
/// with the **`<label>`** tag.
class Label extends ReioElementVisible {
  /// The **`<label>`** HTML element represents a caption
  /// for an item in a user interface.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/label)
  Label([super.value]) {
    setHtmlTag('label');
  }

  /// The value of the for attribute must be a single id
  /// for a labelable form-related element in the same
  /// document as the `<label>` element.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/label#attr-for)
  Label thisFor(String id, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('for', id);
      node.attrs!.add(attr);
    }
    return this;
  }
}

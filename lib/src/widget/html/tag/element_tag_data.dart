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
/// with the `<data>` tag.
class Data extends ReioElementVisible {
  /// The `<data>` HTML element links a given piece
  /// of content with a machine-readable translation.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/data)
  Data([super.value]) {
    setHtmlTag('data');
  }

  /// This attribute specifies the machine-readable
  /// translation of the content of the element.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/data#attr-value)
  Data value(dynamic value, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('value', value.toString());
      node.attrs!.add(attr);
    }
    return this;
  }
}

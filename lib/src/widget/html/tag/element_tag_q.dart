// Copyright (c) MineEjo.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import '../../../virtual_dom/virtual_attr.dart';
import '../html_element.dart';
import '../html_element_visible.dart';

// Experimental, not standard or obsolete tags and attributes
// are not and will not be implemented. If you notice this,
// send it as a issue to https://github.com/MineEjo/reiodart/issues
// Adapted for HTML version 5.

/// Contains [WidgetElement] that contains a virtual node
/// with the `<q>` tag.
class Q extends WidgetElementVisible {
  /// The `<q>` HTML element indicates
  /// that the enclosed text
  /// is a short inline quotation.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/q)
  Q([super.value]) {
    tag = 'q';
  }

  /// The value of this attribute is a URL
  /// that designates a source document
  /// or message for the information quoted.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/q#attr-cite)
  WidgetElement cite(String url, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('cite', url);
      node.attrs!.add(attr);
    }
    return this;
  }
}

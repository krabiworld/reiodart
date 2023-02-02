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
/// with the `<q>` tag.
class Q extends ReioElementVisible {
  /// The `<q>` HTML element indicates
  /// that the enclosed text
  /// is a short inline quotation.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/q)
  Q([super.value]) {
    setHtmlTag('q');
  }

  /// The value of this attribute is a URL
  /// that designates a source document
  /// or message for the information quoted.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/q#attr-cite)
  ReioElement cite(String url, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('cite', url);
      node.attrs!.add(attr);
    }
    return this;
  }
}

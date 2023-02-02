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
/// with the `<`del`>` tag.
class Del extends ReioElementVisible {
  /// The `<`del`>` HTML element represents
  /// a range of text that has been deleted
  /// from a document.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/del)
  Del([super.value]) {
    setHtmlTag('del');
  }

  /// A URL for a resource that explains the change
  /// (for example, meeting minutes).
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/del#attr-cite)
  Del cite(String url, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('cite', url);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// This attribute indicates the time and date of
  /// the change and must be a valid date string
  /// with an optional time.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/del#attr-datetime)
  Del dateTime(String time, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('datetime', time);
      node.attrs!.add(attr);
    }
    return this;
  }
}

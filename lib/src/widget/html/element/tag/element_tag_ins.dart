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
/// with the `<ins>` tag.
class Ins extends WidgetElementVisible {
  /// The `<ins>` HTML element represents
  /// a range of text that has been added to a document.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/ins)
  Ins([super.value]) {
    tag = 'ins';
  }

  /// This attribute defines the URI of a resource
  /// that explains the change, such as a link
  /// to meeting minutes or a ticket in a troubleshooting system.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/ins#attr-cite)
  Ins cite(String url, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('cite', url);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// This attribute indicates the time and date
  /// of the change and must be a valid
  /// date with an optional time string.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/ins#attr-datetime)
  Ins dateTime(String time, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('datetime', time);
      node.attrs!.add(attr);
    }
    return this;
  }
}

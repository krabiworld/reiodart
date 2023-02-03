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
/// with the `<optgroup>` tag.
class OptGroup extends ReioElementVisible {
  /// The `<optgroup>` HTML element creates a grouping
  /// of options within a `<select>` element.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/optgroup)
  OptGroup([super.value]) {
    tag = 'optgroup';
  }

  /// If this attribute is set, none
  /// of the items in this option group is selectable.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/optgroup#attr-disabled)
  OptGroup disabled(bool boolean) {
    if (boolean && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('disabled', '');
      node.attrs!.add(attr);
    }
    return this;
  }

  /// The name of the group of options,
  /// which the browser can use when labeling
  /// the options in the user interface.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/optgroup#attr-label)
  OptGroup label(String text, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('label', text);
      node.attrs!.add(attr);
    }
    return this;
  }
}

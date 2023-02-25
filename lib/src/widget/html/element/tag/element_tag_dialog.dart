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
/// with the `<dialog>` tag.
class Dialog extends WidgetElementVisible {
  /// The `<dialog>` HTML element represents
  /// a dialog box or other interactive widget,
  /// such as a dismissible alert, inspector, or sub-window.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/dialog)
  Dialog([super.value]) {
    tag = 'dialog';
  }

  /// Indicates that the dialog is active
  /// and can be interacted with.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/dialog#attr-open)
  Dialog open(bool boolean) {
    if (boolean && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('open', '');
      node.attrs!.add(attr);
    }
    return this;
  }
}

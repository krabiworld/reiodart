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
/// with the `<option>` tag.
class Option extends WidgetElementVisible {
  /// The `<option>` HTML element is used
  /// to define an item contained in a `<select>`, an `<optgroup>`,
  /// or a `<datalist>` element.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/option)
  Option([super.value]) {
    tag = 'option';
  }

  /// If this attribute is set,
  /// this option is not clickable.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/option#attr-disabled)
  Option disabled(bool boolean) {
    if (boolean && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('disabled', '');
      node.attrs!.add(attr);
    }
    return this;
  }

  /// This attribute is text for the label
  /// indicating the meaning of the option.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/option#attr-label)
  Option label(String text, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('label', text);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// If present, this attribute indicates
  /// that the option is initially selected.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/option#attr-selected)
  Option selected(bool boolean) {
    if (boolean && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('selected', '');
      node.attrs!.add(attr);
    }
    return this;
  }

  /// The content of this attribute represents
  /// the value to be submitted with the form,
  /// should this option be selected.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/option#attr-value)
  Option value(dynamic value, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('value', value.toString());
      node.attrs!.add(attr);
    }
    return this;
  }
}

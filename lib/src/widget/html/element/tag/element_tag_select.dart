// Copyright (c) MineEjo.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import 'dart:html';

import '../../../../virtual_dom/virtual_attr.dart';
import '../html_element.dart';
import '../html_element_visible.dart';

// Experimental, not standard or obsolete tags and attributes
// are not and will not be implemented. If you notice this,
// send it as a issue to https://github.com/MineEjo/reiodart/issues
// Adapted for HTML version 5.

/// Contains [WidgetElement] that contains a virtual node
/// with the `<select>` tag.
class Select extends WidgetElementVisible {
  /// The `<select>` HTML element represents
  /// a control that provides a menu of options.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/select)
  Select([super.value]) {
    tag = 'select';
  }

  /// The scroll event fires when an element
  /// has been scrolled.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/Element/scroll_event)
  Select onScroll(Function(Element, Event)? fun) {
    if (fun != null) on.call('scroll', fun);
    return this;
  }

  /// The change event is fired for `<input>,`
  /// `<select>`, and `<textarea>` elements when
  /// the user modifies the element's value.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/change_event)
  Select onChange(Function(Element, Event)? fun) {
    if (fun != null) on.call('change', fun);
    return this;
  }

  /// A string providing a hint
  /// for a user agent's autocomplete feature.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/select#attr-autocomplete)
  Select autoComplete(String value, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('autocomplete', value);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// This attribute indicates that
  /// the user cannot interact with the control.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/select#attr-disabled)
  Select disabled(bool boolean) {
    if (boolean && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('disabled', '');
      node.attrs!.add(attr);
    }
    return this;
  }

  /// The `<form>` element to associate
  /// the `<select>` with (its form owner).
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/select#attr-form)
  Select form(String id, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('form', id);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// This attribute indicates that multiple
  /// options can be selected in the list.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/select#attr-multiple)
  Select multiple(bool boolean) {
    if (boolean && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('multiple', '');
      node.attrs!.add(attr);
    }
    return this;
  }

  /// This attribute is used to specify
  /// the name of the control.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/select#attr-name)
  Select name(String name, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('name', name);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// A attribute indicating that an option
  /// with a non-empty string value must be selected.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/select#attr-required)
  Select required(bool boolean) {
    if (boolean && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('required', '');
      node.attrs!.add(attr);
    }
    return this;
  }

  /// If the control is presented as a scrolling list box
  /// (e.g. when multiple is specified),
  /// this attribute represents the number of rows in
  /// the list that should be visible at one time.
  /// Browsers are not required to present
  /// a select element as a scrolled list box.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/select#attr-size)
  Select size(int number, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('size', number.toString());
      node.attrs!.add(attr);
    }
    return this;
  }
}

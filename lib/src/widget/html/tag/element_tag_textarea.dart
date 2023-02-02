// Copyright (c) MineEjo.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import 'dart:html';

import '../../../virtual_dom/virtual_node_attr.dart';
import '../html_element.dart';
import '../html_element_visible.dart';

// Experimental, not standard or obsolete tags and attributes
// are not and will not be implemented. If you notice this,
// send it as a issue to https://github.com/MineEjo/reiodart/issues
// Adapted for HTML version 5.

/// Contains [ReioElement] that contains a virtual_dom
/// with the `<textarea>` tag.
class TextArea extends ReioElementVisible {
  /// The `<textarea>` HTML element represents a multi-line
  /// plain-text editing control, useful when you want to allow users
  /// to enter a sizeable amount of free-form text,
  /// for example a comment on a review or feedback form.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/textarea)
  TextArea([super.value]) {
    setHtmlTag('textarea');
  }

  /// The select event fires when some
  /// text has been selected.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/HTMLTextAreaElement/select_event)
  TextArea onSelect(Function(Element, Event)? fun) {
    if (fun != null) on.call('select', fun);
    return this;
  }

  /// The scroll event fires when an element
  /// has been scrolled.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/Element/scroll_event)
  TextArea onScroll(Function(Element, Event)? fun) {
    if (fun != null) on.call('scroll', fun);
    return this;
  }

  /// The input event fires when the value
  /// of an `<input>`, `<select>`, or `<textarea>`
  /// element has been changed.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/input_event)
  TextArea onInput(Function(Element, Event)? fun) {
    if (fun != null) on.call('input', fun);
    return this;
  }

  /// The change event is fired for `<input>,`
  /// `<select>`, and `<textarea>` elements when
  /// the user modifies the element's value.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/change_event)
  TextArea onChange(Function(Element, Event)? fun) {
    if (fun != null) on.call('change', fun);
    return this;
  }

  /// This attribute indicates whether the value
  /// of the control can be automatically completed
  /// by the browser.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/textarea#attr-autocomplete)
  TextArea autoComplete(String value, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('autocomplete', value);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// The visible width of the text control,
  /// in average character widths.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/textarea#attr-cols)
  TextArea cols(int number, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('cols', number.toString());
      node.attrs!.add(attr);
    }
    return this;
  }

  /// This attribute indicates
  /// that the user cannot interact with the control.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/textarea#attr-disabled)
  TextArea disabled(bool boolean) {
    if (boolean && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('disabled', '');
      node.attrs!.add(attr);
    }
    return this;
  }

  /// The form element that the `<textarea>` element
  /// is associated with (its "form owner").
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/textarea#attr-form)
  TextArea form(String id, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('form', id);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// The maximum number of characters
  /// (UTF-16 code units) that the user can enter.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/textarea#attr-maxlength)
  TextArea maxLength(num number, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('maxlength', number.toString());
      node.attrs!.add(attr);
    }
    return this;
  }

  /// The minimum number of characters
  /// (UTF-16 code units) required
  /// that the user should enter.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/textarea#attr-minlength)
  TextArea minLength(num number, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('minlength', number.toString());
      node.attrs!.add(attr);
    }
    return this;
  }

  /// The name of the control.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/textarea#attr-name)
  TextArea name(String name, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('name', name);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// A hint to the user of what can
  /// be entered in the control.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/textarea#attr-placeholder)
  TextArea placeholder(String text, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('placeholder', text);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// This attribute indicates
  /// that the user cannot modify
  /// the value of the control.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/textarea#attr-readonly)
  TextArea readOnly(bool boolean) {
    if (boolean && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('readonly', '');
      node.attrs!.add(attr);
    }
    return this;
  }

  /// This attribute specifies
  /// that the user must fill
  /// in a value before submitting a form.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/textarea#attr-required)
  TextArea required(bool boolean) {
    if (boolean && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('required', '');
      node.attrs!.add(attr);
    }
    return this;
  }

  /// The number of visible text lines for the control.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/textarea#attr-rows)
  TextArea rows(int number, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('rows', number.toString());
      node.attrs!.add(attr);
    }
    return this;
  }

  /// Indicates how the control should wrap
  /// the value for form submission.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/textarea#attr-wrap)
  TextArea wrap(String value, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('wrap', value);
      node.attrs!.add(attr);
    }
    return this;
  }
}

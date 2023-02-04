// Copyright (c) MineEjo.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import 'dart:html';

import '../../../virtual_dom/virtual_attr.dart';
import '../html_element.dart';
import '../html_element_visible.dart';

// Experimental, not standard or obsolete tags and attributes
// are not and will not be implemented. If you notice this,
// send it as a issue to https://github.com/MineEjo/reiodart/issues
// Adapted for HTML version 5.

/// Contains [WidgetElement] that contains a virtual node
/// with the `<input>` tag.
class Input extends WidgetElementVisible {
  /// The `<input>` HTML element is used
  /// to create interactive controls for web-based
  /// forms in order to accept data from the user.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input)
  Input(dynamic value) {
    tag = 'input';

    /// The initial value of the control.
    /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input#value)
    VirtualAttr attr = VirtualAttr('value', value.toString());
    node.attrs!.add(attr);
  }

  /// The select event fires when some
  /// text has been selected.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/HTMLInputElement/select_event)
  Input onSelect(Function(Element, Event)? fun) {
    if (fun != null) on.call('select', fun);
    return this;
  }

  /// The load event is fired when the whole
  /// page has loaded, including all dependent
  /// resources such as stylesheets, scripts,
  /// iframes, and images.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/Window/load_event)
  Input onLoad(Function(Element, Event)? fun) {
    if (fun != null) on.call('load', fun);
    return this;
  }

  /// The invalid event fires when a submittable
  /// element has been checked for validity
  /// and doesn't satisfy its constraints.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/HTMLInputElement/invalid_event)
  Input onInvalid(Function(Element, Event)? fun) {
    if (fun != null) on.call('invalid', fun);
    return this;
  }

  /// The input event fires when the value
  /// of an `<input>`, `<select>`, or `<textarea>`
  /// element has been changed.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/input_event)
  Input onInput(Function(Element, Event)? fun) {
    if (fun != null) on.call('input', fun);
    return this;
  }

  /// The change event is fired for `<input>,`
  /// `<select>`, and `<textarea>` elements when
  /// the user modifies the element's value.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/change_event)
  Input onChange(Function(Element, Event)? fun) {
    if (fun != null) on.call('change', fun);
    return this;
  }

  /// Hint for expected file type
  /// in file upload controls.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input#accept)
  Input accept(String type, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('accept', type);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// Alt attribute for the image type.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input#alt)
  Input alt(String text, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('alt', text);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// Hint for form autofill feature.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input#autocomplete)
  Input autoComplete(String value, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('autocomplete', value);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// Media capture input method in file upload controls.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input#capture)
  Input capture(String media, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('capture', media);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// Whether the command or control is checked.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input#checked)
  Input checked(bool boolean) {
    if (boolean && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('checked', '');
      node.attrs!.add(attr);
    }
    return this;
  }

  /// Name of form field to use for sending
  /// the element's directionality in form submission.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input#dirname)
  Input dirName(String name, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('dirname', name);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// Whether the form control is disabled.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input#disabled)
  Input disabled(bool boolean) {
    if (boolean && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('disabled', '');
      node.attrs!.add(attr);
    }
    return this;
  }

  /// Associates the control with a form element.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input#form)
  Input form(String id, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('form', id);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// URL to use for form submission.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input#formaction)
  Input formAction(String url, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('formaction', url);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// Form data set encoding type to use
  /// for form submission.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input#formenctype)
  Input formEncType(String value, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('formenctype', value);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// HTTP method to use for form submission.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input#formmethod)
  Input formMethod(String method, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('formmethod', method);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// Bypass form control validation for form submission.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input#formnovalidate)
  Input formNoValidate(bool boolean) {
    if (boolean && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('formnovalidate', '');
      node.attrs!.add(attr);
    }
    return this;
  }

  /// Browsing context for form submission.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input#formtarget)
  Input formTarget(String context, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('formtarget', context);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// Same as height attribute for `<img>`.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input#height)
  Input height(int pixels, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('height', pixels.toString());
      node.attrs!.add(attr);
    }
    return this;
  }

  /// Value of the id attribute of the
  /// `<datalist>` of autocomplete options.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input#list)
  Input list(String id, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('list', id);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// Maximum value.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input#max)
  Input max(dynamic value, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('max', value.toString());
      node.attrs!.add(attr);
    }
    return this;
  }

  /// Maximum length (number of characters) of value.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input#maxlength)
  Input maxLength(num number, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('maxlength', number.toString());
      node.attrs!.add(attr);
    }
    return this;
  }

  /// Minimum value.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input#min)
  Input min(dynamic value, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('min', value.toString());
      node.attrs!.add(attr);
    }
    return this;
  }

  /// Minimum length (number of characters) of value.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input#minlength)
  Input minLength(num number, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('minlength', number.toString());
      node.attrs!.add(attr);
    }
    return this;
  }

  /// Whether to allow multiple values.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input#multiple)
  Input multiple(bool boolean) {
    if (boolean && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('multiple', '');
      node.attrs!.add(attr);
    }
    return this;
  }

  /// Name of the form control.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input#name)
  Input name(String name, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('name', name);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// Pattern the value must match to be valid.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input#pattern)
  Input pattern(RegExp exp, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('pattern', exp.pattern);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// Text that appears in the form control
  /// when it has no value set.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input#placeholder)
  Input placeholder(String text, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('placeholder', text);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// The value is not editable.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input#readonly)
  Input readOnly(bool boolean) {
    if (boolean && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('readonly', '');
      node.attrs!.add(attr);
    }
    return this;
  }

  /// A value is required
  /// or must be check for the form to be submittable.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input#required)
  Input required(bool boolean) {
    if (boolean && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('required', '');
      node.attrs!.add(attr);
    }
    return this;
  }

  /// Size of the control.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input#size)
  Input size(int number, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('size', number.toString());
      node.attrs!.add(attr);
    }
    return this;
  }

  /// Same as src attribute for `<img>`.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input#src)
  Input src(String url, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('src', url);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// Incremental values that are valid.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input#step)
  Input step(int number, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('step', number.toString());
      node.attrs!.add(attr);
    }
    return this;
  }

  /// Type of form control.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input#type)
  Input type(String inputTypes, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('type', inputTypes);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// Same as width attribute for `<img>`.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input#width)
  Input width(int pixels, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('width', pixels.toString());
      node.attrs!.add(attr);
    }
    return this;
  }
}

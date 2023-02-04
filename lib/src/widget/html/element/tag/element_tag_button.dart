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
/// with the **`<button>`** tag.
class Button extends WidgetElementVisible {
  /// The **`<button>`** HTML element is an interactive
  /// element activated by a user with a mouse,
  /// keyboard, finger, voice command,
  /// or other assistive technology.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/button)
  Button([super.value]) {
    tag = 'button';
  }

  /// This attribute prevents the user from interacting
  /// with the button: it cannot be pressed or focused.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/button#attr-disabled)
  Button disabled(bool boolean) {
    if (boolean && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('disabled', '');
      node.attrs!.add(attr);
    }
    return this;
  }

  /// The `<form>` element to associate
  /// the button with (its form owner).
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/button#attr-form)
  Button form(String id, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('form', id);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// The URL that processes the information
  /// submitted by the button.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/button#attr-formaction)
  Button formAction(String url, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('formaction', url);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// Specifies how to encode the form data
  /// that is submitted.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/button#attr-formenctype)
  Button formEncType(String value, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('formenctype', value);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// This attribute specifies the HTTP method
  /// used to submit the form.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/button#attr-formmethod)
  Button formMethod(String method, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('formmethod', method);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// This attribute specifies
  /// that the form is not to be validated
  /// when it is submitted.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/button#attr-formnovalidate)
  Button formNoValidate(bool boolean) {
    if (boolean && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('formnovalidate', '');
      node.attrs!.add(attr);
    }
    return this;
  }

  /// This attribute is an author-defined name
  /// or standardized, underscore-prefixed keyword
  /// indicating where to display the response
  /// from submitting the form.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/button#attr-formtarget)
  Button formTarget(String context, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('formtarget', context);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// The name of the button, submitted as a pair
  /// with the button's value as part of the form data,
  /// when that button is used to submit the form.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/button#attr-name)
  Button name(String name, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('name', name);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// The default behavior of the button.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/button#attr-type)
  Button type(String mediaType, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('type', mediaType);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// Defines the value associated with the button's
  /// name when it's submitted with the form data.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/button#attr-value)
  Button value(dynamic value, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('value', value.toString());
      node.attrs!.add(attr);
    }
    return this;
  }
}

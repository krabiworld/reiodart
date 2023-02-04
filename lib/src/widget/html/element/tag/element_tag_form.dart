// Copyright (c) MineEjo.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import 'dart:html';

import '../../../../virtual_dom/virtual_attr.dart';
import '../../html.dart';
import '../html_element.dart';
import '../html_element_visible.dart';

// Experimental, not standard or obsolete tags and attributes
// are not and will not be implemented. If you notice this,
// send it as a issue to https://github.com/MineEjo/reiodart/issues
// Adapted for HTML version 5.

WidgetHtml _html = WidgetHtml();

/// Contains [WidgetElement] that contains a virtual node
/// with the `<form>` tag.
class Form extends WidgetElementVisible {
  /// The `<form>` HTML element represents
  /// a document section containing interactive controls
  /// for submitting information.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/form)
  Form([super.value]) {
    tag = 'form';
  }

  /// The submit event fires when a `<form>` is submitted.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/HTMLFormElement/submit_event)
  Form onSubmit(Function(Element, Event)? fun) {
    if (fun != null) on.call('submit', fun);
    return this;
  }

  /// The scroll event fires when an element
  /// has been scrolled.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/Element/scroll_event)
  Form onScroll(Function(Element, Event)? fun) {
    if (fun != null) on.call('scroll', fun);
    return this;
  }

  /// The reset event fires when a `<form>` is reset.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/HTMLFormElement/reset_event)
  Form onReset(Function(Element, Event)? fun) {
    if (fun != null) on.call('reset', fun);
    return this;
  }

  /// Character encodings the server accepts.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/form#attr-accept-charset)
  Form acceptCharset(List<String> encList, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr =
          VirtualAttr('accept-charset', _html.listToSpaces(encList));
      node.attrs!.add(attr);
    }
    return this;
  }

  /// Indicates whether input elements can by default
  /// have their values automatically
  /// completed by the browser.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/form#attr-autocomplete)
  Form autoComplete(String value, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('autocomplete', value);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// The name of the form.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/form#attr-name)
  Form name(String name, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('name', name);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// Controls the annotations and
  /// what kinds of links the form creates.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/form#attr-rel)
  Form rel(List<String> typeList, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('rel', _html.listToSpaces(typeList));
      node.attrs!.add(attr);
    }
    return this;
  }
}

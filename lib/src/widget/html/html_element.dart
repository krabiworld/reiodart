// Copyright (c) MineEjo.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import 'dart:html';

import '../../virtual_dom/virtual_node_attr.dart';
import '../../virtual_dom/virtual_node_widget.dart';
import '../widget.dart';
import 'tag/element_tag_div.dart';
import 'html.dart';

// Experimental, not standard or obsolete tags and attributes
// are not and will not be implemented. If you notice this,
// send it as a issue to https://github.com/MineEjo/reiodart/issues
// Adapted for HTML version 5.

ReioHtml _html = ReioHtml();

/// Contains [ReioElement] created on [ReioWidget].
/// Optimizes HTML DOM and Reio Virtual DOM.
abstract class ReioElement {
  final ReioNodeWidget _node =
      ReioNodeWidget(tag: '', value: '', attrs: [], children: []);

  /// Returns [ReioElement] created on [ReioWidget].
  /// Optimizes HTML DOM and Reio Virtual DOM.
  /// For example, convert HTML `<div>`
  /// to Reio [Div] preserving basic functions.<br><br>
  /// Uses a [value] similar to innerValue in HTML.
  ReioElement([String? value]) {
    _node.value = value ?? '';
  }

  void setHtmlTag(String tag) {
    if (_node.tag.isEmpty) _node.tag = tag;
  }

  /// Removes [ReioElement] from the HTML DOM.
  ReioElement remove(ReioWidget widget) {
    widget.remNodes.add(_node);
    return this;
  }

  /// Removes [ReioElement] from the HTML DOM
  /// if the condition is true.
  ReioElement removeIf(ReioWidget widget, bool Function()? condition) {
    widget.remOnceNodes.add([_node, condition]);
    return this;
  }

  /// Removes [ReioElement] from the HTML DOM
  /// if the condition is true and adds it using
  /// [$] method if it is false.
  ReioElement removeIfTrue(
      ReioWidget widget, int slot, bool Function()? condition) {
    widget.remOnNodes[slot] = [_node, condition];
    return this;
  }

  /// Adds the specified [ReioElement] to [ReioElement]
  /// from which the method was called.
  /// Think of it as an add, insert, etc. method.
  ReioElement $(ReioElement element) {
    _node.children?.add(element.node);
    return this;
  }

  /// The event is activated when [ReioWidget]
  /// is mounted in the Reio Virtual DOM.
  ReioElement onMount(Function(Element)? fun) {
    _node.onMount = fun;
    return this;
  }

  /// The event is activated when [ReioWidget]
  /// is removed from the Reio Virtual DOM.
  ReioElement onDestroy(Function()? fun) {
    _node.onDestroy = fun;
    return this;
  }

  /// The event is activated when an [ReioElement]
  /// is added to the HTML DOM.
  ReioElement onAdd(Function(Element)? fun) {
    _node.onAdd = fun;
    return this;
  }

  /// The event is activated when an [ReioElement]
  /// is removed from the HTML DOM.
  ReioElement onRemove(Function()? fun) {
    _node.onRemove = fun;
    return this;
  }

  /// Allows to create a custom HTML event,
  /// for example, if you can't find the desired one.
  ReioElement on(String eventName, Function(Element, Event) fun) {
    // The element event can only be activated
    // after the element has been embedded.
    onMount((Element element) => element.on[eventName].listen((Event event) {
          fun.call(element, event);
        }));
    return this;
  }

  /// The translate global attribute that is used
  /// to specify whether an element's translatable
  /// attribute values and its Text node children
  /// should be translated when the page is localized,
  /// or whether to leave them unchanged.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/translate)
  ReioElement translate(String value, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('translate', value);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// The title global attribute contains text
  /// representing advisory information related
  /// to the element it belongs to.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/title)
  ReioElement title(String text, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('title', text);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// The tabindex global attribute allows developers
  /// to make HTML elements focusable, allow or prevent
  /// them from being sequentially focusable (usually with
  /// the Tab key, hence the name) and determine their
  /// relative ordering for sequential focus navigation.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/tabindex)
  ReioElement tabIndex(int number, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('tabindex', number.toString());
      node.attrs!.add(attr);
    }
    return this;
  }

  /// The style global attribute contains CSS
  /// styling declarations to be applied to the element.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/style)
  ReioElement style(List<String> styleList, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr =
          ReioNodeAttr('style', _html.listToSemicolons(styleList));
      node.attrs!.add(attr);
    }
    return this;
  }

  /// The spellcheck global attribute that defines
  /// whether the element may be checked for spelling errors.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/spellcheck)
  ReioElement spellCheck(bool boolean, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('spellcheck', boolean.toString());
      node.attrs!.add(attr);
    }
    return this;
  }

  /// The nonce global attribute defining
  /// a cryptographic nonce ("number used once")
  /// which can be used by Content Security Policy
  /// to determine whether or not a given fetch will
  /// be allowed to proceed for a given element.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/nonce)
  ReioElement nonce(String crypto, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('nonce', crypto);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// The lang global attribute helps define
  /// the language of an element: the language
  /// that non-editable elements are written in,
  /// or the language that the editable elements
  /// should be written in by the user.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/lang)
  ReioElement lang(String langCode, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('lang', langCode);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// The global attribute itemtype specifies the URL
  /// of the vocabulary that will be used to define
  /// itemprop's (item properties) in the data structure.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/itemtype)
  ReioElement itemType(String url, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('itemtype', url);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// itemscope is a global attribute that
  /// defines the scope of associated metadata.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/itemscope)
  ReioElement itemScope(bool boolean) {
    if (boolean && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('itemscope', '');
      node.attrs!.add(attr);
    }
    return this;
  }

  /// itemref provides a list of element IDs
  /// (not itemids) elsewhere in the document,
  /// with additional properties
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/itemref)
  ReioElement itemRef(String value, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('itemref', value);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// The itemprop global attribute
  /// is used to add properties to an item.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/itemprop)
  ReioElement itemProp(String name, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('itemprop', name);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// The itemid global attribute provides
  /// microdata in the form of a unique,
  /// global identifier of an item.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/itemid)
  ReioElement itemId(String value, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('itemid', value);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// The is global attribute allows you to specify
  /// that a standard HTML element should behave
  /// like a defined custom built-in element
  /// (see Using custom elements for more details).
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/is)
  ReioElement thisIs(String elementName, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('is', elementName);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// The inputmode global attribute that hints
  /// at the type of data that might be entered
  /// by the user while editing the element
  /// or its contents.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/inputmode)
  ReioElement inputMode(String mode, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('inputmode', mode);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// The id global attribute defines an identifier
  /// (ID) which must be unique in the whole document.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/id)
  ReioElement id(String id, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('id', id);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// The hidden global attribute indicating that
  /// the browser should not render the contents
  /// of the element.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/hidden)
  ReioElement hidden(bool boolean) {
    if (boolean && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('hidden', '');
      node.attrs!.add(attr);
    }
    return this;
  }

  /// The enterkeyhint global attribute defining
  /// what action label (or icon) to present
  /// for the enter key on virtual keyboards.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/enterkeyhint)
  ReioElement enterKeyHint(String key, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('enterkeyhint', key);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// The draggable global attribute attribute that
  /// indicates whether the element can be dragged,
  /// either with native browser behavior
  /// or the HTML Drag and Drop API.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/draggable)
  ReioElement draggable(bool boolean, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('draggable', boolean.toString());
      node.attrs!.add(attr);
    }
    return this;
  }

  /// The dir global attribute that indicates
  /// the directionality of the element's text.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/dir)
  ReioElement dir(String dir, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('dir', dir);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// The contenteditable global attribute
  /// indicating if the element should be editable by the user.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/contenteditable)
  ReioElement contentEditable(bool boolean, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('contenteditable', boolean.toString());
      node.attrs!.add(attr);
    }
    return this;
  }

  /// The class global attribute is a list
  /// of the case-sensitive classes of the element.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/class)
  ReioElement thisClass(List<String> nameList, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr =
          ReioNodeAttr('class', _html.listToSpaces(nameList));
      node.attrs!.add(attr);
    }
    return this;
  }

  /// The autofocus global attribute indicating
  /// that an element should be focused on page load,
  /// or when the `<dialog>` that it is part of is displayed.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/autofocus)
  ReioElement autoFocus(bool boolean) {
    if (boolean && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('autofocus', '');
      node.attrs!.add(attr);
    }
    return this;
  }

  /// The autocapitalize global attribute that controls
  /// whether and how text input is automatically
  /// capitalized as it is entered/edited by the user.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/autocapitalize)
  ReioElement autoCapitalize(String value, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('autocapitalize', value);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// The accesskey global attribute provides
  /// a hint for generating a keyboard shortcut
  /// for the current element.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/accesskey)
  ReioElement accessKey(String key, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('accesskey', key);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// Allows to create a custom HTML attribute,
  /// for example, if you can't find the desired one.
  ReioElement a(String name, dynamic value, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr(name, value.toString());
      node.attrs!.add(attr);
    }
    return this;
  }

  ReioNodeWidget get node => _node;
}

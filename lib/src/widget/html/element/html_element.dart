// Copyright (c) MineEjo.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import 'dart:html';

import '../../../virtual_dom/node/virtual_node_slot.dart';
import '../../../virtual_dom/node/virtual_node_widget.dart';
import '../../../virtual_dom/virtual_attr.dart';
import '../../widget.dart';
import '../html.dart';
import 'tag/element_tag_div.dart';
import 'tag/element_tag_span.dart';

// Experimental, not standard or obsolete tags and attributes
// are not and will not be implemented. If you notice this,
// send it as a issue to https://github.com/MineEjo/reiodart/issues
// Adapted for HTML version 5.

WidgetHtml _html = WidgetHtml();

/// Contains [WidgetElement] created on [VirtualNodeWidget].
/// Optimizes HTML DOM and Reio Virtual DOM.
abstract class WidgetElement {
  final VirtualNodeWidget _node =
      VirtualNodeWidget(tag: '', value: '', attrs: [], children: []);

  /// Returns [WidgetElement] created on [Widget].
  /// Optimizes HTML DOM and Reio Virtual DOM.
  /// For example, convert HTML `<div>`
  /// to Reio [Div] preserving basic functions.<br><br>
  /// Uses a [value] similar to innerValue in HTML.
  WidgetElement([String? value]) {
    _node.value = value ?? '';
  }

  /// Sets the [WidgetElement] HTML tag.
  set tag(String tag) => _node.tag = tag;

  /// Removes [WidgetElement] from the HTML DOM.
  WidgetElement remove(Widget widget) {
    widget.remNodes.add(_node);
    return this;
  }

  /// Removes [WidgetElement] from the HTML DOM
  /// if the condition is true.
  WidgetElement removeIf(Widget widget, bool Function()? condition) {
    widget.remOnceNodes.add([_node, condition]);
    return this;
  }

  /// Removes [WidgetElement] from the HTML DOM
  /// if the condition is true and adds it using
  /// [$] method if it is false.
  WidgetElement removeIfTrue(
      Widget widget, int slot, bool Function()? condition) {
    widget.remOnNodes[slot] = [_node, condition];
    return this;
  }

  /// Adds the specified [WidgetElement] to [WidgetElement]
  /// from which the method was called.
  /// Think of it as an add, insert, etc. method.
  WidgetElement $(WidgetElement element) {
    _node.children?.add(element.node);
    return this;
  }

  /// Adds the specified list with [WidgetElement] to the [WidgetElement]
  /// from which the method was called.
  /// Think of it as an add, insert, etc. method.
  WidgetElement $list(List<WidgetElement> elements) {
    for (WidgetElement element in elements) {
      _node.children?.add(element.node);
    }
    return this;
  }

  /// Creates a slot for inserting a side [Widget].
  WidgetElement $slot(int id) {
    _node.children?.add(VirtualNodeSlot(value: id.toString()));
    return this;
  }

  /// The event is activated when [Widget]
  /// is mounted in the Reio Virtual DOM.
  WidgetElement onMount(Function(Element)? fun) {
    _node.onMount = fun;
    return this;
  }

  /// The event is activated when [Widget]
  /// is removed from the Reio Virtual DOM.
  WidgetElement onDestroy(Function()? fun) {
    _node.onDestroy = fun;
    return this;
  }

  /// The event is activated when an [WidgetElement]
  /// is added to the HTML DOM.
  WidgetElement onAdd(Function(Element)? fun) {
    _node.onAdd = fun;
    return this;
  }

  /// The event is activated when an [WidgetElement]
  /// is removed from the HTML DOM.
  WidgetElement onRemove(Function()? fun) {
    _node.onRemove = fun;
    return this;
  }

  /// Allows to create a custom HTML event,
  /// for example, if you can't find the desired one.
  WidgetElement on(String eventName, Function(Element, Event) fun) {
    // The element event can only be activated
    // after the element has been inserted.
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
  WidgetElement translate(String value, {bool? removeIf}) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('translate', value);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// The title global attribute contains text
  /// representing advisory information related
  /// to the element it belongs to.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/title)
  WidgetElement title(String text, {bool? removeIf}) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('title', text);
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
  WidgetElement tabIndex(int number, {bool? removeIf}) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('tabindex', number.toString());
      node.attrs!.add(attr);
    }
    return this;
  }

  /// The style global attribute contains CSS
  /// styling declarations to be applied to the element.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/style)
  WidgetElement style(List<String> styleList, {bool? removeIf}) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr =
          VirtualAttr('style', _html.listToSemicolons(styleList));
      node.attrs!.add(attr);
    }
    return this;
  }

  /// The spellcheck global attribute that defines
  /// whether the element may be checked for spelling errors.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/spellcheck)
  WidgetElement spellCheck(bool boolean, {bool? removeIf}) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('spellcheck', boolean.toString());
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
  WidgetElement nonce(String crypto, {bool? removeIf}) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('nonce', crypto);
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
  WidgetElement lang(String langCode, {bool? removeIf}) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('lang', langCode);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// The global attribute itemtype specifies the URL
  /// of the vocabulary that will be used to define
  /// itemprop's (item properties) in the data structure.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/itemtype)
  WidgetElement itemType(String url, {bool? removeIf}) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('itemtype', url);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// itemscope is a global attribute that
  /// defines the scope of associated metadata.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/itemscope)
  WidgetElement itemScope(bool boolean) {
    if (boolean && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('itemscope', '');
      node.attrs!.add(attr);
    }
    return this;
  }

  /// itemref provides a list of element IDs
  /// (not itemids) elsewhere in the document,
  /// with additional properties
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/itemref)
  WidgetElement itemRef(String value, {bool? removeIf}) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('itemref', value);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// The itemprop global attribute
  /// is used to add properties to an item.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/itemprop)
  WidgetElement itemProp(String name, {bool? removeIf}) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('itemprop', name);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// The itemid global attribute provides
  /// microdata in the form of a unique,
  /// global identifier of an item.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/itemid)
  WidgetElement itemId(String value, {bool? removeIf}) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('itemid', value);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// The is global attribute allows you to specify
  /// that a standard HTML element should behave
  /// like a defined custom built-in element
  /// (see Using custom elements for more details).
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/is)
  WidgetElement thisIs(String elementName, {bool? removeIf}) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('is', elementName);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// The inputmode global attribute that hints
  /// at the type of data that might be entered
  /// by the user while editing the element
  /// or its contents.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/inputmode)
  WidgetElement inputMode(String mode, {bool? removeIf}) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('inputmode', mode);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// The id global attribute defines an identifier
  /// (ID) which must be unique in the whole document.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/id)
  WidgetElement id(String id, {bool? removeIf}) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('id', id);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// The hidden global attribute indicating that
  /// the browser should not render the contents
  /// of the element.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/hidden)
  WidgetElement hidden(bool boolean) {
    if (boolean && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('hidden', '');
      node.attrs!.add(attr);
    }
    return this;
  }

  /// The enterkeyhint global attribute defining
  /// what action label (or icon) to present
  /// for the enter key on virtual keyboards.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/enterkeyhint)
  WidgetElement enterKeyHint(String key, {bool? removeIf}) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('enterkeyhint', key);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// The draggable global attribute attribute that
  /// indicates whether the element can be dragged,
  /// either with native browser behavior
  /// or the HTML Drag and Drop API.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/draggable)
  WidgetElement draggable(bool boolean, {bool? removeIf}) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('draggable', boolean.toString());
      node.attrs!.add(attr);
    }
    return this;
  }

  /// The dir global attribute that indicates
  /// the directionality of the element's text.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/dir)
  WidgetElement dir(String dir, {bool? removeIf}) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('dir', dir);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// The contenteditable global attribute
  /// indicating if the element should be editable by the user.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/contenteditable)
  WidgetElement contentEditable(bool boolean, {bool? removeIf}) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('contenteditable', boolean.toString());
      node.attrs!.add(attr);
    }
    return this;
  }

  /// The class global attribute is a list
  /// of the case-sensitive classes of the element.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/class)
  WidgetElement thisClass(List<String> nameList, {bool? removeIf}) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('class', _html.listToSpaces(nameList));
      node.attrs!.add(attr);
    }
    return this;
  }

  /// The autofocus global attribute indicating
  /// that an element should be focused on page load,
  /// or when the `<dialog>` that it is part of is displayed.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/autofocus)
  WidgetElement autoFocus(bool boolean) {
    if (boolean && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('autofocus', '');
      node.attrs!.add(attr);
    }
    return this;
  }

  /// The autocapitalize global attribute that controls
  /// whether and how text input is automatically
  /// capitalized as it is entered/edited by the user.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/autocapitalize)
  WidgetElement autoCapitalize(String value, {bool? removeIf}) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('autocapitalize', value);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// The accesskey global attribute provides
  /// a hint for generating a keyboard shortcut
  /// for the current element.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/accesskey)
  WidgetElement accessKey(String key, {bool? removeIf}) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('accesskey', key);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// Allows to create a custom HTML attribute,
  /// for example, if you can't find the desired one.
  WidgetElement a(String name, dynamic value, {bool? removeIf}) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr(name, value.toString());
      node.attrs!.add(attr);
    }
    return this;
  }

  /// Splits the value into the specified elements.
  /// Accepts a [map] with the widget key,
  /// works together with the [getJump] function.
  WidgetElement setJump(Map<int, WidgetElement> map) {
    if (_node.value.isEmpty) return this;

    String value = _node.value;

    /// Allows you to see if there is anything other than
    /// a tag in the value. Sometimes instead of a value,
    /// only a jump is used.
    bool onlyJump = isJump(value);

    List<int> keys = map.keys.toList()..sort();
    List<int> keysPosition = [];
    List<int> keysLength = [];

    for (int key in keys) {
      // The jump function is used so as not
      // to duplicate it, since its name
      // is incorrect in this context.
      keysPosition.add(value.indexOf(getJump(key)));
      keysLength.add(getJump(key).length);
    }

    void add(WidgetElement element) {
      _node.children?.add(element.node);
    }

    for (int i = 0; i < keysPosition.length; i++) {
      int key = keysPosition[i];
      int keyLength = keysLength[i];

      WidgetElement element = map[keys[i]]!;

      int nextKey = 0;
      if ((keysPosition.length - 1) != i) {
        nextKey = keysPosition[i + 1];
      } else {
        // If it is the last position in the array,
        // there will be no next key,
        // but the value must be saved.
        nextKey = value.length;
      }

      if (key == keysPosition.first) {
        if (!onlyJump) add(Span(value.substring(0, key)));
        add(element);
        if (!onlyJump) add(Span(value.substring(key + keyLength, nextKey)));
        continue;
      }

      if (key == keysPosition.last) {
        add(element);
        add(Span(value.substring(key + keyLength, value.length)));
        continue;
      }

      add(element);
      add(Span(value.substring(key + keyLength, nextKey)));
    }

    _node.value = '';
    return this;
  }

  VirtualNodeWidget get node => _node;
}

// Copyright (c) MineEjo.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import 'dart:html';

import '../html.dart';

// Experimental, not standard or obsolete tags and attributes
// are not and will not be implemented. If you notice this,
// send it as a issue to https://github.com/MineEjo/reiodart/issues
// Adapted for HTML version 5.

WidgetHtml _html = WidgetHtml();

/// Contains [document.body]; Is an alias,
/// for easy interaction in the widgets.
class DocumentBody {
  BodyElement body =
      document.body ?? document.createElement('body') as BodyElement;

  /// Allows to create a custom HTML event,
  /// for example, if you can't find the desired one.
  DocumentBody on(String eventName, Function(BodyElement, Event) fun) {
    // The element event can only be activated
    // after the element has been inserted.
    body.on[eventName].listen((Event event) {
      fun.call(body, event);
    });
    return this;
  }

  /// The style global attribute contains CSS
  /// styling declarations to be applied to the element.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/style)
  DocumentBody style(List<String> styleList, {bool? removeIf}) {
    if (removeIf == true) {
      body.removeAttribute('style');
    } else {
      body.setAttribute('style', _html.listToSemicolons(styleList));
    }
    return this;
  }

  /// Allows to create a custom HTML attribute,
  /// for example, if you can't find the desired one.
  DocumentBody a(String name, dynamic value, {bool? removeIf}) {
    if (removeIf == true) {
      body.removeAttribute(name);
    } else {
      body.setAttribute(name, value.toString());
    }
    return this;
  }

  BodyElement get() => body;
}

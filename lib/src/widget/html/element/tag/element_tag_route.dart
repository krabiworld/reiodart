// Copyright (c) MineEjo.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import 'dart:html';
import '../../../../virtual_dom/virtual_attr.dart';
import 'element_tag_a.dart';
import '../../html_event.dart';
import '../html_element.dart';

// Experimental, not standard or obsolete tags and attributes
// are not and will not be implemented. If you notice this,
// send it as a issue to https://github.com/MineEjo/reiodart/issues
// Adapted for HTML version 5.

/// Contains [WidgetElement] that contains a virtual node
/// with the `<a>` tag.
class Route extends A {
  bool? _history;

  /// The `<a>` HTML element (or anchor element),
  /// with its href attribute, creates a hyperlink
  /// to web pages, files, email addresses, locations
  /// in the same page, or anything else a URL can address.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/a)
  Route([super.value]);

  /// Saves the link to history if true and not if false.
  Route history(bool boolean) {
    _history = boolean;
    return this;
  }

  // Updates the page URL to the specified one,
  // updating the history and widgets,
  // but not the page itself.
  @override
  Route href(String url, {bool? removeIf}) {
    on.call('click', (Element element, Event event) {
      if (window.location.href == window.location.origin + url) return this;

      if (_history == false) {
        window.history.replaceState({}, url, window.location.origin + url);
      } else {
        window.history.pushState({}, url, window.location.origin + url);
      }

      window.dispatchEvent(Event(routerEvent));
    });

    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('onclick', 'return false');
      node.attrs!.add(attr);
    }

    return this;
  }
}

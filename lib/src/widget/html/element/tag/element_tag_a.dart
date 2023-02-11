// Copyright (c) MineEjo.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import 'dart:html';

import '../../../../virtual_dom/virtual_attr.dart';
import '../../html.dart';
import '../html_element_visible.dart';

// Experimental, not standard or obsolete tags and attributes
// are not and will not be implemented. If you notice this,
// send it as a issue to https://github.com/MineEjo/reiodart/issues
// Adapted for HTML version 5.

WidgetHtml _html = WidgetHtml();

/// Contains [WidgetElement] that contains a virtual node
/// with the `<a>` tag.
class A extends WidgetElementVisible {
  /// The `<a>` HTML element (or anchor element),
  /// with its href attribute, creates a hyperlink
  /// to web pages, files, email addresses, locations
  /// in the same page, or anything else a URL can address.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/a)
  A([super.value]) {
    tag = 'a';
  }

  /// Causes the browser to treat
  /// the linked URL as a download.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/a#attr-download)
  A download(bool boolean) {
    if (boolean && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('download', '');
      node.attrs!.add(attr);
    }
    return this;
  }

  /// The URL that the hyperlink points to.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/a#attr-href)
  A href(String url, {bool? removeIf}) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('href', url);
      node.attrs!.add(attr);
    }
    return this;
  }

  // Updates the page URL to the specified one,
  // updating the history and widgets,
  // but not the page itself.
  A link(String href, {bool? history}) {
    on.call('click', (Element element, Event event) {
      if (history == false) {
        window.history.replaceState({}, href, window.location.origin + href);
      } else {
        window.history.pushState({}, href, window.location.origin + href);
      }
      window.dispatchEvent(Event(routerEvent));
    });

    VirtualAttr attr = VirtualAttr('onclick', 'return false');
    node.attrs!.add(attr);

    return this;
  }

  /// Hints at the human language of the linked URL.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/a#attr-hreflang)
  A hrefLang(String langCode, {bool? removeIf}) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('hreflang', langCode);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// A list of URLs.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/a#attr-ping)
  A ping(List<String> urlList, {bool? removeIf}) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('ping', _html.listToSpaces(urlList));
      node.attrs!.add(attr);
    }
    return this;
  }

  /// How much of the referrer to send when following the link.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/a#attr-referrerpolicy)
  A referrerPolicy(String referrer, {bool? removeIf}) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('referrerpolicy', referrer);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// The relationship of the linked URL as link types.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/a#attr-rel)
  A rel(List<String> typeList, {bool? removeIf}) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('rel', _html.listToSpaces(typeList));
      node.attrs!.add(attr);
    }
    return this;
  }

  /// Where to display the linked URL, as the name
  /// for a browsing context (a tab, window, or `<iframe>`).
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/a#attr-target)
  A target(String context, {bool? removeIf}) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('target', context);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// Hints at the linked URL's format with a MIME type.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/a#attr-type)
  A type(String mediaType, {bool? removeIf}) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('type', mediaType);
      node.attrs!.add(attr);
    }
    return this;
  }
}

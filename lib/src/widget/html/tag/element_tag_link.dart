// Copyright (c) MineEjo.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import 'dart:html';


import '../../../virtual_dom/virtual_attr.dart';
import '../html.dart';
import '../html_element.dart';
import '../html_element_visible.dart';

// Experimental, not standard or obsolete tags and attributes
// are not and will not be implemented. If you notice this,
// send it as a issue to https://github.com/MineEjo/reiodart/issues
// Adapted for HTML version 5.

WidgetHtml _html = WidgetHtml();

/// Contains [WidgetElement] that contains a virtual_dom
/// with the `<link>` tag.
class Link extends WidgetElementVisible {
  /// The `<link>` HTML element specifies
  /// relationships between the current document
  /// and an external resource.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/link)
  Link() {
    tag = 'link';
  }

  /// The load event is fired when the whole
  /// page has loaded, including all dependent
  /// resources such as stylesheets, scripts,
  /// iframes, and images.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/Window/load_event)
  Link onLoad(Function(Element, Event)? fun) {
    if (fun != null) on.call('load', fun);
    return this;
  }

  /// It specifies the type of content being loaded
  /// by the `<link>`, which is necessary for request matching,
  /// application of correct content security policy,
  /// and setting of correct Accept request header.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/link#attr-as)
  Link as(String type, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('as', type);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// This attribute indicates whether CORS
  /// must be used when fetching the resource.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/link#attr-crossorigin)
  Link crossOrigin(String mode, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('crossorigin', mode);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// This attribute specifies the URL
  /// of the linked resource.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/link#attr-href)
  Link href(String url, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('href', url);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// This attribute indicates the language
  /// of the linked resource.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/link#attr-hreflang)
  Link hrefLang(String langCode, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('hreflang', langCode);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// The imagesize attribute is a sizes attribute
  /// that indicates to preload the appropriate
  /// resource used by an img element.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/link#attr-imagesizes)
  Link imageSizes(List<String> sizesList, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr =
          VirtualAttr('imagesizes', _html.listToCommas(sizesList));
      node.attrs!.add(attr);
    }
    return this;
  }

  /// The imagesrcset attribute is a sourceset attribute
  /// that indicates to preload the appropriate
  /// resource used by an img element.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/link#attr-imagesrcset)
  Link imageSrcSet(List<String> srcList, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr =
          VirtualAttr('imagesrcset', _html.listToCommas(srcList));
      node.attrs!.add(attr);
    }
    return this;
  }

  /// Contains inline metadata — a base64-encoded
  /// cryptographic hash of the resource (file)
  /// you're telling the browser to fetch.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/link#attr-integrity)
  Link integrity(String metaData, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('integrity', metaData);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// This attribute specifies the media
  /// that the linked resource applies to.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/link#attr-media)
  Link media(String value, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('media', value);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// A string indicating which referrer
  /// to use when fetching the resource.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/link#attr-referrerpolicy)
  Link referrerPolicy(String referrer, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('referrerpolicy', referrer);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// This attribute names a relationship
  /// of the linked document to the current document.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/link#attr-rel)
  Link rel(List<String> typeList, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('rel', _html.listToSpaces(typeList));
      node.attrs!.add(attr);
    }
    return this;
  }

  /// This attribute is used to define
  /// the type of the content linked to.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/link#attr-type)
  Link type(String mediaType, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('type', mediaType);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// This attribute explicitly indicates that certain
  /// operations should be blocked on the fetching
  /// of an external resource.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/link#attr-blocking)
  Link blocking(List<String> operationList, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr =
          VirtualAttr('blocking', _html.listToCommas(operationList));
      node.attrs!.add(attr);
    }
    return this;
  }
}

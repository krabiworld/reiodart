// Copyright (c) MineEjo.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import 'dart:html';

import '../../../virtual_dom/virtual_node_attr.dart';
import '../html.dart';
import '../html_element.dart';
import '../html_element_visible.dart';

// Experimental, not standard or obsolete tags and attributes
// are not and will not be implemented. If you notice this,
// send it as a issue to https://github.com/MineEjo/reiodart/issues
// Adapted for HTML version 5.

ReioHtml _html = ReioHtml();

/// Contains [ReioElement] that contains a virtual_dom
/// with the `<img>` tag.
class Img extends ReioElementVisible {
  /// The `<img>` HTML element embeds
  /// an image into the document.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/img)
  Img([super.value]) {
    tag = 'img';
  }

  /// The load event is fired when the whole
  /// page has loaded, including all dependent
  /// resources such as stylesheets, scripts,
  /// iframes, and images.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/Window/load_event)
  Img onLoad(Function(Element, Event)? fun) {
    if (fun != null) on.call('load', fun);
    return this;
  }

  /// The error event is fired on an Element
  /// object when a resource failed to load,
  /// or can't be used.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/Element/error_event)
  Img onError(Function(Element, Event)? fun) {
    if (fun != null) on.call('error', fun);
    return this;
  }

  /// The abort event is fired when the resource
  /// was not fully loaded,
  /// but not as the result of an error.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/HTMLMediaElement/abort_event)
  Img onAbort(Function(Element, Event)? fun) {
    if (fun != null) on.call('abort', fun);
    return this;
  }

  /// Defines an alternative text description
  /// of the image.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/img#attr-alt)
  Img alt(String text, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('alt', text);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// Indicates if the fetching of the image
  /// must be done using a CORS request.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/img#attr-crossorigin)
  Img crossOrigin(String mode, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('crossorigin', mode);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// Provides an image decoding hint to the browser.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/img#attr-decoding)
  Img decoding(String value, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('decoding', value);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// Marks the image for observation
  /// by the PerformanceElementTiming API.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/img#attr-elementtiming)
  Img elementTiming(String marker, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('elementtiming', marker);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// The intrinsic height of the image, in pixels.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/img#attr-height)
  Img height(int pixels, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('height', pixels.toString());
      node.attrs!.add(attr);
    }
    return this;
  }

  /// This attribute indicates
  /// that the image is part of a server-side map.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/img#attr-ismap)
  Img isMap(bool boolean) {
    if (boolean && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('ismap', '');
      node.attrs!.add(attr);
    }
    return this;
  }

  /// Indicates how the browser should load the image.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/img#attr-loading)
  Img loading(String value, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('loading', value);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// Indicating which referrer to use when fetching the resource.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/img#attr-referrerpolicy)
  Img referrerPolicy(String referrer, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('referrerpolicy', referrer);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// Indicating a set of source sizes.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/img#attr-sizes)
  Img sizes(List<String> sizesList, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('sizes', _html.listToCommas(sizesList));
      node.attrs!.add(attr);
    }
    return this;
  }

  /// The image URL.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/img#attr-src)
  Img src(String url, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('src', url);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// Indicating possible image sources
  /// for the user agent to use.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/img#attr-srcset)
  Img srcSet(List<String> srcList, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('srcset', _html.listToCommas(srcList));
      node.attrs!.add(attr);
    }
    return this;
  }

  /// The intrinsic width of the image in pixels.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/img#attr-width)
  Img width(int pixels, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('width', pixels.toString());
      node.attrs!.add(attr);
    }
    return this;
  }

  /// The partial URL (starting with #) of
  /// an image map associated with the element.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/img#attr-usemap)
  Img useMap(String id, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('usemap', id);
      node.attrs!.add(attr);
    }
    return this;
  }
}

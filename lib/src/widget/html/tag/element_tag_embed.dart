// Copyright (c) MineEjo.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import 'dart:html';

import '../../../virtual_dom/virtual_node_attr.dart';
import '../html_element.dart';
import '../html_element_visible.dart';

// Experimental, not standard or obsolete tags and attributes
// are not and will not be implemented. If you notice this,
// send it as a issue to https://github.com/MineEjo/reiodart/issues
// Adapted for HTML version 5.

/// Contains [ReioElement] that contains a virtual_dom
/// with the `<embed>` tag.
class Embed extends ReioElementVisible {
  /// The `<embed>` HTML element embeds external content
  /// at the specified point in the document.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/embed)
  Embed() {
    tag = 'embed';
  }

  /// The error event is fired on an Element
  /// object when a resource failed to load,
  /// or can't be used.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/Element/error_event)
  Embed onError(Function(Element, Event)? fun) {
    if (fun != null) on.call('error', fun);
    return this;
  }

  /// The canplay event is fired when the user agent
  /// can play the media, but estimates that
  /// not enough data has been loaded to play
  /// the media up to its end without having
  /// to stop for further buffering of content.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/HTMLMediaElement/canplay_event)
  Embed onCanPlay(Function(Element, Event)? fun) {
    if (fun != null) on.call('canplay', fun);
    return this;
  }

  /// The abort event is fired when the resource
  /// was not fully loaded,
  /// but not as the result of an error.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/HTMLMediaElement/abort_event)
  Embed onAbort(Function(Element, Event)? fun) {
    if (fun != null) on.call('abort', fun);
    return this;
  }

  /// The displayed height of the resource, in CSS pixels.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/embed#attr-height)
  Embed height(int pixels, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('height', pixels.toString());
      node.attrs!.add(attr);
    }
    return this;
  }

  /// The URL of the resource being embedded.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/embed#attr-src)
  Embed src(String url, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('src', url);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// The MIME type to use to select the plug-in
  /// to instantiate.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/embed#attr-type)
  Embed type(String mediaType, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('type', mediaType);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// The displayed width of the resource, in CSS pixels.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/embed#attr-width)
  Embed width(int pixels, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('width', pixels.toString());
      node.attrs!.add(attr);
    }
    return this;
  }
}

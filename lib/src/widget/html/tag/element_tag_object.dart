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
/// with the `<object>` tag.
class Object extends ReioElementVisible {
  /// The `<object>` HTML element represents
  /// an external resource, which can be treated as an image,
  /// a nested browsing context, or a resource
  /// to be handled by a plugin.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/object)
  Object([super.value]) {
    tag = 'object';
  }

  /// The scroll event fires when an element
  /// has been scrolled.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/Element/scroll_event)
  Object onScroll(Function(Element, Event)? fun) {
    if (fun != null) on.call('scroll', fun);
    return this;
  }

  /// The error event is fired on an Element
  /// object when a resource failed to load,
  /// or can't be used.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/Element/error_event)
  Object onError(Function(Element, Event)? fun) {
    if (fun != null) on.call('error', fun);
    return this;
  }

  /// The canplay event is fired when the user agent
  /// can play the media, but estimates that
  /// not enough data has been loaded to play
  /// the media up to its end without having
  /// to stop for further buffering of content.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/HTMLMediaElement/canplay_event)
  Object onCanPlay(Function(Element, Event)? fun) {
    if (fun != null) on.call('canplay', fun);
    return this;
  }

  /// The abort event is fired when the resource
  /// was not fully loaded,
  /// but not as the result of an error.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/HTMLMediaElement/abort_event)
  Object onAbort(Function(Element, Event)? fun) {
    if (fun != null) on.call('abort', fun);
    return this;
  }

  /// The address of the resource as a valid URL.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/object#attr-data)
  Object data(String url, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('data', url);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// The form element, if any, that the object element
  /// is associated with (its form owner).
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/object#attr-form)
  Object form(String id, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('form', id);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// The height of the displayed resource, in CSS pixels.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/object#attr-height)
  Object height(int pixels, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('height', pixels.toString());
      node.attrs!.add(attr);
    }
    return this;
  }

  /// The name of valid browsing context (HTML5).
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/object#attr-name)
  Object name(String name, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('name', name);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// The content type of the resource specified by data.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/object#attr-type)
  Object type(String mediaType, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('type', mediaType);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// A hash-name reference to a `<map>` element;
  /// that is a '#' followed by the value
  /// of a name of a map element.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/object#attr-usemap)
  Object useMap(String id, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('usemap', id);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// The width of the display resource, in CSS pixels.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/object#attr-width)
  Object width(int pixels, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('width', pixels.toString());
      node.attrs!.add(attr);
    }
    return this;
  }
}

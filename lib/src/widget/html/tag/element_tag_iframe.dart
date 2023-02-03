// Copyright (c) MineEjo.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import 'dart:html';

import '../../../virtual_dom/virtual_node_attr.dart';
import '../html.dart';
import '../html_element.dart';

// Experimental, not standard or obsolete tags and attributes
// are not and will not be implemented. If you notice this,
// send it as a issue to https://github.com/MineEjo/reiodart/issues
// Adapted for HTML version 5.

ReioHtml _html = ReioHtml();

/// Contains [ReioElement] that contains a virtual_dom
/// with the `<iframe>` tag.
class IFrame extends ReioElement {
  /// The `<iframe>` HTML element represents
  /// a nested browsing context, embedding another
  /// HTML page into the current one.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/iframe)
  IFrame([super.value]) {
    tag = 'iframe';
  }

  /// The load event is fired when the whole
  /// page has loaded, including all dependent
  /// resources such as stylesheets, scripts,
  /// iframes, and images.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/Window/load_event)
  IFrame onLoad(Function(Element, Event)? fun) {
    if (fun != null) on.call('load', fun);
    return this;
  }

  /// Specifies a Permissions Policy for the `<iframe>`.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/iframe#attr-allow)
  IFrame allow(List<String> permissionList, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr =
          ReioNodeAttr('allow', _html.listToSemicolons(permissionList));
      node.attrs!.add(attr);
    }
    return this;
  }

  /// The height of the frame in CSS pixels.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/iframe#attr-height)
  IFrame height(int pixels, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('height', pixels.toString());
      node.attrs!.add(attr);
    }
    return this;
  }

  /// A targetable name for the embedded
  /// browsing context.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/iframe#attr-name)
  IFrame name(String name, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('name', name);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// Indicates which referrer to send when fetching the frame's resource.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/iframe#attr-referrerpolicy)
  IFrame referrerPolicy(String referrer, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('referrerpolicy', referrer);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// Applies extra restrictions to the content
  /// in the frame.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/iframe#attr-sandbox)
  IFrame sandbox(List<String> accessList, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr =
          ReioNodeAttr('sandbox', _html.listToSpaces(accessList));
      node.attrs!.add(attr);
    }
    return this;
  }

  /// The URL of the page to embed.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/iframe#attr-src)
  IFrame src(String url, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('src', url);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// Inline HTML to embed, overriding the src attribute.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/iframe#attr-srcdoc)
  IFrame srcDoc(String doc, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('srcdoc', doc);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// The width of the frame in CSS pixels.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/iframe#attr-width)
  IFrame width(int pixels, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('width', pixels.toString());
      node.attrs!.add(attr);
    }
    return this;
  }
}

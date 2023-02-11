// Copyright (c) MineEjo.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import '../../../../virtual_dom/virtual_attr.dart';
import '../../html.dart';
import '../html_element.dart';
import '../html_element_visible.dart';

// Experimental, not standard or obsolete tags and attributes
// are not and will not be implemented. If you notice this,
// send it as a issue to https://github.com/MineEjo/reiodart/issues
// Adapted for HTML version 5.

WidgetHtml _html = WidgetHtml();

/// Contains [WidgetElement] that contains a virtual node
/// with the `<area>` tag.
class Area extends WidgetElementVisible {
  /// The `<area>` HTML element defines an area inside
  /// an image map that has predefined clickable areas.
  /// An image map allows geometric areas
  /// on an image to be associated with hypertext links.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/area)
  Area() {
    tag = 'area';
  }

  /// A text alternative to display
  /// on browsers that do not display images.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/area#attr-alt)
  Area alt(String text, {bool? removeIf}) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('alt', text);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// The coords attribute details the coordinates
  /// of the shape attribute in size, shape,
  /// and placement of an `<area>`.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/area#attr-coords)
  Area coords(List<num> coordsList, {bool? removeIf}) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('coords', _html.listToCommas(coordsList));
      node.attrs!.add(attr);
    }
    return this;
  }

  /// This attribute, if present, indicates that the author
  /// intends the hyperlink to be used for downloading a resource.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/area#attr-download)
  Area download(bool boolean) {
    if (boolean && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('download', '');
      node.attrs!.add(attr);
    }
    return this;
  }

  /// The hyperlink target for the area.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/area#attr-href)
  Area href(String url, {bool? removeIf}) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('href', url);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// Contains a list of URLs to which,
  /// when the hyperlink is followed, POST requests with
  /// the body PING will be sent by the browser (in the background).
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/area#attr-ping)
  Area ping(List<String> urlList, {bool? removeIf}) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('ping', _html.listToSpaces(urlList));
      node.attrs!.add(attr);
    }
    return this;
  }

  /// A string indicating which referrer to
  /// use when fetching the resource.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/area#attr-referrerpolicy)
  Area referrerPolicy(String referrer, {bool? removeIf}) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('referrerpolicy', referrer);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// For anchors containing the href attribute,
  /// this attribute specifies the relationship
  /// of the target object to the link object.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/area#attr-rel)
  Area rel(List<String> typeList, {bool? removeIf}) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('rel', _html.listToSpaces(typeList));
      node.attrs!.add(attr);
    }
    return this;
  }

  /// The shape of the associated hot spot.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/area#attr-shape)
  Area shape(String shape, {bool? removeIf}) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('shape', shape);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// A keyword or author-defined name
  /// of the browsing context to display the linked resource.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/area#attr-target)
  Area target(String context, {bool? removeIf}) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('target', context);
      node.attrs!.add(attr);
    }
    return this;
  }
}

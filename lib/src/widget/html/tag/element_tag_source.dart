// Copyright (c) MineEjo.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

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
/// with the `<source>` tag.
class Source extends ReioElementVisible {
  /// The `<source>` HTML element specifies
  /// multiple media resources for the `<picture>`,
  /// the `<audio>` element, or the `<video>` element.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/source)
  Source() {
    tag = 'source';
  }

  /// The MIME media type of the image or
  /// other media type, optionally with a codecs parameter.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/source#attr-type)
  Source type(String mediaType, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('type', mediaType);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// Address of the media resource.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/source#attr-src)
  Source src(String url, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('src', url);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// Indicating a set of possible images represented
  /// by the source for the browser to use.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/source#attr-srcset)
  Source srcSet(List<String> srcList, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('srcset', _html.listToCommas(srcList));
      node.attrs!.add(attr);
    }
    return this;
  }

  /// A list of source sizes that describes
  /// the final rendered width
  /// of the image represented by the source.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/source#attr-sizes)
  Source sizes(List<String> sizesList, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('sizes', _html.listToCommas(sizesList));
      node.attrs!.add(attr);
    }
    return this;
  }

  /// Media query of the resource's intended media.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/source#attr-media)
  Source media(String value, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('media', value);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// The intrinsic height of the image, in pixels.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/source#attr-height)
  Source height(int pixels, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('height', pixels.toString());
      node.attrs!.add(attr);
    }
    return this;
  }

  /// The intrinsic width of the image in pixels.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/source#attr-width)
  Source width(int pixels, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('width', pixels.toString());
      node.attrs!.add(attr);
    }
    return this;
  }
}

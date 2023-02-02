// Copyright (c) MineEjo.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import '../../../virtual_dom/virtual_node_attr.dart';
import '../html_element.dart';
import '../html_element_visible.dart';

// Experimental, not standard or obsolete tags and attributes
// are not and will not be implemented. If you notice this,
// send it as a issue to https://github.com/MineEjo/reiodart/issues
// Adapted for HTML version 5.

/// Contains [ReioElement] that contains a virtual_dom
/// with the `<canvas>` tag.
class Canvas extends ReioElementVisible {
  /// Use the HTML `<canvas>` element with either
  /// the canvas scripting API or
  /// the WebGL API to draw graphics and animations.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/canvas)
  Canvas([super.value]) {
    setHtmlTag('canvas');
  }

  /// The height of the coordinate space in CSS pixels.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/canvas#attr-height)
  Canvas height(int pixels, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('height', pixels.toString());
      node.attrs!.add(attr);
    }
    return this;
  }

  /// The width of the coordinate space in CSS pixels.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/canvas#attr-width)
  Canvas width(int pixels, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('width', pixels.toString());
      node.attrs!.add(attr);
    }
    return this;
  }
}

// Copyright (c) MineEjo.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import '../../../../virtual_dom/virtual_attr.dart';
import '../html_element.dart';
import '../html_element_visible.dart';

// Experimental, not standard or obsolete tags and attributes
// are not and will not be implemented. If you notice this,
// send it as a issue to https://github.com/MineEjo/reiodart/issues
// Adapted for HTML version 5.

/// Contains [WidgetElement] that contains a virtual node
/// with the `<map>` tag.
class Map extends WidgetElementVisible {
  /// The `<map>` HTML element is used with `<area>` elements
  /// to define an image map (a clickable link area).
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/map)
  Map([super.value]) {
    tag = 'map';
  }

  /// The name attribute gives the map
  /// a name so that it can be referenced.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/map#attr-name)
  Map name(String name, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('name', name);
      node.attrs!.add(attr);
    }
    return this;
  }
}

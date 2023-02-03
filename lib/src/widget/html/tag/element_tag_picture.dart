// Copyright (c) MineEjo.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import '../html_element.dart';
import '../html_element_visible.dart';

// Experimental, not standard or obsolete tags and attributes
// are not and will not be implemented. If you notice this,
// send it as a issue to https://github.com/MineEjo/reiodart/issues
// Adapted for HTML version 5.

/// Contains [ReioElement] that contains a virtual_dom
/// with the `<picture>` tag.
class Picture extends ReioElementVisible {
  /// The `<picture>` HTML element contains
  /// zero or more `<source>` elements and one `<img>`
  /// element to offer alternative versions
  /// of an image for different display/device scenarios.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/picture)
  Picture([super.value]) {
    tag = 'picture';
  }
}

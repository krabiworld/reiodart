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
/// with the `<figcaption>` tag.
class FigCaption extends ReioElementVisible {
  /// The `<figcaption>` HTML element represents
  /// a caption or legend describing the rest
  /// of the contents of its parent `<figure>` element.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/figcaption)
  FigCaption([super.value]) {
    tag = 'figcaption';
  }
}

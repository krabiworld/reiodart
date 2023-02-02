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
/// with the `<bdi>` tag.
class Bdi extends ReioElementVisible {
  /// The `<bdi>` HTML element tells
  /// the browser's bidirectional algorithm
  /// to treat the text it contains in isolation
  /// from its surrounding text.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/bdi)
  Bdi([super.value]) {
    setHtmlTag('bdi');
  }
}

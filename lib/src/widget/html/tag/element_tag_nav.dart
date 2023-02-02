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
/// with the `<nav>` tag.
class Nav extends ReioElementVisible {
  /// The `<nav>` HTML element represents
  /// a section of a page whose purpose is
  /// to provide navigation links, either within
  /// the current document or to other documents.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/nav)
  Nav([super.value]) {
    setHtmlTag('nav');
  }
}

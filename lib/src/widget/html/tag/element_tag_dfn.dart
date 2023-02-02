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
/// with the `<dfn>` tag.
class Dfn extends ReioElementVisible {
  /// The `<dfn>` HTML element is used to indicate
  /// the term being defined within the context
  /// of a definition phrase or sentence.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/dfn)
  Dfn([super.value]) {
    setHtmlTag('dfn');
  }
}

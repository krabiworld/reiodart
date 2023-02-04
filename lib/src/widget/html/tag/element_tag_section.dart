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

/// Contains [WidgetElement] that contains a virtual_dom
/// with the `<section>` tag.
class Section extends WidgetElementVisible {
  /// The `<section>` HTML element represents
  /// a generic standalone section of a document,
  /// which doesn't have a more specific semantic
  /// element to represent it.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/section)
  Section([super.value]) {
    tag = 'section';
  }
}

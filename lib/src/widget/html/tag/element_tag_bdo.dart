// Copyright (c) MineEjo.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import '../html_element.dart';

// Experimental, not standard or obsolete tags and attributes
// are not and will not be implemented. If you notice this,
// send it as a issue to https://github.com/MineEjo/reiodart/issues
// Adapted for HTML version 5.

/// Contains [WidgetElement] that contains a virtual node
/// with the `<bdo>` tag.
class Bdo extends WidgetElement {
  /// The `<bdo>` HTML element overrides the current
  /// directionality of text, so that the text within
  /// is rendered in a different direction.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/bdo)
  Bdo([super.value]) {
    tag = 'bdo';
  }
}

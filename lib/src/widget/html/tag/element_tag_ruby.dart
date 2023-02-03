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
/// with the `<ruby>` tag.
class Ruby extends ReioElementVisible {
  /// The `<ruby>` HTML element represents
  /// small annotation that are rendered above, below,
  /// or next to base text, usually used for showing
  /// the pronunciation of East Asian characters.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/ruby)
  Ruby([super.value]) {
    tag = 'ruby';
  }
}

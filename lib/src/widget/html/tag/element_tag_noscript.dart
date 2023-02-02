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
/// with the `<noscript>` tag.
class NoScript extends ReioElementVisible {
  /// The `<noscript>` HTML element defines a section
  /// of HTML to be inserted if a script type on the page
  /// is unsupported or if scripting is currently turned
  /// off in the browser.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/noscript)
  NoScript([super.value]) {
    setHtmlTag('noscript');
  }
}

// Copyright (c) MineEjo.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import '../../../virtual_dom/virtual_attr.dart';
import '../html_element.dart';

// Experimental, not standard or obsolete tags and attributes
// are not and will not be implemented. If you notice this,
// send it as a issue to https://github.com/MineEjo/reiodart/issues
// Adapted for HTML version 5.

/// Contains [WidgetElement] that contains a virtual node
/// with the `<base>` tag.
class Base extends WidgetElement {
  /// The `<base>` HTML element specifies
  /// the base URL to use for all relative
  /// URLs in a document.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/base)
  Base() {
    tag = 'base';
  }

  /// The base URL to be used throughout
  /// the document for relative URLs.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/base#attr-href)
  Base href(String url, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('href', url);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// A keyword or author-defined name of the default
  /// browsing context to show the results of navigation
  /// from `<a>`, `<area>`, or `<form>` elements
  /// without explicit target attributes.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/base#attr-target)
  Base target(String context, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('target', context);
      node.attrs!.add(attr);
    }
    return this;
  }
}

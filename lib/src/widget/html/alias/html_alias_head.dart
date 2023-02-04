// Copyright (c) MineEjo.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import 'dart:html';

// Experimental, not standard or obsolete tags and attributes
// are not and will not be implemented. If you notice this,
// send it as a issue to https://github.com/MineEjo/reiodart/issues
// Adapted for HTML version 5.

/// Contains [document.head]; Is an alias,
/// for easy interaction in the widgets.
class DocumentHead {
  HeadElement head =
      document.head ?? document.createElement('head') as HeadElement;

  /// Allows to create a custom HTML attribute,
  /// for example, if you can't find the desired one.
  DocumentHead a(String name, dynamic value, [bool? removeIf]) {
    if (removeIf == true) {
      head.removeAttribute(name);
    } else {
      head.setAttribute(name, value.toString());
    }
    return this;
  }

  HeadElement get() => head;
}

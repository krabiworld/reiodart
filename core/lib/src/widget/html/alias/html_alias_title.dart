// Copyright (c) MineEjo.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import 'dart:html';

// Experimental, not standard or obsolete tags and attributes
// are not and will not be implemented. If you notice this,
// send it as a issue to https://github.com/MineEjo/reiodart/issues
// Adapted for HTML version 5.

/// Contains [document.title]; Is an alias,
/// for easy interaction in the widgets.
class DocumentTitle {
  DocumentTitle(String value) {
    document.title = value;
  }

  String get() => document.title;
}

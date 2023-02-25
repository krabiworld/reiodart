// Copyright (c) MineEjo.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import 'dart:html';

// Experimental, not standard or obsolete tags and attributes
// are not and will not be implemented. If you notice this,
// send it as a issue to https://github.com/MineEjo/reiodart/issues
// Adapted for HTML version 5.

const _htmlIconQuery = 'link[rel="icon"]';

/// Contains the [document] icon, if any. This is a shortcut
/// for easy interaction in the widget.
class DocumentIcon {
  final String? _href;
  final String? _type;

  Element? _getIcon() => document.head?.querySelector(_htmlIconQuery);

  DocumentIcon([this._href, this._type]) {
    if (_href != null) _getIcon()?.setAttribute('href', _href!);
    if (_type != null) _getIcon()?.setAttribute('type', _type!);
  }

  String? get currentHref => _getIcon()?.getAttribute('href');
  String? get currentType => _getIcon()?.getAttribute('type');

  String? get href => _href;
  String? get type => _type;
}

// Copyright (c) MineEjo.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import 'dart:html';

import 'package:reio/dev.dart';
import 'package:reio/widget.dart';

import 'html/html.dart';

export 'package:reio/widget.dart';

/// The parent of all widgets.
/// You must extend it if you want to create a widget.
class WidgetRouter extends Widget {
  WidgetRouter(super.html, super.styles);

  /// Mounts the widget in the specified slot.
  void toRoute(int slotId, RegExp routeExp) {
    bool hrefContainsRoute() => routeExp.hasMatch(window.location.href);

    Element? slot = document.querySelector(slotQuery + slotId.toString());
    if (slot == null) return;

    Element? slotParent = slot.parent;
    if (slotParent == null) return;

    int slotPosition = slotParent.children.indexOf(slot);
    if (slotPosition < 0) return;

    if (hrefContainsRoute()) initialize(slot, true);

    void controlState() {
      if (hrefContainsRoute()) {
        if (slotParent.children.contains(slot) == true) {
          // By default, each widget should have
          // its own slot to initialize the widget.
          initialize(slot, true);
        }
      } else {
        if (slotPosition >= slotParent.children.length) {
          // The slot position cannot be equal to or greater than
          // the number of children. If this has happened it is
          // likely that a slot has been removed
          // or an external critical situation has been created.
          return;
        }

        Element currentElement = slotParent.children[slotPosition];

        if (currentElement != slot) {
          // If the current element is not a slot.
          // You need a widget for destroying it, not a slot.
          currentElement.replaceWith(slot);
          destroy();
        }
      }
    }

    onRoute(controlState);
    onPopState(controlState);
  }
}

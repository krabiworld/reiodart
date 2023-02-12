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
  /// [staticPath] - A strictly specified path to anything.
  /// [dynamicPath] - A regular expression that allows you to set your targets.
  void toRoute(int slotId,
      {List<String>? staticPath, List<String>? dynamicPath}) {
    Element? slot = document.querySelector(slotQuery + slotId.toString());
    if (slot == null) return;

    if (staticPath == null && dynamicPath == null) {
      return initialize(slot, true);
    }

    slotParent = slot.parent;
    slotPosition = slotParent?.children.indexOf(slot);
    slotBackup = slot;

    void initializeWidget() {
      if (slotParent?.children.contains(slot) == true) {
        initialize(slot, true);
      }
    }

    void destroyWidget() {
      if (slotBackup == null) return;

      Element currentElement = slotParent!.children[slotPosition!];

      if (currentElement != slotBackup) {
        currentElement.replaceWith(slotBackup!);
        destroy();
      }
    }

    if (staticPath != null) {
      for (String path in staticPath) {
        void function() {
          if (window.location.href.endsWith(path)) {
            initializeWidget();
          } else {
            destroyWidget();
          }
        }

        if (window.location.href.endsWith(path)) {
          initialize(slot, true);
        } else {
          onRoute(function);
          onPopState(function);
        }
      }
    }

    if (dynamicPath != null) {
      for (String path in dynamicPath) {
        void function() {
          RegExp regularPath = RegExp(path);
          if (regularPath.hasMatch(window.location.href)) {
            initializeWidget();
          } else {
            destroyWidget();
          }
        }

        RegExp regularPath = RegExp(path);
        if (regularPath.hasMatch(window.location.href)) {
          initialize(slot, true);
        } else {
          onRoute(function);
          onPopState(function);
        }
      }
    }
  }
}

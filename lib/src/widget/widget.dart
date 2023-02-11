// Copyright (c) MineEjo.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import 'dart:html';

import '../virtual_dom/node/virtual_node_slot.dart';
import '../virtual_dom/node/virtual_node_widget.dart';
import 'html/element/html_element.dart';
import 'html/html.dart';
import 'widget_watcher.dart';

int _totalSlots = 0;

/// Returns a unique number,
/// used to identify the slot.
int slotNumber() => ++_totalSlots;

/// The parent of all widgets.
/// You must extend it if you want to create a widget.
abstract class Widget {
  bool _isUpdate = false;

  /// Contains nodes that will be removed. Not recommended for use.
  final List<VirtualNodeWidget> remNodes = [];

  /// Contains nodes that will be removed on condition.
  final List<List<dynamic>> remOnceNodes = [];

  /// Contains the nodes that will be removed or added under the condition.
  final Map<int, List<dynamic>> remOnNodes = {};

  /// Slots of removed nodes, to check their state.
  final Set<int> _remSlots = {};

  /// Saved virtual node parent, which will be removed in the future
  /// and then added back into it.
  final Map<int, Element?> _remParents = {};

  /// Saved virtual node position, which will be removed in the future,
  /// and afterwards also added on the same position.
  final Map<int, int?> _remPositions = {};

  final WidgetElement Function(Widget widget) _html;
  final String? Function()? _styles;
  final WidgetWatcher _watcher = WidgetWatcher();

  Widget(this._html, this._styles);

  /// Mounts the widget in the parent, and starts the activity.
  void mount(Widget parent) {
    _initialize(parent.node.element!, true);
  }

  /// Mounts the widget directly to the HTML element ([htmlElement]),
  /// used to insert in HTML element if Reio was not previously inserted in it.
  void inject(Element? htmlElement) {
    if (htmlElement == null) return;
    _initialize(htmlElement, true);
  }

  Element? slotParent;
  int? slotPosition;
  Element? slotBackup;

  /// Mounts the widget in the specified slot.
  /// [staticPath] - A strictly specified path to anything.
  /// [dynamicPath] - A regular expression that allows you to set your targets.
  void toSlot(int id, {String? staticPath, String? dynamicPath}) {
    Element? slot = document.querySelector(slotQuery + id.toString());
    if (slot == null) return;

    if (staticPath == null && dynamicPath == null) {
      return _initialize(slot, true);
    }

    slotParent = slot.parent;
    slotPosition = slotParent?.children.indexOf(slot);
    slotBackup = slot;

    void initializeWidget() {
      if (slotParent?.children.contains(slot) == true) {
        _initialize(slot, true);
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
      onRoute(() {
        if (window.location.href.endsWith(staticPath)) {
          initializeWidget();
        } else {
          destroyWidget();
        }
      });

      if (window.location.href.endsWith(staticPath)) {
        _initialize(slot, true);
      }
    }

    if (dynamicPath != null) {
      onRoute(() {
        RegExp path = RegExp(dynamicPath);
        if (path.hasMatch(window.location.href)) {
          initializeWidget();
        } else {
          destroyWidget();
        }
      });

      RegExp path = RegExp(dynamicPath);
      if (path.hasMatch(window.location.href)) {
        _initialize(slot, true);
      }
    }
  }

  /// Starts the activity and watcher [Widget].
  void _initialize(Element element, bool replace) {
    _watcher.initActivity(() {
      _watcher.node = _html.call(this).node;
      _watcher.node.styles = _styles?.call();
      _watcher.node.init(element, replace);
    });

    _watcher.watchActivity(() {
      activity();
      _update();
      _controlState();
    });
  }

  /// Implementation of widget functionality.
  void activity();

  /// Updates the old [VirtualNodeWidget] with a new one.
  void _update() {
    if (_isUpdate) {
      _watcher.node.styles = _styles?.call();
      _watcher.node.updateTo(_html.call(this).node);
      _isUpdate = false;
    }

    _isUpdate = true;
  }

  /// Responsible for controlling the HTML elements in the widget.
  void _controlState() {
    if (remNodes.isEmpty && remOnceNodes.isEmpty && remOnNodes.isEmpty) return;

    if (remNodes.isNotEmpty) {
      for (VirtualNodeWidget node in remNodes) {
        node.remove();
      }
      // When you get a new design, the list will be updated,
      // so the old nodes must be removed,
      // even if they have not been changed.
      remNodes.clear();
    }

    if (remOnceNodes.isNotEmpty) {
      for (List<dynamic> list in remOnceNodes) {
        bool Function() condition = list[1];
        VirtualNodeWidget node = list[0];
        if (condition()) node.remove();
      }
      // When you get a new design, the list will be updated,
      // so the old nodes must be removed,
      // even if they have not been changed.
      remOnceNodes.clear();
    }

    final List toRemove = [];
    final List toAdd = [];

    remOnNodes.forEach((int k, List<dynamic> v) {
      bool Function() condition = v[1];
      VirtualNodeWidget node = v[0];

      // If the removal condition is true and the item is not removed.
      if (condition() && !_remSlots.contains(k)) {
        // Getting a parent to embed an element in it in the future.
        Element? parent = node.element?.parentNode as Element?;
        _remParents[k] = parent;

        if (parent == null) remOnNodes.remove(k);

        // Get the position of the element in the parent
        // to know where to insert it.
        int? position = _remParents[k]?.childNodes.indexOf(node.element!);
        if (position == null) return;
        _remPositions[k] = position;

        toRemove.add([k, node]);
      } else if (!condition() && _remSlots.contains(k)) {
        // If the removal condition is incorrect and the item is removed.
        if (_remParents[k] == null || _remPositions[k] == null) {
          remOnNodes.remove(k);
        }

        toAdd.add([k, node]);
      }
    });

    for (List<dynamic> list in toRemove) {
      // After saving the data, removing.
      VirtualNodeWidget node = list[1];
      int slot = list[0];

      node.remove();
      _remSlots.add(slot);
    }

    for (List<dynamic> list in toAdd) {
      VirtualNodeWidget node = list[1];
      int slot = list[0];

      node.add(_remParents[slot]!, _remPositions[slot]!);

      _remSlots.remove(slot);
    }

    toRemove.clear();
    toAdd.clear();
  }

  void destroy() => _watcher.node.destroy();

  VirtualNodeWidget get node => _watcher.node;
}

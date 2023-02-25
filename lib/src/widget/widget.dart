// Copyright (c) MineEjo.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import 'dart:html';

import '../virtual_dom/node/virtual_node_slot.dart';
import '../virtual_dom/node/virtual_node_widget.dart';
import 'html/element/html_element.dart';
import 'html/html_event.dart';
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
    initialize(parent.node.element!, true);
  }

  /// Mounts the widget directly to the HTML element ([htmlElement]),
  /// used to insert in HTML element if Reio was not previously inserted in it.
  void inject(Element? htmlElement) {
    if (htmlElement == null) return;
    initialize(htmlElement, true);
  }

  /// Enables lazy loading for the [slot] to be initialized
  /// on the page when it is queued.
  void initializeLazyLoading(Element slot) {
    Element? slotParent = slot.parent;
    if (slotParent == null) return;

    int slotPosition = slotParent.children.indexOf(slot);
    if (slotPosition < 0) return;

    Element trigger = slotParent;
    if (slotPosition != 0) {
      // If the parent has children other than a slot,
      // a child must be taken before the slot. Usually the parent is used,
      // because of the lack of difference in the absence of children.
      trigger = slotParent.children[slotPosition - 1];
    }

    IntersectionObserver observer = IntersectionObserver((entries, observer) {
      for (var entry in entries) {
        if (!entry.isIntersecting) return;

        initialize(slot, true);

        observer.unobserve(trigger);
      }
    });

    observer.observe(trigger);
  }

  /// Mounts the widget in the specified slot.
  void toSlot(int id, {bool? lazy}) {
    Element? slot = document.querySelector(slotQuery + id.toString());
    if (slot == null) return;

    if (lazy == true) {
      initializeLazyLoading(slot);
    } else {
      initialize(slot, true);
    }
  }

  /// Mounts the widget in the specified slot.
  void toRoute(int slotId, RegExp routeExp, {bool? lazy}) {
    bool hrefContainsRoute() => routeExp.hasMatch(window.location.href);

    Element? slot = document.querySelector(slotQuery + slotId.toString());
    if (slot == null) return;

    Element? slotParent = slot.parent;
    if (slotParent == null) return;

    int slotPosition = slotParent.children.indexOf(slot);
    if (slotPosition < 0) return;

    if (hrefContainsRoute()) {
      if (lazy == true) {
        initializeLazyLoading(slot);
      } else {
        initialize(slot, true);
      }
    }

    void controlState() {
      if (hrefContainsRoute()) {
        if (slotParent.children.contains(slot) == true) {
          // By default, each widget should have
          // its own slot to initialize the widget.
          if (lazy == true) {
            initializeLazyLoading(slot);
          } else {
            initialize(slot, true);
          }
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

  /// Starts the activity and watcher [Widget].
  void initialize(Element element, bool replace) {
    _watcher.initActivity(() {
      _watcher.node = _html.call(this).node;
      _watcher.node.styles = _styles?.call();
      _watcher.node.init(element, replace);
      onMount();
    });

    _watcher.watchActivity(() {
      activity();
      _update();
      _controlState();
    });
  }

  /// Implementation of widget functionality.
  void activity() {}

  /// Implementation of widget functionality.
  /// It differs from the [activity] in that it starts
  /// only when the widget is mounted.
  void onMount() {}

  /// The implementation of the widget functionality.
  /// It differs from [activity] in that it is run
  /// only when the widget is destroyed.
  void onDestroy() {}

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

    final List<dynamic> toRemove = [];
    final List<dynamic> toAdd = [];

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

  void destroy() {
    _watcher.node.destroy();
    onDestroy();
  }

  VirtualNodeWidget get node => _watcher.node;
}

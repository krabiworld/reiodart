// Copyright (c) MineEjo.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.
// Copyright (c) MineEjo.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import 'dart:html';

import '../virtual_dom/virtual_node_widget.dart';
import 'html/html_element.dart';
import 'widget_watcher.dart';

/// The parent of all widgets.
/// You must extend it if you want to create a widget.
abstract class ReioWidget {
  bool _isUpdate = false;

  /// Contains nodes that will be removed. Not recommended for use.
  final List<ReioNodeWidget> remNodes = [];

  /// Contains nodes that will be removed on condition.
  final List<List<dynamic>> remOnceNodes = [];

  /// Contains the nodes that will be removed or added under the condition.
  final Map<int, List<dynamic>> remOnNodes = {};

  /// Slots of removed nodes, to check their state.
  final Set<int> _remSlots = {};

  /// Saved virtual_dom parent, which will be removed in the future
  /// and then added back into it.
  final Map<int, Element?> _remParents = {};

  /// Saved virtual_dom position, which will be removed in the future,
  /// and afterwards also added on the same position.
  final Map<int, int?> _remPositions = {};

  final ReioElement Function(ReioWidget widget) _html;
  final String? Function()? _styles;
  final ReioWatcher _watcher = ReioWatcher();

  ReioWidget(this._html, this._styles);

  /// Mounts the widget in the parent, and starts the activity.
  void mount(ReioWidget parent) {
    _watcher.initActivity(() {
      _watcher.node = _html.call(this).node;
      _watcher.node.styles = _styles?.call();
      _watcher.node.init(parent.node.element);
    });

    _watcher.watchActivity(() {
      activity();
      _update();
      _controlState();
    });
  }

  /// Mounts the widget directly to the HTML element ([htmlElement]),
  /// used to insert in HTML element if Reio was not previously embedded in it.
  void inject(Element? htmlElement) {
    if (htmlElement == null) return;

    _watcher.initActivity(() {
      _watcher.node = _html.call(this).node;
      _watcher.node.styles = _styles?.call();
      _watcher.node.init(htmlElement);
    });

    _watcher.watchActivity(() {
      activity();
      _update();
      _controlState();
    });
  }

  /// Implementation of widget functionality.
  void activity();

  /// Updates the old [ReioNodeWidget] with a new one.
  void _update() {
    if (_isUpdate) {
      _watcher.node.updateTo(_html.call(this).node);
      _isUpdate = false;
    }

    _isUpdate = true;
  }

  /// Responsible for controlling the HTML elements in the widget.
  void _controlState() {
    if (remNodes.isEmpty && remOnceNodes.isEmpty && remOnNodes.isEmpty) return;

    if (remNodes.isNotEmpty) {
      for (ReioNodeWidget node in remNodes) {
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
        ReioNodeWidget node = list[0];
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
      ReioNodeWidget node = v[0];

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
      ReioNodeWidget node = list[1];
      int slot = list[0];

      node.remove();
      _remSlots.add(slot);
    }

    for (List<dynamic> list in toAdd) {
      ReioNodeWidget node = list[1];
      int slot = list[0];

      node.add(_remParents[slot]!, _remPositions[slot]!);

      _remSlots.remove(slot);
    }

    toRemove.clear();
    toAdd.clear();
  }

  void destroy() => _watcher.node.destroy();

  ReioNodeWidget get node => _watcher.node;
}

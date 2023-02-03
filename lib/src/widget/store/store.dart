// Copyright (c) MineEjo.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import '../../virtual_dom/virtual_node_widget.dart';
import '../widget_watcher.dart';

/// Proxy for the creation of store, works with [ReioDependency].
class ReioProxy {
  dynamic value;

  /// Creates [ReioProxy] with an initial value,
  /// it usually should not be empty unless destroyed.
  ReioProxy(this.value);

  final ReioDependency dependency = ReioDependency();

  /// Standard method for getting a value,
  /// takes a widget node to set its [dependency].
  dynamic get(ReioNodeWidget node) {
    if (value == null) return;

    dependency.depend(node);
    return value;
  }

  /// Standard method for setting the value,
  /// accepts the value and notifies
  /// [dependency] of the update.
  void set(dynamic newValue) {
    if (value == newValue) return;

    value = newValue;
    dependency.notify();
  }

  /// Destroys value and [dependency],
  /// thereby destroying [ReioProxy].
  void destroy() {
    value = null;
    dependency.destroy();
  }
}

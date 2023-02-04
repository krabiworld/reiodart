// Copyright (c) MineEjo.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import '../../virtual_dom/node/virtual_node_widget.dart';
import '../widget_watcher.dart';

/// Proxy for the creation of store, works with [Dependency].
class ProxyStore {
  dynamic value;

  /// Creates [ProxyStore] with an initial value,
  /// it usually should not be empty unless destroyed.
  ProxyStore(this.value);

  final Dependency dependency = Dependency();

  /// Standard method for getting a value,
  /// takes a widget node to set its [dependency].
  dynamic get(VirtualNodeWidget node) {
    if (value == null) return;

    dependency.depend(node);
    return value;
  }

  /// Standard method for setting the value,
  /// takes the value and notifies
  /// [dependency] of the update.
  void set(dynamic newValue) {
    if (value == newValue) return;

    value = newValue;
    dependency.notify();
  }

  /// Destroys value and [dependency],
  /// thereby destroying [ProxyStore].
  void destroy() {
    value = null;
    dependency.destroy();
  }
}

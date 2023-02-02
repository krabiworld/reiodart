// Copyright (c) MineEjo.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import '../../virtual_dom/virtual_node_widget.dart';
import '../widget_watcher.dart';

/// Proxy for the creation of store, works with [ReioDependency].
class ReioProxy {
  dynamic value;

  ReioProxy(this.value);

  final ReioDependency dependency = ReioDependency();

  dynamic get(ReioNodeWidget node) {
    dependency.depend(node);
    return value;
  }

  void set(dynamic newValue) {
    if (value == newValue) return;
    value = newValue;
    dependency.notify();
  }

  void destroy() {
    value = null;
    dependency.destroy();
  }
}

// Copyright (c) MineEjo.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import '../widget.dart';
import 'store.dart';

/// Reactive store available for writing and reading.
class ReioWritableStore {
  final Map<String, ReioProxy> _store = {};

  ReioWritableStore(Map<String, dynamic> fields) {
    for (var key in fields.keys) {
      dynamic value = fields[key];
      _store[key] = ReioProxy(value);
    }
  }

  /// Takes [ReioWidget] second argument as a store subscription.
  dynamic get(String key, ReioWidget widget) {
    return _store[key]?.get(widget.node);
  }

  void set(String key, dynamic value) {
    _store[key]?.set(value);
  }

  /// Takes [ReioWidget] second argument as a store subscription.
  void update(
      String key, ReioWidget widget, dynamic Function(dynamic value) fun) {
    dynamic value = fun.call(_store[key]?.get(widget.node));
    _store[key]?.set(value);
  }

  void destroy(String key) {
    _store[key]?.destroy();
  }
}

// Copyright (c) MineEjo.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import '../widget.dart';
import 'store.dart';

/// Reactive store available for writing and reading.
class ReioWritableStore {
  final Map<String, ReioProxy> _store = {};

  /// Creates a store of writable proxies created on [Map].
  ReioWritableStore(Map<String, dynamic> fields) {
    fields.forEach((key, value) => _store[key] = ReioProxy(value));
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
    dynamic value = _store[key]?.get(widget.node);
    if (value == null) return;

    dynamic newValue = fun.call(_store[key]?.get(widget.node));
    if (newValue != null) _store[key]?.set(newValue);
  }

  /// Takes the key of the value to be destroyed.
  void destroy(String key) {
    _store[key]?.destroy();
  }

  /// Clears proxy dependencies and proxies from the store.
  void clear() {
    _store.forEach((key, value) => destroy(key));
    _store.clear();
  }
}

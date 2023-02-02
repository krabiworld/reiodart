// Copyright (c) MineEjo.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import '../widget.dart';
import 'store.dart';

/// Reactive store available for reading.
class ReioReadableStore {
  final Map<String, ReioProxy> _store = {};

  ReioReadableStore(Map<String, dynamic> fields) {
    for (var key in fields.keys) {
      dynamic value = fields[key];
      _store[key] = ReioProxy(value);
    }
  }

  /// Takes [ReioWidget] second argument as a store subscription.
  dynamic get(String key, ReioWidget widget) {
    return _store[key]?.get(widget.node);
  }

  void destroy(String key) {
    _store[key]?.destroy();
  }
}

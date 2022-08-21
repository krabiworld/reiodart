import 'package:reio/src/virtual_node.dart';
import 'package:reio/src/virtual_node_observable.dart';

/// It's a class that stores a value and notifies all the observers when the value changes.
class WritableProxy {
  dynamic _value;

  WritableProxy(this._value);

  final Dependency _dependency = Dependency();

  /// Args:
  ///   [virtualNode] ([VirtualNode]): If get() gets storage values from another class where storage is created,
  ///   specify a virtual node to avoid memory leaks.
  ///
  /// Returns:
  ///   The value of the property.
  dynamic get([VirtualNode? virtualNode]) {
    _dependency.depend(virtualNode);
    return _value;
  }

  /// If the value of the variable has changed, then notify all the observers.
  ///
  /// Args:
  ///   [value] ([dynamic]): The value of the state.
  void set(dynamic value) {
    if (_value != value) {
      _value = value;
      _dependency.notify();
    }
  }

  void destroy() {
    _value = null;
    _dependency.destroy();
  }
}

/// It's a class that stores a value and notifies all the observers when the value changes.
class ReadableProxy {
  dynamic _value;

  ReadableProxy(this._value);

  final Dependency _dependency = Dependency();

  /// Args:
  ///   [virtualNode] ([VirtualNode]): If get() gets storage values from another class where storage is created,
  ///   specify a virtual node to avoid memory leaks.
  ///
  /// Returns:
  ///   The value of the property.
  dynamic get([VirtualNode? virtualNode]) {
    _dependency.depend(virtualNode);
    return _value;
  }

  void destroy() {
    _value = null;
    _dependency.destroy();
  }
}

typedef ReactiveWritableStore = Map<String, WritableProxy>;

/// It takes a map of fields and returns a map of writable proxies.
///
/// Args:
///   [fields] ([Map]): A map of the fields you want to be reactive.
///
/// Returns:
///   A map of keys to WritableProxy objects.
ReactiveWritableStore $Writable(Map<String, dynamic> fields) {
  final ReactiveWritableStore store = {};

  for (var key in fields.keys) {
    dynamic value = fields[key];
    store[key] = WritableProxy(value);
  }

  return store;
}

typedef ReactiveReadableStore = Map<String, ReadableProxy>;

/// It takes a map of fields and returns a map of readable proxies.
///
/// Args:
///   [fields] ([Map]): A map of the fields you want to be reactive.
///
/// Returns:
///   A map of keys to ReadableProxy objects.
ReactiveReadableStore $Readable(Map<String, dynamic> fields) {
  final ReactiveReadableStore store = {};

  for (var key in fields.keys) {
    dynamic value = fields[key];
    store[key] = ReadableProxy(value);
  }

  return store;
}

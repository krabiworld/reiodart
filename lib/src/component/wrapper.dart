import 'dart:html';

import '../node/handler.dart';
import './handler.dart';

// The class is a wrapper for watcher,
// it's more of a component blank. There is no new code here.

/// The parent of all components.
/// You must extend it if you want to create a component.
abstract class ReioComponent {
  bool _isUpdate = false;

  final ReioNodeComponent Function() _construct;
  final String? Function()? _styles;
  final ReioWatcher _watcher = ReioWatcher();

  ReioComponent(this._construct, this._styles);

  /// Mounts the component in the parent, and starts the activity.
  void mount(ReioComponent parent) {
    _watcher.initActivity(() {
      _watcher.node = _construct.call();
      _watcher.node.styles = _styles?.call();
      _watcher.node.init(parent._getNode().element);
    });

    _watcher.watchActivity(() {
      activity.call();
      _update.call();
    });
  }

  /// Mounts the component directly to the HTML element ([htmlElement]),
  /// used to insert in HTML element if Reio was not previously embedded in it.
  void inject(Element? htmlElement) {
    if (htmlElement == null) return;

    _watcher.initActivity(() {
      _watcher.node = _construct.call();
      _watcher.node.styles = _styles?.call();
      _watcher.node.init(htmlElement);
    });

    _watcher.watchActivity(() {
      activity.call();
      _update.call();
    });
  }

  /// Implementation of component functionality.
  void activity();

  /// Replaces the old [ReioNodeComponent] with a new one.
  void _update() {
    if (_isUpdate) {
      _watcher.node.replace(_construct.call());
      _isUpdate = false;
    }

    _isUpdate = true;
  }

  void destroy() {
    _watcher.node.destroy();
  }

  /// Returns the [ReioNodeComponent] in use.
  ReioNodeComponent _getNode() => _watcher.node;
}

/// Reactive store available for writing and reading.
class ReioWritableStore {
  final Map<String, ReioProxy> _store = {};

  ReioWritableStore(Map<String, dynamic> fields) {
    for (var key in fields.keys) {
      dynamic value = fields[key];
      _store[key] = ReioProxy(value);
    }
  }

  /// Takes [ReioComponent] second argument as a store subscription.
  dynamic get(String key, ReioComponent component) {
    return _store[key]?.get(component._getNode());
  }

  void set(String key, dynamic value) {
    _store[key]?.set(value);
  }

  /// Takes [ReioComponent] second argument as a store subscription.
  void update(String key, ReioComponent component,
      dynamic Function(dynamic value) fun) {
    dynamic value = fun.call(_store[key]?.get(component._getNode()));
    _store[key]?.set(value);
  }

  void destroy(String key) {
    _store[key]?.destroy();
  }
}

/// Reactive store available for reading.
class ReioReadableStore {
  final Map<String, ReioProxy> _store = {};

  ReioReadableStore(Map<String, dynamic> fields) {
    for (var key in fields.keys) {
      dynamic value = fields[key];
      _store[key] = ReioProxy(value);
    }
  }

  /// Takes [ReioComponent] second argument as a store subscription.
  dynamic get(String key, ReioComponent component) {
    return _store[key]?.get(component._getNode());
  }

  void destroy(String key) {
    _store[key]?.destroy();
  }
}

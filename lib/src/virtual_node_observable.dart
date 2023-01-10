import '../../src/virtual_node.dart';

dynamic _activeEffect;

class Watcher {
  VirtualNode _virtualNode =
      VirtualNode(tag: '', value: '', attrs: [], children: []);
  int _iterations = 0;

  int get iterations => _iterations;

  VirtualNode get virtualNode => _virtualNode;

  set virtualNode(VirtualNode virtualNode) => _virtualNode = virtualNode;

  /// `init` takes a function as an argument and calls it.
  ///
  /// Args:
  ///   [function] ([Function]): The function to be called when the event is triggered.
  void init(Function function) {
    function();
  }

  /// `watch` takes a function as an argument, sets `activeEffect` to that function, calls the function, sets.
  ///
  /// Args:
  ///   [function] ([Function]): The function that will be called when the state changes.
  void watch(Function function) {
    _activeEffect = function;
    function();
    _activeEffect = null;
    _iterations++;
  }

  /// Components are added once on the zero interaction.
  void components(Function function) {
    if (_iterations > 0) return;
    function();
  }
}

class _Subscriber {
  Function function;
  VirtualNode? virtualNode;

  _Subscriber(this.function, [this.virtualNode]);
}

/// `Dependency` is a class that keeps track of all the functions that depend on it,
/// and calls them when it changes.
class Dependency {
  final List<_Subscriber> _subscribers = [];

  /// If there is an active effect, and it's not already in the list of subscribers, add it to the list of subscribers.
  void depend([VirtualNode? virtualNode]) {
    if (_activeEffect != null && !_subscribers.contains(_activeEffect)) {
      _subscribers.add(_Subscriber(_activeEffect, virtualNode));
    }
  }

  /// For each subscriber in the subscribers list, call the function.
  void notify() {
    var toRemove = [];
    var toExecute = [];

    for (var subscriber in _subscribers) {
      /// Removes the subscription if the virtual node is not mounted.
      if (subscriber.virtualNode != null && subscriber.virtualNode!.isMount) {
        toRemove.add(subscriber);
      } else {
        toExecute.add(subscriber.function);
      }
    }

    _subscribers.removeWhere((subscriber) => toRemove.contains(subscriber));
    toExecute.forEach((fun) => fun());
  }

  /// It removes all subscribers from the list.
  void destroy() {
    _subscribers.clear();
  }
}

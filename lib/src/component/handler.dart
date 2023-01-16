import '../node/handler.dart';

dynamic activity;

/// Initializes a component and sets the activity.
class ReioWatcher {
  late ReioNodeComponent node;

  void initActivity(Function fun) {
    fun.call();
  }

  void watchActivity(Function fun) {
    activity = fun;
    fun.call();
    activity = null;
  }
}

/// Binds the function-activity to a node.
class ReioSubscriber {
  Function function;
  ReioNodeComponent node;

  ReioSubscriber(this.function, this.node);
}

/// Sets the [ReioNodeComponent] dependency and controls subscribers.
class ReioDependency {
  final List<ReioSubscriber> subscribers = [];

  // Subscribes the activity to a node.
  void depend(ReioNodeComponent node) {
    if (activity != null && !subscribers.contains(activity)) {
      subscribers.add(ReioSubscriber(activity, node));
    }
  }

  /// Calls out and controls [ReioDependency] subscribers.
  void notify() {
    List<ReioSubscriber> toRemove = [];
    List<Function> toExecute = [];

    for (var subscriber in subscribers) {
      // Send a subscriber to be removed if the node does not exist.
      if (subscriber.node.isMount == false) {
        toRemove.add(subscriber);
        continue;
      }

      toExecute.add(subscriber.function);
    }

    subscribers.removeWhere((subscriber) {
      return toRemove.contains(subscriber);
    });

    for (Function fun in toExecute) {
      fun.call();
    }
  }

  /// Destroys [ReioDependency].
  void destroy() {
    subscribers.clear();
  }
}

/// Proxy for the creation of stores, works with [ReioDependency].
class ReioProxy {
  dynamic value;

  ReioProxy(this.value);

  final ReioDependency dependency = ReioDependency();

  dynamic get(ReioNodeComponent node) {
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

// Copyright (c) MineEjo.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import '../virtual_dom/virtual_node_widget.dart';

dynamic activity;

/// Initializes a widget and sets the activity.
class ReioWatcher {
  late ReioNodeWidget node;

  void initActivity(Function fun) {
    fun.call();
  }

  void watchActivity(Function fun) {
    activity = fun;
    fun.call();
    activity = null;
  }
}

/// Binds the function-activity to a virtual_dom.
class ReioSubscriber {
  Function function;
  ReioNodeWidget node;

  ReioSubscriber(this.function, this.node);
}

/// Sets the [ReioNodeWidget] dependency and controls subscribers.
class ReioDependency {
  final List<ReioSubscriber> subscribers = [];

  // Subscribes the activity to a virtual_dom.
  void depend(ReioNodeWidget node) {
    if (activity != null && !subscribers.contains(activity)) {
      subscribers.add(ReioSubscriber(activity, node));
    }
  }

  /// Calls out and controls [ReioDependency] subscribers.
  void notify() {
    List<ReioSubscriber> toRemove = [];
    List<Function> toExecute = [];

    for (var subscriber in subscribers) {
      // Send a subscriber to be removed if the virtual_dom does not exist.
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

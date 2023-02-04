// Copyright (c) MineEjo.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import '../virtual_dom/node/virtual_node_widget.dart';

dynamic activity;

/// Initializes a widget and sets the activity.
class WidgetWatcher {
  late VirtualNodeWidget node;

  void initActivity(Function fun) {
    fun.call();
  }

  void watchActivity(Function fun) {
    activity = fun;
    fun.call();
    activity = null;
  }
}

class Subscriber {
  Function function;
  VirtualNodeWidget node;

  Subscriber(this.function, this.node);
}

/// Sets the [VirtualNodeWidget] dependency and controls subscribers.
class Dependency {
  final List<Subscriber> subscribers = [];

  // Subscribes the activity to a virtual_dom.
  void depend(VirtualNodeWidget node) {
    if (activity != null && !subscribers.contains(activity)) {
      subscribers.add(Subscriber(activity, node));
    }
  }

  /// Calls out and controls [Dependency] subscribers.
  void notify() {
    List<Subscriber> toRemove = [];
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

  /// Destroys [Dependency].
  void destroy() {
    subscribers.clear();
  }
}

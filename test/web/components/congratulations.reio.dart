import 'package:reio/reio.dart';

import 'counter.reio.dart';

// If this is your first time using Reio, it is highly
// it is highly recommended that you open the documentation of the framework.
// https://github.com/MineEjo/reiodart/wiki

VirtualNode $Congratulations([ComponentOptions options]) {
  VirtualNode render() {
    return div({'onDestroy': () => print('Congratulations have been destroyed =( !')},
        [span('🎉 Congratulations, you have 10 clicks! 🎉')]);
  }

  /// Watcher helps to work with the virtual node.
  Watcher watcher = Watcher();

  watcher.init(() {
    /// Saving a virtual node.
    watcher.virtualNode = render();

    /// Mounting a virtual node.
    watcher.virtualNode.mount(options!['target']);
  });

  /// The watcher checks the reactive values.
  /// How many reactive values you get in one caretaker is how many times it will trigger.
  watcher.watch(() {
    /// Note the global storage, in this component, a node of this component is passed to get().
    /// This is needed to remove dependencies in the future if the component is destroyed.
    print('Congratulations, you have ${store['clicks']?.get(watcher.virtualNode)} clicks!');
  });

  /// Be sure to return it, to work with it in other components.
  return watcher.virtualNode;
}

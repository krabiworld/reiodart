import 'dart:html';

import 'package:reio/reio.dart';

import 'counter.reio.dart';

// If this is your first time using Reio, it is highly
// it is highly recommended that you open the documentation of the framework.
// https://github.com/MineEjo/reiodart/wiki

VirtualNode $App([ComponentOptions options]) {
  Watcher watcher = Watcher();

  watcher.watch(() {
    watcher.components(() {
      $Counter({'target': document.getElementById('app')});
    });
  });

  return watcher.virtualNode;
}

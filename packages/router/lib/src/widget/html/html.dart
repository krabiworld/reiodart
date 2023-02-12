// Copyright (c) MineEjo.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import 'dart:html';

/// Contains the name of the custom event
/// that is triggered if the URL
/// of the page was changed using the router.
final String routerEvent = 'reio-router-event';

/// Binds the [function] to a router event.
void onRoute(Function() function) {
  window.addEventListener(routerEvent, (event) => function.call());
}

/// Binds the [function] to a router event.
void onPopState(Function() function) {
  window.onPopState.listen((event) {
    function.call();
  });
}

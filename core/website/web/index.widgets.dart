import 'dart:html';

import 'widgets/counter.dart';
import 'widgets/layout.dart';
import 'widgets/observer.dart';

void widgetConstruction() {
  layout.inject(document.getElementById('app'));

  constructCounter();
  constructObserver();
}

void constructCounter() {
  counter.toSlot(Layout.counterSlot);
}

void constructObserver() {
  observer.toSlot(Layout.observerSlot);
}

import 'dart:html';

import 'widgets/counter.dart';
import 'widgets/layout.dart';
import 'widgets/observer.dart';

void widgetConstruction() {
  layout.inject(document.getElementById('app'));
  counter.toSlot(Layout.counterSlot);
  observer.toSlot(Layout.observerSlot);
}

import 'dart:html';

import 'widgets/about.dart';
import 'widgets/layout.dart';
import 'widgets/quick_start.dart';

void widgetConstruction() {
  layout.inject(document.getElementById('app'));

  about.toRoute(Layout.aboutSlot, staticPath: '/');
  about.toRoute(Layout.aboutSlot, staticPath: '/index.html');

  quickStart.toRoute(Layout.quickStartSlot,
      dynamicPath: r'\?.[a-zA-Z]*=[a-zA-Z]');
}

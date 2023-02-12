import 'dart:html';

import 'widgets/about.dart';
import 'widgets/layout.dart';
import 'widgets/quick_start.dart';

void widgetConstruction() {
  layout.inject(document.getElementById('app'));

  about.toSlot(Layout.aboutSlot, staticPath: '/');
  about.toSlot(Layout.aboutSlot, staticPath: '/index.html');

  quickStart.toSlot(Layout.quickStartSlot,
      dynamicPath: r'\?.[a-zA-Z]*=[a-zA-Z]');
}

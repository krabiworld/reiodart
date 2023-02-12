import 'dart:html';

import 'widgets/about.dart';
import 'widgets/layout.dart';
import 'widgets/quick_start.dart';

String pathRoot = '/reiodart/docs/web/';
String pathIndex = '${pathRoot}index.html';
String pathQuickStart = '${pathRoot}quick-start.html';

void widgetConstruction() {
  layout.inject(document.getElementById('app'));

  about.toRoute(Layout.aboutSlot, staticPath: pathRoot);
  about.toRoute(Layout.aboutSlot, staticPath: pathIndex);

  quickStart.toRoute(Layout.quickStartSlot, staticPath: pathQuickStart);

  // quickStart.toRoute(Layout.quickStartSlot,
  //     dynamicPath: r'\?.[a-zA-Z]*=[a-zA-Z]');
}

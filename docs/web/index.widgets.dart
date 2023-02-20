import 'dart:html';

import 'widgets/about.dart';
import 'widgets/layout.dart';
import 'widgets/quick_start.dart';

RegExp pathRoot = RegExp('/reiodart/docs/web/');
RegExp pathIndex = RegExp('${pathRoot}index.html');
RegExp pathQuickStart = RegExp('${pathRoot}quick-start.html');

void widgetConstruction() {
  layout.inject(document.getElementById('app'));

  about.toRoute(Layout.aboutSlot, pathRoot);
  about.toRoute(Layout.aboutSlot, pathIndex);


  quickStart.toRoute(Layout.quickStartSlot, pathQuickStart);
}

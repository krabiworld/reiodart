import 'dart:html';

import 'widgets/index.dart';
import 'widgets/layout.dart';
import 'widgets/ofdex.dart';

String pathRoot = '/';
String pathIndex = '${pathRoot}index.html';
String pathQuickStart = '${pathRoot}ofdex.html';

void widgetConstruction() {
  layout.inject(document.getElementById('app'));

  index.toRoute(Layout.indexSlot, staticPath: [pathRoot, pathIndex]);
  ofdex.toRoute(Layout.ofdexSlot, staticPath: [pathQuickStart]);
}

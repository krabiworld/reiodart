import 'dart:html';

import 'widgets/index.dart';
import 'widgets/layout_router.dart';
import 'widgets/ofdex.dart';

String pathRoot = '/';
String pathIndex = '${pathRoot}index.html';
String pathOfdex = '${pathRoot}ofdex.html';

RegExp routeIndex = RegExp(r'(/$)|(/index.html$)');
RegExp routeOfdex = RegExp(r'/ofdex.html$');

void widgetConstruction() {
  layoutRouter.inject(document.getElementById('app'));

  index.toRoute(Layout.indexSlot, routeIndex, lazy: true);
  ofdex.toRoute(Layout.ofdexSlot, routeOfdex, lazy: true);
}

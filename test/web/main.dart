import 'dart:html';

import 'components/app.dart';
import 'components/link.dart';
import 'components/test.dart';

void main() {
  // If this is your first time using Reio, it is highly
  // it is highly recommended that you open the documentation of the framework.
  // https://github.com/MineEjo/reiodart/wiki

  app.inject(document.getElementById('app'));

  test.mount(app);
  normLink.toSlot(Test.slotLink);
}

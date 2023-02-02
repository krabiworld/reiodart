import 'dart:html';

import 'package:reio/reio.dart';

import 'test.dart';

class NormLink extends ReioWidget {
  NormLink(super.construct, super.styles);

  static int value = 0;

  @override
  void activity() {
    value = Test.store.get('clicks', this);
  }
}

ReioWidget normLink = NormLink(
    (w) => Div('dddddddddddddddd')
        .$(Div(NormLink.value.toString()))
        .removeIfTrue(w, 23, () => NormLink.value > 5),
    null);

import 'dart:html';

import 'package:reio/reio.dart';

// If this is your first time using Reio, it is highly
// it is highly recommended that you open the documentation of the framework.
// https://github.com/MineEjo/reiodart/wiki

class Test extends ReioWidget {
  static String metaName = 'Test';

  static int value = 0;
  static ReioWritableStore store = ReioWritableStore({'clicks': value});

  Test(super.construct, super.styles);

  @override
  void activity() {
    value = store.get('clicks', this);
  }

  static void plus(Element el, Event ev) {
    store.update('clicks', test, (value) => value + 1);
  }

  static void minus(Element el, Event ev) {
    store.update('clicks', test, (value) => value - 1);
  }
}

ReioWidget test = Test(
    (w) => Div()
        .thisClass(['hello'])
        .$(Div('Clicks one: ${Test.value}')
            .id(Test.value.toString())
            .thisClass(['world']).remove(w))
        .$(Div('Clicks dtwo: ${Test.value}')
            .id('main')
            .thisClass(['Cool', 'Class', 'Norm'])
            .on('click', (p0, p1) => print(2))
            .removeIfTrue(w, 2, () => Test.value > 10)
            .$(Div('Test!!!')
                .id('second')
                .lang('ru')
                .style(['margin: 10px', 'padding: 10px'])
                .$(Input('cool value')
                    .value('1')
                    .disabled(true)
                    .type('number')
                    .id('ok'))))
        .$(Button('Plus').onClick(Test.plus))
        .$(Button('Minus').onClick(Test.minus)),
    () => '''<style> 
    {public}: body {
      background: burlywood;
    } 
    </style>''');

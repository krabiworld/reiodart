import 'dart:html';

import 'package:reio/reio.dart';

// If this is your first time using Reio, it is highly
// it is highly recommended that you open the documentation of the framework.
// https://github.com/MineEjo/reiodart/wiki

class Test extends ReioComponent {
  static int value = 0;
  static ReioWritableStore store = ReioWritableStore({'clicks': value});

  Test(super.construct, super.styles);

  @override
  void activity() {
    value = store.get('clicks', this);
  }

  static void increase(Element htmlElement) {
    htmlElement.onClick
        .listen((event) => store.update('clicks', test, (value) => value + 1));
  }
}

ReioComponent test = Test(
    () => div([
          'class hello'
        ], [
          div('Clicks: ${Test.value}', ['id ${Test.value}', 'class world']),
          button('Increase', {'onMount': Test.increase})
        ]),
    () => '''<style> 
    {public}: body {
      background: burlywood
    } 
    </style>''');

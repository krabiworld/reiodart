import 'dart:html';

import 'package:reio/widget.dart';
import 'package:reio/widget_html.dart';

class QuickStart extends Widget {
  QuickStart(super.construct, super.styles);

  @override
  void activity() {
    print('Крутое значение: ${window.location.search}');
  }

  @override
  void onMount() {
    print('Виджет создан!');
  }

  @override
  void onDestroy() {
    print('Виджет уничтожен!');
  }
}

Widget quickStart = QuickStart(
    (w) => Div()
        .id('introduction')
        .$(H1(getJump(1)).setJump(
            {1: A('Quick Start').href('https://github.com/MineEjo/reiodart')}))
        .$(Span('Loooool')),
    () => null);

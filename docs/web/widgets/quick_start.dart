import 'package:reio/widget_html.dart';
import 'package:reio_router/widget.dart';

class QuickStart extends WidgetRouter {
  QuickStart(super.construct, super.styles);

  // @override
  // void onMount() {}

  // @override
  // void onDestroy() {}
}

WidgetRouter quickStart = QuickStart(
    (w) => Div()
        .id('introduction')
        .$(H1(getJump(1)).setJump(
            {1: A('Quick Start').href('https://github.com/MineEjo/reiodart')}))
        .$(Span('Dev...')),
    () => null);

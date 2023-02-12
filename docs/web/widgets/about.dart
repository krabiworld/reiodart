import 'package:reio/reio.dart';
import 'package:reio/widget_html.dart';
import 'package:reio_router/widget.dart';

class About extends WidgetRouter {
  About(super.construct, super.styles);
}

WidgetRouter about = About(
    (w) => Div()
        .id('introduction')
        .$(H1(getJump(1)).setJump({
          1: A('Reio Dart Framework ${Reio.version}')
              .href('https://github.com/MineEjo/reiodart')
        }))
        .$(Span('A progressive ${getJump(1)} framework for creating UI '
                'on the web. $br Uses HTML, CSS and ${getJump(2)}, which '
                'is compiled into efficient JavaScript code. '
                '$br $br'
                'By default, Reio template uses ${getJump(3)}')
            .setJump({
          1: A('Dart').href('https://dart.dev/'),
          2: A('Dart').href('https://dart.dev/'),
          3: A('Webdev').href('https://web.dev/')
        })),
    () => null);

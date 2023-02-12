import 'package:reio/widget_html.dart';
import 'package:reio_router/widget.dart';

class Index extends WidgetRouter {
  Index(super.construct, super.styles);
}

WidgetRouter index = Index((w) => Div('Index content!'), () => null);

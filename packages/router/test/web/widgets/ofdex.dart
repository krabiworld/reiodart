import 'package:reio/widget_html.dart';
import 'package:reio_router/widget.dart';

class Ofdex extends WidgetRouter {
  Ofdex(super.construct, super.styles);
}

WidgetRouter ofdex = Ofdex((w) => Div('Ofdex content!'), () => null);

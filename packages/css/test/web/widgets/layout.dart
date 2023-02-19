import 'package:reio/widget.dart';
import 'package:reio/widget_html.dart';
import 'package:reio_css/base.dart';

String _styles = importBaseStyles(tags: false);

class Layout extends Widget {
  static int indexSlot = slotNumber();
  static int ofdexSlot = slotNumber();

  Layout(super.construct, super.styles);
}

Widget layout = Layout(
    (w) => Div('General Div')
        .$(Button('Button'))
        .$(Select().$list([Option('First'), Option('Second')])),
    () => '''<style>$_styles</style>''');

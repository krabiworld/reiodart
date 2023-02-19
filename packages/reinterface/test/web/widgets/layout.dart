import 'package:reio/widget.dart';
import 'package:reio/widget_html.dart';

import '../index.widgets.dart';

class Layout extends Widget {
  static int indexSlot = slotNumber();
  static int ofdexSlot = slotNumber();

  Layout(super.construct, super.styles);
}

Widget layout = Layout(
    (w) => Div()
        .$(Span(getJump(1)).setJump({
          1: A('Index').href(pathIndex),
        }))
        .$(Span(getJump(1)).setJump({
          1: A('Ofdex').href(pathOfdex),
        }))
        .$slot(Layout.indexSlot)
        .$(Br())
        .$(Br())
        .$(Br())
        .$(Br())
        .$(Br())
        .$(Br())
        .$(Br())
        .$(Br())
        .$(Br())
        .$(Br())
        .$(Br())
        .$(Br())
        .$(Br())
        .$(Br())
        .$(Br())
        .$(Br())
        .$(Br())
        .$(Br())
        .$(Br())
        .$(Br())
        .$(Br())
        .$(Br())
        .$(Br())
        .$(Br())
        .$(Br())
        .$(Br())
        .$(Br())
        .$(Br())
        .$(Br())
        .$(Br())
        .$(Br())
        .$(Br())
        .$(Br())
        .$(Br())
        .$(Br())
        .$(Br())
        .$(Br())
        .$(Br())
        .$(Br())
        .$(Br())
        .$(Br())
        .$(Br())
        .$(Br())
        .$(Br())
        .$(Br())
        .$(Br())
        .$(Br())
        .$(Br())
        .$(Br())
        .$(Br())
        .$(Br())
        .$(Br())
        .$(Br())
        .$(Br())
        .$(Br())
        .$(Br())
        .$(Br())
        .$(Br())
        .$(Br())
        .$(Br())
        .$(Br())
        .$(Br())
        .$(Br())
        .$(Br())
        .$(Br())
        .$(Br())
        .$(Br())
        .$(Br())
        .$(Br())
        .$(Br())
        .$(Br())
        .$(Br())
        .$slot(Layout.ofdexSlot),
    () => null);

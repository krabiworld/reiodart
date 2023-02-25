import 'package:reio/widget_html.dart';
import 'package:reio/widget.dart';

import '../index.widgets.dart';

class Layout extends Widget {
  static int indexSlot = slotNumber();
  static int ofdexSlot = slotNumber();

  Layout(super.construct, super.styles);
}

Widget layoutRouter = Layout(
    (w) => Div()
        .$(Span(getJump(1)).setJump({
          1: Route('Index').href(pathIndex),
        }))
        .$(Span(getJump(1)).setJump({
          1: Route('Ofdex').href(pathOfdex),
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

import 'dart:html';

import '../node/virtual_node_widget.dart';
import 'virtual_controller.dart';

const String styleHtmlTag = 'style';
const String stylePrefix = 'reio-style-';
const String styleQuery = '$styleHtmlTag.$stylePrefix';

/// Initializes or overwrites a [VirtualNodeWidget].
class VirtualControllerWidget extends VirtualController {
  VirtualControllerWidget(super.node, [super.newNode]);

  void initStyles([Element? element]) {
    VirtualNodeWidget curNode = node as VirtualNodeWidget;

    if (curNode.styles == null) return;

    // Clears the line with
    // the style from the `<style>` tag.
    String? clearStyle(String? style) {
      return style
          ?.replaceFirst('<$styleHtmlTag>', '')
          .replaceFirst('</$styleHtmlTag>', '')
          .trim();
    }

    if (isUpdate) {
      // The style is updated only when there
      // is reactivity in it, that is, all the work
      // is on the watcher, and no additional
      // checks are required.

      Element? style =
          curNode.element?.querySelector(styleQuery + curNode.number);

      style?.text = clearStyle(curNode.styles);
    } else {
      if (element == null) return;

      Element style = StyleElement();
      style.className = stylePrefix + curNode.number;
      style.text = clearStyle(curNode.styles!);

      element.append(style);
    }
  }
}

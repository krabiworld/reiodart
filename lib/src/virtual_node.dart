import 'dart:html';

import 'script/uid.dart';
import 'virtual_node_controller.dart';

class VirtualNode {
  String tag;
  String? value;
  List<Attr>? attrs;
  List<VirtualNode>? children;
  Function(VirtualNode)? onMount;
  Function()? onDestroy;

  Element? _dom;
  String _css = '''<style></style>''';
  String _id = uid();
  List<String> _values = [];
  bool _mounted = false;

  VirtualNode(
      {required this.tag,
      this.value,
      this.attrs,
      this.children,
      this.onMount,
      this.onDestroy});

  bool get isMount => _mounted;

  String get id => _id;

  Element? get dom => _dom;

  String get css => _css;

  set css(String css) => _css = css;

  bool isNewValue(String value) => (_values.length > 1 && _values[0] != value);

  bool isOldValue(String value) => (_values.length == 1 && _values[0] == value);

  void destroy() {
    _dom?.remove();
    if (onDestroy != null) onDestroy!();
    _mounted = false;
    _dom = null;
  }

  void mount([Node? container]) {
    /// Saves the original values, if there are more than 1,
    /// it reverses the list and trims the rest, leaving the standard and new values.
    if (value != null && !_values.contains(value)) {
      _values.add(value!);

      if (_values.length > 1) {
        _values = _values.reversed.toList().sublist(0, 2);
      }
    }

    VirtualNodeController controller = VirtualNodeController(this);
    final Element element = document.createElement(tag);

    controller.initData(element);
    controller.initValue(element);
    controller.initAttrs(element);
    controller.initCss(element);
    controller.initChildren(element);

    if (container != null) container.append(element);
    _dom = element;

    if (onMount != null) onMount!(this);
    _mounted = true;
  }

  void replace(VirtualNode newNode) {
    if (tag != newNode.tag) {
      newNode.mount(_dom?.parentNode);
      destroy();
    } else {
      /// Saves the original values, if there are more than 1,
      /// it reverses the list and trims the rest, leaving the standard and new values.
      if (newNode.value != null && !_values.contains(newNode.value!)) {
        _values.add(newNode.value!);

        if (_values.length > 1) {
          _values = _values.reversed.toList().sublist(0, 2);
        }
      }

      VirtualNodeController controller = VirtualNodeController(this, newNode);

      /// The new virtual node does not have its own element in the DOM at this stage,
      /// but it must keep the data of the previous one.
      newNode._dom = _dom;
      newNode._id = _id;

      controller.initValue();
      controller.initAttrs();
      controller.initCss();
      controller.initChildren();
    }
  }
}

class Attr {
  String name;
  String value;

  Attr(this.name, this.value);
}

class Style {
  String name;
  String value;

  Style(
    this.name,
    this.value,
  );
}

import 'dart:html';

import 'package:reio/reio.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  String tagName = 'div';
  String tagNameChild = 'p';
  String value = 'value';
  String css = '''<style>{public}: .value { display: none }</style>''';
  VirtualNode virtualNode = VirtualNode(tag: tagName, children: [VirtualNode(tag: tagNameChild)]);
  final Element element = document.createElement(tagName);

  test('Creating a virtual node controller.', () {
    expect(VirtualNodeController(virtualNode).currentNode, equals(virtualNode));
  });

  group('Virtual Node Controller.', () {
    VirtualNodeController controller = VirtualNodeController(virtualNode);

    test('Installation of data in the element.', () {
      controller.initData(element);
      expect(element.attributes.length, isNot(0));
    });

    test('Installation of the value in the element.', () {
      virtualNode.value = value;
      controller.initValue(element);
      expect(element.innerHtml, equals(value));
    });

    test('Installation of the attribute in the element.', () {
      virtualNode.attrs = [Attr(value, value)];
      controller.initAttrs(element);
      expect(element.attributes, contains(value));
    });

    test('Installation of the css in the element.', () {
      element.innerHtml = '';
      virtualNode.css = css;
      controller.initCss(element);
      expect(element.childNodes.length, equals(1));
    });

    test('Installation of the children in the element.', () {
      element.innerHtml = '';
      controller.initChildren(element);
      expect(element.childNodes.length, equals(1));
    });
  });
}

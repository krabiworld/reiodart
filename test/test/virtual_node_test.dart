import 'dart:html';

import 'package:reio/reio.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  String tagName = 'div';
  String value = 'value';

  group('Virtual node.', () {
    VirtualNode virtualNode = VirtualNode(tag: tagName);
    VirtualNode virtualNode2 = VirtualNode(tag: tagName);
    virtualNode2.value = value;

    test('Creating a virtual node.', () {
      expect(virtualNode.tag, equals(tagName));
    });

    test('Mounting a virtual node.', () {
      virtualNode.mount(document.body);
      expect(document.body?.lastChild, equals(virtualNode.dom));
    });

    test('Destroying a virtual node.', () {
      virtualNode.mount(document.body);
      virtualNode.destroy();
      expect(document.body?.lastChild, isNot(virtualNode.dom));
    });

    test('Updating a virtual node.', () {
      virtualNode.mount(document.body);
      virtualNode.replace(virtualNode2);
      expect(document.body?.lastChild?.text, equals(value));
    });
  });

  test('Creating a virtual node using alias.', () {
    expect(v(tagName).tag, equals(tagName));
  });

  test('Creating a virtual node using a tag alias.', () {
    expect(div(tagName).tag, equals(tagName));
  });
}

import 'package:reio/reio.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  String tagName = 'div';
  String storeName = 'store';

  group('Observable.', () {
    VirtualNode virtualNode = VirtualNode(tag: tagName);

    test('Creating a watcher.', () {
      expect(Watcher().iterations, equals(0));
    });

    Watcher watcher = Watcher();

    test('Initializing a virtual node.', () {
      watcher.init(() {
        watcher.virtualNode = virtualNode;
      });

      expect(watcher.virtualNode.tag, equals(tagName));
    });

    test('Creating a reactive store.', () {
      ReactiveWritableStore store = $Writable({storeName: 1});
      expect(store[storeName]?.get(), equals(1));
    });

    ReactiveWritableStore store = $Writable({storeName: 0});

    test('Change in value in the reactive store.', () {
      store[storeName]?.set(1);
      expect(store[storeName]?.get(), equals(1));
    });
  });
}

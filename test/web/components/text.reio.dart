import 'package:reio/reio.dart';

// If this is your first time using Reio, it is highly
// it is highly recommended that you open the documentation of the framework.
// https://github.com/MineEjo/reiodart/wiki

/// Although the function returns a virtual node, the whole body is a component.
VirtualNode $Text([ComponentOptions options]) {
  /// Watcher helps to work with the virtual node.
  Watcher watcher = Watcher();

  watcher.init(() {
    /// Saving a virtual node.
    watcher.virtualNode = div([
      h2('Example Plain Text'),
      span('''Lorem Ipsum is simply dummy text of the printing and typesetting industry.
      Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, 
      when an unknown printer took a galley of type and scrambled it to make a type specimen book.
      It has survived not only five centuries,
      but also the leap into electronic typesetting, remaining essentially unchanged.
      It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, 
      and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.''')
    ]);

    /// Mounting a virtual node.
    watcher.virtualNode.mount(options!['target']);
  });

  /// Be sure to return it, to work with it in other components.
  return watcher.virtualNode;
}

import 'dart:html';

import 'package:reio/reio.dart';

import 'congratulations.reio.dart';
import 'text.reio.dart';

// If this is your first time using Reio, it is highly
// it is highly recommended that you open the documentation of the framework.
// https://github.com/MineEjo/reiodart/wiki

/// A global repository is created below, with this variable,
/// but changing it will not change the value in the repository,
/// this variable is for convenience.
int clicks = 0;

/// Being outside the component is a global storage and
/// can also be used in other components.
ReactiveWritableStore store = $Writable({'clicks': clicks});

/// Although the function returns a virtual node, the whole body is a component.
VirtualNode $Counter([ComponentOptions options]) {
  /// This function is initialized when the button is mounted,
  /// for this purpose onMount is written in the button.
  void increase(VirtualNode virtualNode) {
    /// When you click, the global click store is updated, in this case,
    /// the variable is first incremented by 1 and then written to the store.
    virtualNode.dom?.onClick.listen((event) => store['clicks']?.set(++clicks));
  }

  /// This function is initialized when the button is mounted,
  /// for this purpose onMount is written in the button.
  void decrease(VirtualNode virtualNode) {
    // When you click, the global click store is updated,
    // in which case the variable is first decreased by 1 and then written to the store.
    virtualNode.dom?.onClick.listen((event) => store['clicks']?.set(--clicks));
  }

  void destroyStore(VirtualNode virtualNode) {
    virtualNode.dom?.onClick.listen((event) {
      bool answer = window.confirm('Are you sure you want to destroy the store?');

      if (answer) {
        store['clicks']?.destroy();
        window.alert('The store is destroyed!');
      }
    });
  }

  List<String> emojis = ['😔', '😞', '😒', '😏', '😎', '😌', '😉', '😀', '😄', '😁', '🥳'];

  /// To change the design in the future, a function is used.
  VirtualNode render(int value) {
    return div([
      'class mobile'
    ], [
      a([
        'href https://github.com/MineEjo/reiodart',
        'target _blank',
        'title homepage'
      ], [
        img(['src assets/icon.png', 'alt Reio', 'width 200', 'height 200'])
      ]),
      h1('Reio'),
      h2('Example of reactivity'),
      p([
        span('Total clicks: '),
        span(['class count'], '$value'),
        span(['class emojis'], (value > 0 && value < emojis.length) ? emojis[value] : '🐒'),
        br(),
        span(['class hint'], 'Hint, try to get 10 clicks ;)')
      ]),
      button('Increase', {'onMount': increase}),
      button('Decrease', {'onMount': decrease}),
      button('Destroy', {'onMount': destroyStore})
    ]);
  }

  String mobileWidth = '365px';
  String tabletWidth = '900px';

  /// CSS block component, if something is not clear, go to the wikipedia framework.
  String renderCss = '''<style>
    /* Try not to load global.css, better to use the public modifier correctly. */
    {public}: body {
      display: flex;
	    flex-direction: column;
	    justify-content: center;
	    padding: 0 10vw 0 10vw;
	    align-items: center;
	    background: whitesmoke;
    }
  
    {private}: {
      text-align: center;
      background: white;
      border-radius: 15px;
      padding: 25px;
      box-shadow: rgba(149, 157, 165, 0.2) 0 8px 24px;
    }
    
    {protected}: .hint {
      opacity: 0.7;
    }
 
    {protected}: button {
      color: #e3334f;
      font-weight: bold;
      padding: 10px 20px;
      border-radius: 10px;
      background: black;
      cursor: pointer;
      font-size: 14px;
      transition: 0.3s ease;
    }
    
    {protected}: .count {
      color: #e3334f;
      font-weight: bold;
    }
    
    {protected}: .emojis {
      margin-left: 10px;
      font-size: 20px;
    }
    
    {protected}: button:not(:last-child) {
      margin-right: 5px;
    }
    
    {protected}: button:hover {
      color: white;
    }
    
    /* (@media screen and (max-width: $tabletWidth) {
     * {public}: body {
     * padding: 0 5vw 0 5vw;
     * }
     *
     * Note the bracket on the left "(", it is used as a sign to save text, 
     * after it, you can still write only before the modifier block as in the example. 
     * For example, you can use it if you want to specify rules or class before the modifier.
     */
    
    /* Try not to load global.css, better to use the public modifier correctly. */
    (@media screen and (max-width: $tabletWidth) {
    {public}: body {
      padding: 0 5vw 0 5vw;
    }
    
    /* Try not to load global.css, better to use the public modifier correctly. */
    (@media screen and (max-width: $mobileWidth) {
    {public}: body {
      padding: 0 0.5vw 0 0.5vw !important;
    }
    </style>''';

  /// Watcher helps to work with the virtual node.
  Watcher watcher = Watcher();

  watcher.init(() {
    /// Saving a virtual node.
    watcher.virtualNode = render(store['clicks']?.get());

    /// Saving styles of a virtual node.
    watcher.virtualNode.css = renderCss;

    /// Mounting a virtual node.
    watcher.virtualNode.mount(options!['target']);
  });

  /// This variable is needed to save the component, which is recreated in the watcher.
  VirtualNode? tempComponentStorage;

  /// The watcher checks the reactive values.
  /// How many reactive values you get in one caretaker is how many times it will trigger.
  watcher.watch(() {
    int clicks = store['clicks']?.get();
    bool tenClick = clicks == 10;

    /// Updating the styles of a virtual node.
    watcher.virtualNode.css = '''<style>
      $renderCss
      
      {protected}: .hint {display: ${tenClick ? 'none' : 'initial'}}
    </style>''';

    /// Rewriting the old virtual node values to the new ones.
    /// Replacing an old virtual node with a new one)
    watcher.virtualNode.replace(render(clicks));

    if (tenClick) {
      /// Creating a congratulations component in this virtual node, after 3 children.
      tempComponentStorage = $Congratulations({'target': watcher.virtualNode.children![3].dom});
    } else if (tempComponentStorage != null) {
      tempComponentStorage?.destroy();
      tempComponentStorage = null;
    }

    /// Initialize the other components in this.
    watcher.components(() {
      $Text({'target': watcher.virtualNode.dom});
    });
  });

  /// Be sure to return it, to work with it in other components.
  return watcher.virtualNode;
}

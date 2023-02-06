import 'dart:html';

import 'package:reio/widget.dart';

import 'counter.dart';

class Observer extends Widget {
  static int clicks = 1;

  Observer(super.construct, super.styles);

  @override
  void activity() {
    // If you refer to a third-party store,
    // remember to specify the default value,
    // for example with the operator - ??.
    // If you destroy the store,
    // the default value will be used.
    //
    // If the store is destroyed in this widget,
    // the last value will be used, not the default.
    clicks = Counter.clickStore.get('clicks', this) ?? 0;
  }

  static void clearStore(Element el, Event ev) {
    Counter.clickStore.clear();
    window.alert('The store has been cleared!');
  }

  static void destroyField(Element el, Event ev) {
    Counter.clickStore.destroy('clicks');
    window.alert('The field has been cleared!');
  }
}

Widget observer = Observer(
    (w) => Div()
        .id('observer')
        .$(Div()
            .thisClass(['desc'])
            .$(Span('Observer: ').thisClass(['title']))
            .$(Span('${Observer.clicks} $br').thisClass(['subtitle']))
            .$(Span('This is a reference to an existing store '
                '(in this example, the counter store) of another widget.')))
        .$(Div()
            .thisClass(['sidebar'])
            .$(Button('Clear the store!').onClick(Observer.clearStore))
            .$(Button('Destroy the field!').onClick(Observer.destroyField))),
    () => '''<style>
    #observer {
      background: var(--gradient-2);
      padding: var(--padding-1);
      display: grid;
      grid-column-gap: var(--grid-gap-1);
      grid-template-rows: auto auto;
      box-shadow: var(--box-shadow-1);
    }
    
    .subtitle {
      font-size: var(--font-size-1);
      font-weight: bold;
      color: var(--color-accent);
    }

    .condition {
      opacity: 0.7;
      color: var(--color-accent);
    }

   #observer .sidebar {
     display: grid;
     grid-template-columns: auto auto;
   }
   
   @media only screen and (max-width: 700px) {
      #observer .sidebar {
        grid-template-columns: auto;
      }
    }

   #observer .sidebar button {
     cursor: pointer;
     background: var(--color-text);
     border: var(--border-1);
     color: var(--color-background);
     font-size: var(--font-size-2);
     padding: var(--padding-3);
     font-weight: bold;
   }

   #observer .sidebar button:hover {
     background: var(--color-accent-text);
   }
    </style>''');

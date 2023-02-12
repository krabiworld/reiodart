import 'dart:html';

import 'package:reio/widget.dart';
import 'package:reio/widget_html.dart';
import 'package:reio/widget_stores.dart';

class Counter extends Widget {
  static int clicks = 1;
  static const minClicks = 1;
  static const maxVisibleClicks = 10;
  static const maxClicks = 11;
  static WritableStore clickStore = WritableStore({'clicks': minClicks});

  Counter(super.construct, super.styles);

  @override
  void activity() => clicks = clickStore.get('clicks', this);

  static void plus(Element el, Event ev) {
    clickStore.update('clicks', counter, (value) {
      if (value == maxClicks) return maxClicks;
      return value + 1;
    });
  }

  static void minus(Element el, Event ev) {
    clickStore.update('clicks', counter, (value) {
      if (value == minClicks) return minClicks;
      return value - 1;
    });
  }
}

Widget counter = Counter(
    (w) => Div()
        .id('counter')
        .$(Div()
            .$(Div()
                .thisClass(['desc'])
                .$(Span('Counter $br').thisClass(['title']))
                .$(Span('A simple counter that changes the number to show'
                    ' the reactivity and reactivity of the store. '))
                .$(Span('Progress bar will be removed if '
                        'the number > ${Counter.maxVisibleClicks}')
                    .thisClass(['condition'])))
            .$(Div()
                .onRemove(() => window.alert('Content is removed!'))
                .thisClass(['content']).removeIfTrue(
                    widget: w,
                    slot: 1,
                    condition: () {
                      return Counter.clicks > Counter.maxVisibleClicks;
                    })))
        .$(Div()
            .thisClass(['sidebar'])
            .$(Button('+').onClick(Counter.plus))
            .$(Button('-').onClick(Counter.minus))),
    () => '''<style>
    #counter {
      background: var(--gradient-2);
      padding: var(--padding-1);
      display: grid;
      grid-column-gap: var(--grid-gap-1);
      grid-template-columns: auto var(--grid-width-2);
      box-shadow: var(--box-shadow-1);
    }
    
    .title {
      font-size: var(--font-size-1);
      font-weight: bold;
    }
    
    .desc {
      opacity: 0.9;
      background: var(--color-background);
      padding: var(--padding-2);
      box-shadow: var(--box-shadow-1) inset;
    }
    
    .condition {
      opacity: 0.7;
      color: var(--color-accent);
    }
    
   .sidebar {
     display: grid;
   }
   
   .sidebar button {
     cursor: pointer;
     background: var(--gradient-2);
     border: var(--border-1);
     color: var(--color-background);
     font-size: var(--font-size-1);
     font-weight: bold;
     
   }
   
   .sidebar button:last-child {
     background: var(--gradient-3);
     border-top: none;
   }
   
   .sidebar button:hover {
     background: var(--gradient-5);
   }
   
   .sidebar button:last-child:hover {
     background: var(--gradient-4);
   }
   
   .content {
    font-weight: bold;
    color: var(--color-background);
    background: var(--color-shadow);
    overflow: hidden;
    border-right: var(--border-1);
    opacity: 0.9;
    text-align: center;
   }
   
   .content:after {
     content: '${Counter.clicks}';
     background: var(--color-accent);
     border: var(--border-1);
     overflow: hidden;
     padding-left: ${Counter.clicks * Counter.maxVisibleClicks / 2}%;
     padding-right: ${Counter.clicks * Counter.maxVisibleClicks / 2}%;
   }
    </style>''');

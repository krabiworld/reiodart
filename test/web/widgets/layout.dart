import 'package:reio/widget.dart';

class Layout extends Widget {
  static int counterSlot = slotNumber();
  static int observerSlot = slotNumber();

  Layout(super.construct, super.styles);

  @override
  void activity() {}
}

Widget layout = Layout(
    (w) => Div()
        .id('example')
        .$(Div()
            .id('introduction')
            .$(H1(go(1)).to({
              1: A('Reio Dart Framework 0.2.0')
                  .href('https://github.com/MineEjo/reiodart')
            }))
            .$(Span('A progressive ${go(1)} framework for creating UI '
                    'on the web. $br Uses HTML, CSS and ${go(2)}, which '
                    'is compiled into efficient JavaScript code. '
                    '$br $br'
                    'By default, Reio template uses ${go(3)}')
                .to({
              1: A('Dart').href('https://dart.dev/'),
              2: A('Dart').href('https://dart.dev/'),
              3: A('Webdev').href('https://web.dev/')
            })))
        .$(P('Examples').id('examples'))
        .$slot(Layout.counterSlot)
        .$(Br())
        .$slot(Layout.observerSlot)
        .$(Div()
            .id('footer')
            .$(Div('GitHub').thisClass(['footer-title'])
                .$(Span(go(1)).to({
                  1: A('Repository')
                      .href('https://github.com/MineEjo/reiodart'),
                }))
                .$(Span(go(1)).to({
                  1: A('Documentation')
                      .href('https://github.com/MineEjo/reiodart/wiki'),
                })))
            .$(Div('Pub.dev').thisClass(['footer-title'])
                .$(Span(go(1)).to({
                  1: A('Package').href('https://pub.dev/packages/reio'),
                }))
                .$(Span(go(1)).to({
                  1: A('API reference')
                      .href('https://pub.dev/documentation/reio/latest/'),
                }))))
        .$(Span('© 2023 MineEjo').id('footer-copy')),
    () => '''<style>
    #example {
      display: grid;
      margin: var(--margin-1);
      justify-content: center;
      grid-template-columns: var(--grid-width-1);
    }

    #examples {
      font-weight: bold;
      font-size: var(--font-size-1);
    }

    h1 a {
      color: var(--color-accent);
    }

    a {
      color: var(--color-accent-text);
      text-decoration: none;
      box-shadow: var(--box-shadow-2);
    }

    a:hover {
      box-shadow: var(--box-shadow-3);
    }

    #footer, #footer-copy {
      margin-top: var(--margin-top-1);
      background-color: var(--color-shadow);
      padding: var(--padding-1);
      display: grid;
      grid-template-columns: auto auto;
    }
    
    #footer-copy {
      background-color: var(--color-background);
      margin-top: 0;
      justify-content: center;
    }

    @media only screen and (max-width: 700px) {
      #footer {
        grid-template-columns: auto;
      }
    }

    .footer-title {
      font-weight: bold;
      list-style: none;
      display: block;
    }
    
    .footer-title span {
      display: block;
      font-weight: normal;
    }
    </style>''');

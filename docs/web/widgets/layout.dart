import 'package:reio/widget.dart';

class Layout extends Widget {
  Layout(super.construct, super.styles);

  @override
  void activity() {}
}

Widget layout = Layout(
    (w) => Div()
        .id('example')
        .$(Nav().id('docs-nav').$(Div('Getting Started')
                .thisClass(['docs-title']).$(Span(getJump(1)).setJump({
              1: A('Quick Start').href('quick-start.html'),
            }))))
        .$(Div()
            .$(Div()
                .id('introduction')
                .$(H1(getJump(1)).setJump({
                  1: A('Reio Dart Framework 0.2.2')
                      .href('https://github.com/MineEjo/reiodart')
                }))
                .$(Span('A progressive ${getJump(1)} framework for creating UI '
                        'on the web. $br Uses HTML, CSS and ${getJump(2)}, which '
                        'is compiled into efficient JavaScript code. '
                        '$br $br'
                        'By default, Reio template uses ${getJump(3)}')
                    .setJump({
                  1: A('Dart').href('https://dart.dev/'),
                  2: A('Dart').href('https://dart.dev/'),
                  3: A('Webdev').href('https://web.dev/')
                })))
            .$(Div()
                .id('footer')
                .$(Div('GitHub')
                    .thisClass(['footer-title'])
                    .$(Span(getJump(1)).setJump({
                      1: A('Repository')
                          .href('https://github.com/MineEjo/reiodart'),
                    }))
                    .$(Span(getJump(1)).setJump({
                      1: A('Documentation')
                          .href('https://mineejo.github.io/reiodart/'),
                    })))
                .$(Div('Pub.dev')
                    .thisClass(['footer-title'])
                    .$(Span(getJump(1)).setJump({
                      1: A('Package').href('https://pub.dev/packages/reio'),
                    }))
                    .$(Span(getJump(1)).setJump({
                      1: A('API reference')
                          .href('https://pub.dev/documentation/reio/latest/'),
                    }))))
            .$(Span('© 2023 MineEjo').id('footer-copy'))),
    () => '''<style>
    #example {
      display: grid;
      margin: var(--margin-1);
      justify-content: center;
      grid-column-gap: 1%;
      grid-template-columns: 20% 79%;
    }
    
    .docs-title {
      font-weight: bold;
      display: block;
    }
    
    .docs-title span {
      font-weight: normal;
      display: block;
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
      margin-top: 0;
      justify-content: center;
    }

    @media only screen and (max-width: 700px) {
      #footer {
        grid-template-columns: auto;
      }
    }

    .footer-title {
      padding: var(--padding-3);
      font-weight: bold;
      list-style: none;
      display: block;
    }
    
    .footer-title span {
      padding-top: var(--padding-4);
      display: block;
      font-weight: normal;
    }
    </style>''');

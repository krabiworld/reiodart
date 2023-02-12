import 'package:reio/widget_html.dart';
import 'package:reio_router/widget.dart';
import 'package:reio_router/widget_html.dart';

class Layout extends WidgetRouter {
  static int aboutSlot = slotNumber();
  static int quickStartSlot = slotNumber();

  Layout(super.construct, super.styles);
}

WidgetRouter layout = Layout(
    (w) => Div()
        .id('example')
        .$(Nav()
            .id('docs-nav')
            .$(Div('Getting Started')
                .thisClass(['docs-title']).$(Span(getJump(1)).setJump({
              1: Route('About').href('/index.html'),
            })))
            .$(Span(getJump(1)).setJump({
              1: Route('Quick Start').href('/quick-start.html'),
            })))
        .$(Div()
            // .$list([Span('a'), Span('b'), Span('c')])
            .$slot(Layout.aboutSlot)
            .$slot(Layout.quickStartSlot)
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

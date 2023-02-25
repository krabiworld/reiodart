import 'dart:html';

import 'package:reio/widget.dart';
import 'package:reio/widget_html.dart';
import 'package:reio/widget_stores.dart';
import 'package:reio/widget_css.dart';

class Layout extends Widget {
  static int indexSlot = slotNumber();
  static int ofdexSlot = slotNumber();

  static Theme theme = Theme.light;
  static bool dialog = false;
  static WritableStore store =
      WritableStore({'theme': theme, 'dialog': dialog});

  static Dialog dialogElement = Dialog();

  Layout(super.construct, super.styles);

  @override
  void activity() {
    theme = store.get('theme', this);
    dialog = store.get('dialog', this);

    if (dialog == true) {
      (dialogElement.node.element as DialogElement).showModal();
    }
  }
}

Widget layoutCss = Layout(
    (w) => Div()
        .$(Layout.dialogElement.$(Header('This is a sample dialog')).$(Form()
            .method('dialog')
            .$(P('Lorem Ipsum has been the industry\'s '
                'standard dummy text ever since the 1500s, '
                'when an unknown printer took a galley of '
                'type and scrambled it to make a type specimen book.'))
            .$(Button('Close Dialog')
                .onClick((p0, p1) => Layout.store.set('dialog', false))
                .style(['width: 100%']))))
        .$(Button('Open Dialog')
            .onClick((p0, p1) => Layout.store.set('dialog', true)))
        .$(H1('Lorem Ipsum'))
        .$(H2('Simply, dummy'))
        .$(H3('Lorem Ipsum is simply dummy '
            'text of the printing and typesetting industry.'))
        .$(H4('Lorem Ipsum has been the industry\'s '
            'standard dummy text ever since the 1500s, '
            'when an unknown printer took a galley of '
            'type and scrambled it to make a type specimen book.'))
        .$(Hr())
        .$(P('Paragraph'))
        .$(Kbd('Kbd').thisClass(['rsr']))
        .$(Abbr('Abbr').title('abbr').thisClass(['rsr']))
        .$(Mark('Mark').thisClass(['rsr']))
        .$(A('HyperLink').href('href').thisClass(['rsr']))
        .$(A(getJump(1))
            .href('href')
            .setJump({1: Code('HyperLink Code')}).thisClass(['rsr']))
        .$(Var('Var').thisClass(['rsr']))
        .$(BlockQuote('Dummy text ever since the 1500s,'
            ' when an unknown printer took a galley of type and scrambled it to make a type '
            'specimen book. It has survived not only five centuries, but also the leap into'))
        .$(P('${getJump(1)} is simply dummy text of the printing and industry. '
                'Lorem Ipsum has been the industry\'s ${getJump(2)} dummy text ever since the 1500s,'
                ' when an ${getJump(3)} of type and scrambled it to make a type '
                'specimen book. It has survived not ${getJump(4)} five centuries, but also the leap into'
                ' electronic typesetting, remaining essentially unchanged.')
            .setJump({
          1: Strong('Lorem Ipsum'),
          2: Code('Code'),
          3: Mark('unknown printer took a galley'),
          4: A('hyperlink').href('href')
        }))
        .$(Pre().$(Code(
            'Pre - Code: Lorem Ipsum is simply dummy text of the printing and typesetting industry.'
            ' Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an '
            'unknown printer took a galley of type and scrambled it to make a type specimen book. '
            'It has survived not only five centuries, but also the leap into electronic typesetting, '
            'remaining essentially unchanged. It was popularised in the 1960s with the release of '
            'Letraset sheets containing Lorem Ipsum passages, and more recently with desktop '
            'publishing software like Aldus PageMaker including versions of Lorem Ipsum.')))
        .$(Input('1').type('number'))
        .$(Input('Search').type('search'))
        .$(Input('').placeholder('Placeholder'))
        .$(Select().$list([Option('First Option'), Option('Second Option')]))
        .$(Select().multiple(true).$list([
          Option('First Option'),
          Option('Second Option'),
          Option('Third Option'),
          Option('Fourth Option'),
          Option('Fifth Option')
        ]))
        .$(TextArea(
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.'
            ' Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,'
            ' when an unknown printer took a galley of type and scrambled it '
            'to make a type specimen book.'))
        .$(Details('Something small enough to escape casual notice.')
            .$(Summary('Details')))
        .$(Form().$(
            FieldSet().$(Legend('Legend')).$(Input('Input')).$(Input('Button').type('button')).$(Input('Submit').type('submit')).$(Input('Reset').type('reset'))))
        .$(Table().$(Caption(getJump(1)).setJump({1: H3('Council budget (in £) 2018')})).$(THead().$(Tr().$(Th('Items')).$(Th('Expenditure').scope('col')))).$(TBody().$(Tr().$(Th('Donuts').scope('row')).$(Td('3,000'))).$(Tr().$(Th('Stationery').scope('row')).$(Td('18,000'))).$(Tr().$(Th('Simple').scope('row')).$(Td('2,000')))))
        .$(Div().thisClass(['rli']).$(Label('Simple checkbox').thisFor('checkbox')).$(Input('').type('checkbox').id('checkbox')))
        .$(Div().thisClass(['rli']).$(Label('Simple radio').thisFor('radio')).$(Input('').type('radio').id('radio')))
        .$(Div().thisClass(['rli']).$(Label('Simple color').thisFor('color')).$(Input('#000000').type('color').id('color')))
        .$(Br())
        .$(Input('').type('date'))
        .$(Input('').type('time'))
        .$(Input('').type('file'))
        .$(Button('Light Theme').onClick((p0, p1) => Layout.store.set('theme', Theme.light)))
        .$(Button('Dark Theme').onClick((p0, p1) => Layout.store.set('theme', Theme.dark)))
        .$(Footer().$(Span('Footer Lorem Ipsum is simply dummy text of the printing and typesetting industry.'
            ' Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an '
            'unknown printer took a galley of type and scrambled it to make a type specimen book. '
            'It has survived not only five centuries, but also the leap into electronic typesetting, '
            'remaining essentially unchanged. It was popularised in the 1960s with the release of '
            'Letraset sheets containing Lorem Ipsum passages, and more recently with desktop '
            'publishing software like Aldus PageMaker including versions of Lorem Ipsum.'))),
    () => importStyle(theme: Layout.theme, tags: true));

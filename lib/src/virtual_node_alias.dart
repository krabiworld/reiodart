import 'virtual_node.dart';

/// V is an abbreviation and takes 4 [VirtualNode] parameters.
/// The parameters correspond to the original, but in any order.
VirtualNode v(String tag, [dynamic v1, dynamic v2, dynamic v3, dynamic v4]) {
  dynamic value, attrs, children, onMount, onDestroy;
  final List<dynamic> values = [v1, v2, v3, v4];

  for (dynamic val in values) {
    if (val == null) {
      continue;
    } else if (val is String) {
      /// A string is always a value.
      value = val;
    } else if (val is List) {
      /// If the list contains strings, they are always attributes.
      if (val.first is String) {
        List<Attr> attributes = [];

        for (String v in val) {
          String name = v.split(' ')[0];
          String value = v.replaceFirst('$name', '').trim();
          attributes.add(Attr(name, value));
        }

        attrs = attributes;
      } else if (val.first is VirtualNode) {
        /// Otherwise, the list contains virtual nodes.
        children = val;
      }
    } else if (val is Map) {
      /// Event triggers are placed in the map.
      if (val['onMount'] != null) onMount = val['onMount'];
      if (val['onDestroy'] != null) onDestroy = val['onDestroy'];
    }
  }

  return VirtualNode(tag: tag, value: value, attrs: attrs, children: children, onMount: onMount, onDestroy: onDestroy);
}

VirtualNode a([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('a', v1, v2, v3, v4);

VirtualNode abbr([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('abbr', v1, v2, v3, v4);

VirtualNode address([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('address', v1, v2, v3, v4);

VirtualNode area([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('area', v1, v2, v3, v4);

VirtualNode article([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('article', v1, v2, v3, v4);

VirtualNode aside([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('aside', v1, v2, v3, v4);

VirtualNode audio([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('audio', v1, v2, v3, v4);

VirtualNode b([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('b', v1, v2, v3, v4);

VirtualNode base([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('base', v1, v2, v3, v4);

VirtualNode bdi([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('bdi', v1, v2, v3, v4);

VirtualNode bdo([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('bdo', v1, v2, v3, v4);

VirtualNode blockquote([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('blockquote', v1, v2, v3, v4);

VirtualNode body([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('body', v1, v2, v3, v4);

VirtualNode br([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('br', v1, v2, v3, v4);

VirtualNode button([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('button', v1, v2, v3, v4);

VirtualNode canvas([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('canvas', v1, v2, v3, v4);

VirtualNode caption([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('caption', v1, v2, v3, v4);

VirtualNode cite([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('cite', v1, v2, v3, v4);

VirtualNode code([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('code', v1, v2, v3, v4);

VirtualNode col([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('col', v1, v2, v3, v4);

VirtualNode colgroup([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('colgroup', v1, v2, v3, v4);

VirtualNode data([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('data', v1, v2, v3, v4);

VirtualNode datalist([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('datalist', v1, v2, v3, v4);

VirtualNode dd([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('dd', v1, v2, v3, v4);

VirtualNode del([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('del', v1, v2, v3, v4);

VirtualNode details([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('details', v1, v2, v3, v4);

VirtualNode dfn([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('dfn', v1, v2, v3, v4);

VirtualNode dialog([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('dialog', v1, v2, v3, v4);

VirtualNode div([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('div', v1, v2, v3, v4);

VirtualNode dl([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('dl', v1, v2, v3, v4);

VirtualNode dt([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('dt', v1, v2, v3, v4);

VirtualNode em([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('em', v1, v2, v3, v4);

VirtualNode embed([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('embed', v1, v2, v3, v4);

VirtualNode fieldset([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('fieldset', v1, v2, v3, v4);

VirtualNode figcaption([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('figcaption', v1, v2, v3, v4);

VirtualNode figure([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('figure', v1, v2, v3, v4);

VirtualNode footer([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('footer', v1, v2, v3, v4);

VirtualNode form([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('form', v1, v2, v3, v4);

VirtualNode h1([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('h1', v1, v2, v3, v4);

VirtualNode h2([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('h2', v1, v2, v3, v4);

VirtualNode h3([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('h3', v1, v2, v3, v4);

VirtualNode h4([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('h4', v1, v2, v3, v4);

VirtualNode h5([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('h5', v1, v2, v3, v4);

VirtualNode h6([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('h6', v1, v2, v3, v4);

VirtualNode head([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('head', v1, v2, v3, v4);

VirtualNode header([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('header', v1, v2, v3, v4);

VirtualNode hr([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('hr', v1, v2, v3, v4);

VirtualNode i([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('i', v1, v2, v3, v4);

VirtualNode iframe([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('iframe', v1, v2, v3, v4);

VirtualNode img([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('img', v1, v2, v3, v4);

VirtualNode input([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('input', v1, v2, v3, v4);

VirtualNode ins([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('ins', v1, v2, v3, v4);

VirtualNode kbd([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('kbd', v1, v2, v3, v4);

VirtualNode label([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('label', v1, v2, v3, v4);

VirtualNode legend([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('legend', v1, v2, v3, v4);

VirtualNode li([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('li', v1, v2, v3, v4);

VirtualNode link([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('link', v1, v2, v3, v4);

VirtualNode main([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('main', v1, v2, v3, v4);

VirtualNode map([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('map', v1, v2, v3, v4);

VirtualNode mark([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('mark', v1, v2, v3, v4);

VirtualNode meta([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('meta', v1, v2, v3, v4);

VirtualNode meter([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('meter', v1, v2, v3, v4);

VirtualNode nav([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('nav', v1, v2, v3, v4);

VirtualNode noscript([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('noscript', v1, v2, v3, v4);

VirtualNode object([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('object', v1, v2, v3, v4);

VirtualNode ol([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('ol', v1, v2, v3, v4);

VirtualNode optgroup([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('optgroup', v1, v2, v3, v4);

VirtualNode option([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('option', v1, v2, v3, v4);

VirtualNode output([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('output', v1, v2, v3, v4);

VirtualNode p([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('p', v1, v2, v3, v4);

VirtualNode param([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('param', v1, v2, v3, v4);

VirtualNode picture([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('picture', v1, v2, v3, v4);

VirtualNode pre([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('pre', v1, v2, v3, v4);

VirtualNode progress([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('progress', v1, v2, v3, v4);

VirtualNode q([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('q', v1, v2, v3, v4);

VirtualNode ruby([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('ruby', v1, v2, v3, v4);

VirtualNode rb([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('rb', v1, v2, v3, v4);

VirtualNode rt([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('rt', v1, v2, v3, v4);

VirtualNode rtc([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('rtc', v1, v2, v3, v4);

VirtualNode rp([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('rp', v1, v2, v3, v4);

VirtualNode s([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('s', v1, v2, v3, v4);

VirtualNode samp([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('samp', v1, v2, v3, v4);

VirtualNode script([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('script', v1, v2, v3, v4);

VirtualNode section([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('section', v1, v2, v3, v4);

VirtualNode select([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('select', v1, v2, v3, v4);

VirtualNode small([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('small', v1, v2, v3, v4);

VirtualNode source([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('source', v1, v2, v3, v4);

VirtualNode span([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('span', v1, v2, v3, v4);

VirtualNode strong([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('strong', v1, v2, v3, v4);

VirtualNode style([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('style', v1, v2, v3, v4);

VirtualNode sub([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('sub', v1, v2, v3, v4);

VirtualNode summary([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('summary', v1, v2, v3, v4);

VirtualNode sup([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('sup', v1, v2, v3, v4);

VirtualNode table([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('table', v1, v2, v3, v4);

VirtualNode tbody([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('tbody', v1, v2, v3, v4);

VirtualNode td([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('td', v1, v2, v3, v4);

VirtualNode template([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('template', v1, v2, v3, v4);

VirtualNode textarea([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('textarea', v1, v2, v3, v4);

VirtualNode tfoot([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('tfoot', v1, v2, v3, v4);

VirtualNode th([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('th', v1, v2, v3, v4);

VirtualNode thead([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('thead', v1, v2, v3, v4);

VirtualNode time([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('time', v1, v2, v3, v4);

VirtualNode title([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('title', v1, v2, v3, v4);

VirtualNode tr([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('tr', v1, v2, v3, v4);

VirtualNode track([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('track', v1, v2, v3, v4);

VirtualNode u([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('u', v1, v2, v3, v4);

VirtualNode ul([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('ul', v1, v2, v3, v4);

VirtualNode var_([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('var', v1, v2, v3, v4);

VirtualNode video([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('video', v1, v2, v3, v4);

VirtualNode wbr([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) => v('wbr', v1, v2, v3, v4);

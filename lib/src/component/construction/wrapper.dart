import '../../node/handler.dart';

/// V is an abbreviation and takes 4 [ReioNodeComponent] parameters.
/// The parameters correspond to the original, but in any order.
ReioNodeComponent v(String tag,
    [dynamic v1, dynamic v2, dynamic v3, dynamic v4]) {
  dynamic value = '',
      attrs,
      children,
      onMount = (component) {},
      onDestroy = () {};
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
        List<ReioNodeAttr> attributes = [];

        for (String v in val) {
          String name = v.split(' ')[0];
          String value = v.replaceFirst(name, '').trim();
          attributes.add(ReioNodeAttr(name, value));
        }

        attrs = attributes;
      } else if (val.first is ReioNodeComponent) {
        /// Otherwise, the list contains virtual nodes.
        children = val;
      }
    } else if (val is Map) {
      /// Event triggers are placed in the map.
      if (val['onMount'] != null) onMount = val['onMount'];
      if (val['onDestroy'] != null) onDestroy = val['onDestroy'];
    }
  }

  return ReioNodeComponent(
      tag: tag,
      value: value,
      attrs: attrs,
      children: children,
      onMount: onMount,
      onDestroy: onDestroy);
}

ReioNodeComponent a([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('a', v1, v2, v3, v4);

ReioNodeComponent abbr([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('abbr', v1, v2, v3, v4);

ReioNodeComponent address([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('address', v1, v2, v3, v4);

ReioNodeComponent area([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('area', v1, v2, v3, v4);

ReioNodeComponent article([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('article', v1, v2, v3, v4);

ReioNodeComponent aside([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('aside', v1, v2, v3, v4);

ReioNodeComponent audio([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('audio', v1, v2, v3, v4);

ReioNodeComponent b([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('b', v1, v2, v3, v4);

ReioNodeComponent base([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('base', v1, v2, v3, v4);

ReioNodeComponent bdi([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('bdi', v1, v2, v3, v4);

ReioNodeComponent bdo([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('bdo', v1, v2, v3, v4);

ReioNodeComponent blockquote(
        [dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('blockquote', v1, v2, v3, v4);

ReioNodeComponent body([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('body', v1, v2, v3, v4);

ReioNodeComponent br([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('br', v1, v2, v3, v4);

ReioNodeComponent button([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('button', v1, v2, v3, v4);

ReioNodeComponent canvas([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('canvas', v1, v2, v3, v4);

ReioNodeComponent caption([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('caption', v1, v2, v3, v4);

ReioNodeComponent cite([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('cite', v1, v2, v3, v4);

ReioNodeComponent code([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('code', v1, v2, v3, v4);

ReioNodeComponent col([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('col', v1, v2, v3, v4);

ReioNodeComponent colgroup([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('colgroup', v1, v2, v3, v4);

ReioNodeComponent data([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('data', v1, v2, v3, v4);

ReioNodeComponent datalist([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('datalist', v1, v2, v3, v4);

ReioNodeComponent dd([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('dd', v1, v2, v3, v4);

ReioNodeComponent del([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('del', v1, v2, v3, v4);

ReioNodeComponent details([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('details', v1, v2, v3, v4);

ReioNodeComponent dfn([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('dfn', v1, v2, v3, v4);

ReioNodeComponent dialog([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('dialog', v1, v2, v3, v4);

ReioNodeComponent div([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('div', v1, v2, v3, v4);

ReioNodeComponent dl([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('dl', v1, v2, v3, v4);

ReioNodeComponent dt([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('dt', v1, v2, v3, v4);

ReioNodeComponent em([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('em', v1, v2, v3, v4);

ReioNodeComponent embed([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('embed', v1, v2, v3, v4);

ReioNodeComponent fieldset([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('fieldset', v1, v2, v3, v4);

ReioNodeComponent figcaption(
        [dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('figcaption', v1, v2, v3, v4);

ReioNodeComponent figure([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('figure', v1, v2, v3, v4);

ReioNodeComponent footer([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('footer', v1, v2, v3, v4);

ReioNodeComponent form([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('form', v1, v2, v3, v4);

ReioNodeComponent h1([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('h1', v1, v2, v3, v4);

ReioNodeComponent h2([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('h2', v1, v2, v3, v4);

ReioNodeComponent h3([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('h3', v1, v2, v3, v4);

ReioNodeComponent h4([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('h4', v1, v2, v3, v4);

ReioNodeComponent h5([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('h5', v1, v2, v3, v4);

ReioNodeComponent h6([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('h6', v1, v2, v3, v4);

ReioNodeComponent head([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('head', v1, v2, v3, v4);

ReioNodeComponent header([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('header', v1, v2, v3, v4);

ReioNodeComponent hr([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('hr', v1, v2, v3, v4);

ReioNodeComponent i([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('i', v1, v2, v3, v4);

ReioNodeComponent iframe([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('iframe', v1, v2, v3, v4);

ReioNodeComponent img([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('img', v1, v2, v3, v4);

ReioNodeComponent input([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('input', v1, v2, v3, v4);

ReioNodeComponent ins([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('ins', v1, v2, v3, v4);

ReioNodeComponent kbd([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('kbd', v1, v2, v3, v4);

ReioNodeComponent label([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('label', v1, v2, v3, v4);

ReioNodeComponent legend([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('legend', v1, v2, v3, v4);

ReioNodeComponent li([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('li', v1, v2, v3, v4);

ReioNodeComponent link([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('link', v1, v2, v3, v4);

ReioNodeComponent main([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('main', v1, v2, v3, v4);

ReioNodeComponent map([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('map', v1, v2, v3, v4);

ReioNodeComponent mark([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('mark', v1, v2, v3, v4);

ReioNodeComponent meta([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('meta', v1, v2, v3, v4);

ReioNodeComponent meter([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('meter', v1, v2, v3, v4);

ReioNodeComponent nav([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('nav', v1, v2, v3, v4);

ReioNodeComponent noscript([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('noscript', v1, v2, v3, v4);

ReioNodeComponent object([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('object', v1, v2, v3, v4);

ReioNodeComponent ol([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('ol', v1, v2, v3, v4);

ReioNodeComponent optgroup([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('optgroup', v1, v2, v3, v4);

ReioNodeComponent option([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('option', v1, v2, v3, v4);

ReioNodeComponent output([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('output', v1, v2, v3, v4);

ReioNodeComponent p([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('p', v1, v2, v3, v4);

ReioNodeComponent param([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('param', v1, v2, v3, v4);

ReioNodeComponent picture([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('picture', v1, v2, v3, v4);

ReioNodeComponent pre([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('pre', v1, v2, v3, v4);

ReioNodeComponent progress([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('progress', v1, v2, v3, v4);

ReioNodeComponent q([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('q', v1, v2, v3, v4);

ReioNodeComponent ruby([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('ruby', v1, v2, v3, v4);

ReioNodeComponent rb([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('rb', v1, v2, v3, v4);

ReioNodeComponent rt([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('rt', v1, v2, v3, v4);

ReioNodeComponent rtc([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('rtc', v1, v2, v3, v4);

ReioNodeComponent rp([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('rp', v1, v2, v3, v4);

ReioNodeComponent s([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('s', v1, v2, v3, v4);

ReioNodeComponent samp([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('samp', v1, v2, v3, v4);

ReioNodeComponent script([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('script', v1, v2, v3, v4);

ReioNodeComponent section([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('section', v1, v2, v3, v4);

ReioNodeComponent select([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('select', v1, v2, v3, v4);

ReioNodeComponent small([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('small', v1, v2, v3, v4);

ReioNodeComponent source([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('source', v1, v2, v3, v4);

ReioNodeComponent span([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('span', v1, v2, v3, v4);

ReioNodeComponent strong([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('strong', v1, v2, v3, v4);

ReioNodeComponent style([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('style', v1, v2, v3, v4);

ReioNodeComponent sub([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('sub', v1, v2, v3, v4);

ReioNodeComponent summary([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('summary', v1, v2, v3, v4);

ReioNodeComponent sup([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('sup', v1, v2, v3, v4);

ReioNodeComponent table([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('table', v1, v2, v3, v4);

ReioNodeComponent tbody([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('tbody', v1, v2, v3, v4);

ReioNodeComponent td([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('td', v1, v2, v3, v4);

ReioNodeComponent template([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('template', v1, v2, v3, v4);

ReioNodeComponent textarea([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('textarea', v1, v2, v3, v4);

ReioNodeComponent tfoot([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('tfoot', v1, v2, v3, v4);

ReioNodeComponent th([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('th', v1, v2, v3, v4);

ReioNodeComponent thead([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('thead', v1, v2, v3, v4);

ReioNodeComponent time([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('time', v1, v2, v3, v4);

ReioNodeComponent title([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('title', v1, v2, v3, v4);

ReioNodeComponent tr([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('tr', v1, v2, v3, v4);

ReioNodeComponent track([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('track', v1, v2, v3, v4);

ReioNodeComponent u([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('u', v1, v2, v3, v4);

ReioNodeComponent ul([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('ul', v1, v2, v3, v4);

ReioNodeComponent var_([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('var', v1, v2, v3, v4);

ReioNodeComponent video([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('video', v1, v2, v3, v4);

ReioNodeComponent wbr([dynamic v1, dynamic v2, dynamic v3, dynamic v4]) =>
    v('wbr', v1, v2, v3, v4);

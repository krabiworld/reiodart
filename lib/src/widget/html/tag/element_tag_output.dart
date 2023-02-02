// Copyright (c) MineEjo.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import '../../../virtual_dom/virtual_node_attr.dart';
import '../html.dart';
import '../html_element.dart';
import '../html_element_visible.dart';

// Experimental, not standard or obsolete tags and attributes
// are not and will not be implemented. If you notice this,
// send it as a issue to https://github.com/MineEjo/reiodart/issues
// Adapted for HTML version 5.

ReioHtml _html = ReioHtml();

/// Contains [ReioElement] that contains a virtual_dom
/// with the `<output>` tag.
class Output extends ReioElementVisible {
  /// The `<output>` HTML element is a container
  /// element into which a site or app can inject
  /// the results of a calculation or the outcome
  /// of a user action.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/output)
  Output([super.value]) {
    setHtmlTag('output');
  }

  /// A list of other elements' ids,
  /// indicating that those elements contributed input
  /// values to (or otherwise affected) the calculation.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/output#attr-for)
  Output thisFor(List<String> idList, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('for', _html.listToSpaces(idList));
      node.attrs!.add(attr);
    }
    return this;
  }

  /// The `<form>` element to associate
  /// the output with (its form owner).
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/output#attr-form)
  Output form(String id, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('form', id);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// The element's name.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/output#attr-name)
  Output name(String name, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('name', name);
      node.attrs!.add(attr);
    }
    return this;
  }
}

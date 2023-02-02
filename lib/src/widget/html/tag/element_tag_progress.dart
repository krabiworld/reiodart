// Copyright (c) MineEjo.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import '../../../virtual_dom/virtual_node_attr.dart';
import '../html_element.dart';
import '../html_element_visible.dart';

// Experimental, not standard or obsolete tags and attributes
// are not and will not be implemented. If you notice this,
// send it as a issue to https://github.com/MineEjo/reiodart/issues
// Adapted for HTML version 5.

/// Contains [ReioElement] that contains a virtual_dom
/// with the `<progress>` tag.
class Progress extends ReioElementVisible {
  /// The `<progress>` HTML element displays an indicator
  /// showing the completion progress of a task,
  /// typically displayed as a progress bar.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/progress)
  Progress([super.value]) {
    setHtmlTag('progress');
  }

  /// This attribute describes how much work
  /// the task indicated by the progress element requires.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/progress#attr-max)
  Progress max(num number, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('max', number.toString());
      node.attrs!.add(attr);
    }
    return this;
  }

  /// This attribute specifies how much
  /// of the task that has been completed.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/progress#attr-value)
  Progress value(num number, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('value', number.toString());
      node.attrs!.add(attr);
    }
    return this;
  }
}

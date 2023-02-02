// Copyright (c) MineEjo.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import 'dart:html';

import 'html_element.dart';

// Experimental, not standard or obsolete tags and attributes
// are not and will not be implemented. If you notice this,
// send it as a issue to https://github.com/MineEjo/reiodart/issues
// Adapted for HTML version 5.

/// Contains an element visible on the page
/// and with possible interaction.
/// For example: text, button.
abstract class ReioElementVisible extends ReioElement {
  /// Created based on [ReioElement],
  /// it is used for elements visible on
  /// the page and contains the corresponding methods.
  /// Visible elements: all HTML elements, EXCEPT:
  /// `<base>`, `<bdo>`, `<br>`, `<head>`, `<html>`,
  /// `<iframe>`, `<meta>`, `<param>`,
  /// `<script>`, `<style>`, and `<title>`.
  ReioElementVisible([super.value]);

  /// The touchcancel event is fired when one
  /// or more touch points have been disrupted
  /// in an implementation-specific manner
  /// (for example, too many touch points are created).
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/Element/touchcancel_event)
  ReioElementVisible onTouchCancel(Function(Element, Event)? fun) {
    if (fun != null) on.call('touchcancel', fun);
    return this;
  }

  /// The touchend event fires when one
  /// or more touch points are removed from the touch surface.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/Element/touchend_event)
  ReioElementVisible onTouchEnd(Function(Element, Event)? fun) {
    if (fun != null) on.call('touchend', fun);
    return this;
  }

  /// The touchmove event is fired when one
  /// or more touch points are moved along the touch surface.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/Element/touchmove_event)
  ReioElementVisible onTouchMove(Function(Element, Event)? fun) {
    if (fun != null) on.call('touchmove', fun);
    return this;
  }

  /// The touchstart event is fired when one
  /// or more touch points are placed on the touch surface.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/Element/touchstart_event)
  ReioElementVisible onTouchStart(Function(Element, Event)? fun) {
    if (fun != null) on.call('touchstart', fun);
    return this;
  }

  /// The transitionend event is fired
  /// when a CSS transition has completed.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/Element/transitionend_event)
  ReioElementVisible onTransitionEnd(Function(Element, Event)? fun) {
    if (fun != null) on.call('transitionend', fun);
    return this;
  }

  /// The wheel event fires when the user rotates
  /// a wheel button on a pointing
  /// device (typically a mouse).
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/Element/wheel_event)
  ReioElementVisible onWheel(Function(Element, Event)? fun) {
    if (fun != null) on.call('wheel', fun);
    return this;
  }

  /// The paste event is fired when the user
  /// has initiated a "paste" action through
  /// the browser's user interface.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/Element/paste_event)
  ReioElementVisible onBeforePaste(Function(Element, Event)? fun) {
    if (fun != null) on.call('beforepaste', fun);
    return this;
  }

  /// The paste event is fired when the user
  /// has initiated a "paste" action through
  /// the browser's user interface.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/Element/paste_event)
  ReioElementVisible onPaste(Function(Element, Event)? fun) {
    if (fun != null) on.call('paste', fun);
    return this;
  }

  /// The drop event is fired when an element
  /// or text selection is dropped
  /// on a valid drop target.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/drop_event)
  ReioElementVisible onDrop(Function(Element, Event)? fun) {
    if (fun != null) on.call('drop', fun);
    return this;
  }

  /// The dragover event is fired when an element
  /// or text selection is being dragged over
  /// a valid drop target (every few hundred milliseconds).
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/dragstart_event)
  ReioElementVisible onDragStart(Function(Element, Event)? fun) {
    if (fun != null) on.call('dragstart', fun);
    return this;
  }

  /// The dragover event is fired when an element
  /// or text selection is being dragged over
  /// a valid drop target (every few hundred milliseconds).
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/dragover_event)
  ReioElementVisible onDragOver(Function(Element, Event)? fun) {
    if (fun != null) on.call('dragover', fun);
    return this;
  }

  /// The dragleave event is fired when
  /// a dragged element or text selection
  /// leaves a valid drop target.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/dragleave_event)
  ReioElementVisible onDragLeave(Function(Element, Event)? fun) {
    if (fun != null) on.call('dragleave', fun);
    return this;
  }

  /// The dragend event is fired when a drag
  /// operation is being ended (by releasing
  /// a mouse button or hitting the escape key).
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/dragenter_event)
  ReioElementVisible onDragEnter(Function(Element, Event)? fun) {
    if (fun != null) on.call('dragenter', fun);
    return this;
  }

  /// The dragend event is fired when a drag
  /// operation is being ended (by releasing
  /// a mouse button or hitting the escape key).
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/dragend_event)
  ReioElementVisible onDragEnd(Function(Element, Event)? fun) {
    if (fun != null) on.call('dragend', fun);
    return this;
  }

  /// The drag event is fired every few
  /// hundred milliseconds as an element
  /// or text selection is being dragged by the user.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/drag_event)
  ReioElementVisible onDrag(Function(Element, Event)? fun) {
    if (fun != null) on.call('drag', fun);
    return this;
  }

  /// The cut event fires when the user
  /// initiates a cut action through
  /// the browser's user interface.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/cut_event)
  ReioElementVisible onBeforeCut(Function(Element, Event)? fun) {
    if (fun != null) on.call('beforecut', fun);
    return this;
  }

  /// The cut event fires when the user
  /// initiates a cut action through
  /// the browser's user interface.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/cut_event)
  ReioElementVisible onCut(Function(Element, Event)? fun) {
    if (fun != null) on.call('cut', fun);
    return this;
  }

  /// The copy event fires when the user initiates
  /// a copy action through the browser's user interface.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/copy_event)
  ReioElementVisible onBeforeCopy(Function(Element, Event)? fun) {
    if (fun != null) on.call('beforecopy', fun);
    return this;
  }

  /// The copy event fires when the user initiates
  /// a copy action through the browser's user interface.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/copy_event)
  ReioElementVisible onCopy(Function(Element, Event)? fun) {
    if (fun != null) on.call('copy', fun);
    return this;
  }

  /// The contextmenu event fires when
  /// the user attempts to open a context menu.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/Element/contextmenu_event)
  ReioElementVisible onContextMenu(Function(Element, Event)? fun) {
    if (fun != null) on.call('contextmenu', fun);
    return this;
  }

  /// The mouseleave event is fired at an [Element]
  /// when the cursor of a pointing device
  /// (usually a mouse) is moved out of it.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/Element/mouseleave_event)
  ReioElementVisible onMouseLeave(Function(Element, Event)? fun) {
    if (fun != null) on.call('mouseleave', fun);
    return this;
  }

  /// The mouseenter event is fired at an [Element]
  /// when a pointing device (usually a mouse)
  /// is initially moved so that its hotspot
  /// is within the element at which the event was fired.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/Element/mouseenter_event)
  ReioElementVisible onMouseEnter(Function(Element, Event)? fun) {
    if (fun != null) on.call('mouseenter', fun);
    return this;
  }

  /// The mouseup event is fired at an [Element]
  /// when a button on a pointing device
  /// (such as a mouse or trackpad) is released
  /// while the pointer is located inside it.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/Element/mouseup_event)
  ReioElementVisible onMouseUp(Function(Element, Event)? fun) {
    if (fun != null) on.call('mouseup', fun);
    return this;
  }

  /// The mouseover event is fired at an [Element]
  /// when a pointing device (such as a mouse
  /// or trackpad) is used to move the cursor
  /// onto the element or one of its child elements.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/Element/mouseover_event)
  ReioElementVisible onMouseOver(Function(Element, Event)? fun) {
    if (fun != null) on.call('mouseover', fun);
    return this;
  }

  /// The mouseout event is fired at an [Element]
  /// when a pointing device (usually a mouse) is
  /// used to move the cursor so that it is no longer
  /// contained within the element or one of its children.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/Element/mouseout_event)
  ReioElementVisible onMouseOut(Function(Element, Event)? fun) {
    if (fun != null) on.call('mouseout', fun);
    return this;
  }

  /// The mousemove event is fired at an element
  /// when a pointing device (usually a mouse)
  /// is moved while the cursor's hotspot is inside it.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/Element/mousemove_event)
  ReioElementVisible onMouseMove(Function(Element, Event)? fun) {
    if (fun != null) on.call('mousemove', fun);
    return this;
  }

  /// The mousedown event is fired at an [Element]
  /// when a pointing device button is pressed
  /// while the pointer is inside the element.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/Element/mousedown_event)
  ReioElementVisible onMouseDown(Function(Element, Event)? fun) {
    if (fun != null) on.call('mousedown', fun);
    return this;
  }

  /// The keyup event is fired when a key is released.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/Element/keyup_event)
  ReioElementVisible onKeyUp(Function(Element, Event)? fun) {
    if (fun != null) on.call('keyup', fun);
    return this;
  }

  /// The keydown event is fired when a key is pressed.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/Element/keydown_event)
  ReioElementVisible onKeyDown(Function(Element, Event)? fun) {
    if (fun != null) on.call('keydown', fun);
    return this;
  }

  /// The focus event fires when an element
  /// has received focus. The event does not bubble,
  /// but the related focusin event that follows does bubble.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/Element/focus_event)
  ReioElementVisible onFocus(Function(Element, Event)? fun) {
    if (fun != null) on.call('focus', fun);
    return this;
  }

  /// The dblclick event fires when a pointing
  /// device button (such as a mouse's primary button)
  /// is double-clicked; that is, when it's rapidly
  /// clicked twice on a single element
  /// within a very short span of time.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/Element/dblclick_event)
  ReioElementVisible onDoubleClick(Function(Element, Event)? fun) {
    if (fun != null) on.call('dblclick', fun);
    return this;
  }

  /// An element receives a click event when
  /// a pointing device button (such as a mouse's
  /// primary mouse button) is both pressed
  /// and released while the pointer
  /// is located inside the element.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/Element/click_event)
  ReioElementVisible onClick(Function(Element, Event)? fun) {
    if (fun != null) on.call('click', fun);
    return this;
  }

  /// The blur event fires when an element has lost focus.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/Element/blur_event)
  ReioElementVisible onBlur(Function(Element, Event)? fun) {
    if (fun != null) on.call('blur', fun);
    return this;
  }
}

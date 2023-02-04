// Copyright (c) MineEjo.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import 'dart:html';

import '../../../virtual_dom/virtual_attr.dart';
import '../html_element.dart';
import '../html_element_visible.dart';

// Experimental, not standard or obsolete tags and attributes
// are not and will not be implemented. If you notice this,
// send it as a issue to https://github.com/MineEjo/reiodart/issues
// Adapted for HTML version 5.

/// Contains [WidgetElement] that contains a virtual_dom
/// with the `<track>` tag.
class Track extends WidgetElementVisible {
  /// The `<track>` HTML element is used
  /// as a child of the media elements, `<audio>` and `<video>`.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/track)
  Track([super.value]) {
    tag = 'track';
  }

  /// The cuechange event fires when a TextTrack
  /// has changed the currently displaying cues.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/TextTrack/cuechange_event)
  Track onCueChange(Function(Element, Event)? fun) {
    if (fun != null) on.call('cuechange', fun);
    return this;
  }

  /// This attribute indicates that the track
  /// should be enabled unless the user's preferences
  /// indicate that another track is more appropriate.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/track#attr-default)
  Track thisDefault(bool boolean) {
    if (boolean && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('default', '');
      node.attrs!.add(attr);
    }
    return this;
  }

  /// How the text track is meant to be used.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/track#attr-kind)
  Track kind(String keyword, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('kind', keyword);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// A user-readable title of the text track
  /// which is used by the browser
  /// when listing available text tracks.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/track#attr-label)
  Track label(String text, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('label', text);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// Address of the track (.vtt file).
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/track#attr-src)
  Track src(String url, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('src', url);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// Language of the track text data.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/track#attr-srclang)
  Track srcLang(String langCode, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      VirtualAttr attr = VirtualAttr('srclang', langCode);
      node.attrs!.add(attr);
    }
    return this;
  }
}

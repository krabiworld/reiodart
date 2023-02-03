// Copyright (c) MineEjo.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import 'dart:html';

import '../../../virtual_dom/virtual_node_attr.dart';
import '../html_element.dart';
import '../html_element_visible.dart';

// Experimental, not standard or obsolete tags and attributes
// are not and will not be implemented. If you notice this,
// send it as a issue to https://github.com/MineEjo/reiodart/issues
// Adapted for HTML version 5.

/// Contains [ReioElement] that contains a virtual_dom
/// with the `<video>` tag.
class Video extends ReioElementVisible {
  /// The `<video>` HTML element embeds a media player
  /// which supports video playback into the document.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/video)
  Video([super.value]) {
    tag = 'video';
  }

  /// The waiting event is fired when playback
  /// has stopped because of a temporary lack of data.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/HTMLMediaElement/waiting_event)
  Video onWaiting(Function(Element, Event)? fun) {
    if (fun != null) on.call('waiting', fun);
    return this;
  }

  /// The volumechange event is fired
  /// when the volume has changed.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/HTMLMediaElement/volumechange_event)
  Video onVolumeChange(Function(Element, Event)? fun) {
    if (fun != null) on.call('volumechange', fun);
    return this;
  }

  /// The timeupdate event is fired when the time
  /// indicated by the currentTime attribute has been updated.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/HTMLMediaElement/timeupdate_event)
  Video onTimeUpdate(Function(Element, Event)? fun) {
    if (fun != null) on.call('timeupdate', fun);
    return this;
  }

  /// The suspend event is fired when media
  /// data loading has been suspended.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/HTMLMediaElement/suspend_event)
  Video onSuspend(Function(Element, Event)? fun) {
    if (fun != null) on.call('suspend', fun);
    return this;
  }

  /// The stalled event is fired when the user agent
  /// is trying to fetch media data,
  /// but data is unexpectedly not forthcoming.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/HTMLMediaElement/stalled_event)
  Video onStalled(Function(Element, Event)? fun) {
    if (fun != null) on.call('stalled', fun);
    return this;
  }

  /// The seeking event is fired when a seek operation
  /// starts, meaning the Boolean seeking attribute
  /// has changed to true and the media
  /// is seeking a new position.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/HTMLMediaElement/seeking_event)
  Video onSeeking(Function(Element, Event)? fun) {
    if (fun != null) on.call('seeking', fun);
    return this;
  }

  /// The seeked event is fired when a seek
  /// operation completed, the current
  /// playback position has changed.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/HTMLMediaElement/seeked_event)
  Video onSeeked(Function(Element, Event)? fun) {
    if (fun != null) on.call('seeked', fun);
    return this;
  }

  /// The ratechange event is fired when
  /// the playback rate has changed.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/HTMLMediaElement/ratechange_event)
  Video onRateChange(Function(Element, Event)? fun) {
    if (fun != null) on.call('ratechange', fun);
    return this;
  }

  /// The progress event is fired periodically
  /// as the browser loads a resource.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/HTMLMediaElement/progress_event)
  Video onProgress(Function(Element, Event)? fun) {
    if (fun != null) on.call('progress', fun);
    return this;
  }

  /// The playing event is fired after playback
  /// is first started, and whenever it is restarted.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/HTMLMediaElement/playing_event)
  Video onPlaying(Function(Element, Event)? fun) {
    if (fun != null) on.call('playing', fun);
    return this;
  }

  /// The play event is fired when the paused
  /// property is changed from true to false,
  /// as a result of the play method,
  /// or the autoplay attribute.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/HTMLMediaElement/play_event)
  Video onPlay(Function(Element, Event)? fun) {
    if (fun != null) on.call('play', fun);
    return this;
  }

  /// The pause event is sent when a request
  /// to pause an activity is handled and the activity
  /// has entered its paused state, most commonly
  /// after the media has been paused through
  /// a call to the element's pause() method.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/HTMLMediaElement/pause_event)
  Video onPause(Function(Element, Event)? fun) {
    if (fun != null) on.call('pause', fun);
    return this;
  }

  /// The loadstart event is fired when
  /// the browser has started to load a resource.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/HTMLMediaElement/loadstart_event)
  Video onLoadStart(Function(Element, Event)? fun) {
    if (fun != null) on.call('loadstart', fun);
    return this;
  }

  /// The loadeddata event is fired when the frame
  /// at the current playback position of the media
  /// has finished loading; often the first frame.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/HTMLMediaElement/loadeddata_event)
  Video onLoadedData(Function(Element, Event)? fun) {
    if (fun != null) on.call('loadeddata', fun);
    return this;
  }

  /// The loadedmetadata event is fired
  /// when the metadata has been loaded.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/HTMLMediaElement/loadedmetadata_event)
  Video onLoadedMetadata(Function(Element, Event)? fun) {
    if (fun != null) on.call('loadedmetadata', fun);
    return this;
  }

  /// The error event is fired on an Element
  /// object when a resource failed to load,
  /// or can't be used.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/Element/error_event)
  Video onError(Function(Element, Event)? fun) {
    if (fun != null) on.call('error', fun);
    return this;
  }

  /// The ended event is fired when playback
  /// or streaming has stopped because the end
  /// of the media was reached
  /// or because no further data is available.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/HTMLMediaElement/ended_event)
  Video onEnded(Function(Element, Event)? fun) {
    if (fun != null) on.call('ended', fun);
    return this;
  }

  /// The emptied event is fired when the media has
  /// become empty; for example, this event is sent
  /// if the media has already been loaded
  /// (or partially loaded), and the load()
  /// method is called to reload it.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/HTMLMediaElement/emptied_event)
  Video onEmptied(Function(Element, Event)? fun) {
    if (fun != null) on.call('emptied', fun);
    return this;
  }

  /// The durationchange event is fired
  /// when the duration attribute has been updated.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/HTMLMediaElement/canplaythrough_event)
  Video onDurationChange(Function(Element, Event)? fun) {
    if (fun != null) on.call('durationchange', fun);
    return this;
  }

  /// The canplaythrough event is fired when the user
  /// agent can play the media, and estimates
  /// that enough data has been loaded to play
  /// the media up to its end without having
  /// to stop for further buffering of content.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/HTMLMediaElement/canplaythrough_event)
  Video onCanPlayThrough(Function(Element, Event)? fun) {
    if (fun != null) on.call('canplaythrough', fun);
    return this;
  }

  /// The canplay event is fired when the user agent
  /// can play the media, but estimates that
  /// not enough data has been loaded to play
  /// the media up to its end without having
  /// to stop for further buffering of content.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/HTMLMediaElement/canplay_event)
  Video onCanPlay(Function(Element, Event)? fun) {
    if (fun != null) on.call('canplay', fun);
    return this;
  }

  /// The abort event is fired when the resource
  /// was not fully loaded,
  /// but not as the result of an error.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/HTMLMediaElement/abort_event)
  Video onAbort(Function(Element, Event)? fun) {
    if (fun != null) on.call('abort', fun);
    return this;
  }

  /// if specified, the video automatically begins
  /// to play back as soon as it can
  /// do so without stopping to finish loading the data.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/video#attr-autoplay)
  Video autoPlay(bool boolean) {
    if (boolean && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('autoplay', '');
      node.attrs!.add(attr);
    }
    return this;
  }

  /// If this attribute is present, the browser will offer
  /// controls to allow the user to control video playback,
  /// including volume, seeking, and pause/resume playback.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/video#attr-controls)
  Video controls(bool boolean) {
    if (boolean && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('controls', '');
      node.attrs!.add(attr);
    }
    return this;
  }

  /// This attribute indicates whether
  /// to use CORS to fetch the related video.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/video#attr-crossorigin)
  Video crossOrigin(String mode, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('crossorigin', mode);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// The height of the video's display area, in CSS pixels.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/video#attr-height)
  Video height(int pixels, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('height', pixels.toString());
      node.attrs!.add(attr);
    }
    return this;
  }

  /// If specified, the audio player will automatically
  /// seek back to the start upon reaching the end of the video.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/video#attr-loop)
  Video loop(bool boolean) {
    if (boolean && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('loop', '');
      node.attrs!.add(attr);
    }
    return this;
  }

  /// A Boolean attribute that indicates
  /// the default setting of the audio contained in the video.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/video#attr-muted)
  Video muted(bool boolean) {
    if (boolean && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('muted', '');
      node.attrs!.add(attr);
    }
    return this;
  }

  /// A attribute indicating that the video
  /// is to be played "inline",
  /// that is within the element's playback area.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/video#attr-playsinline)
  Video playsInline(bool boolean) {
    if (boolean && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('playsinline', '');
      node.attrs!.add(attr);
    }
    return this;
  }

  /// A URL for an image to be shown
  /// while the video is downloading.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/video#attr-poster)
  Video poster(String url, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('poster', url);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// This attribute is intended to provide
  /// a hint to the browser about what the author
  /// thinks will lead to the best user experience
  /// regarding what content is loaded before the video is played
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/video#attr-preload)
  Video preload(String value, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('preload', value);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// The URL of the video to embed.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/video#attr-src)
  Video src(String url, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('src', url);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// The width of the video's display area, in CSS pixels.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/video#attr-width)
  Video width(int pixels, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('width', pixels.toString());
      node.attrs!.add(attr);
    }
    return this;
  }
}

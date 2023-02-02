// Copyright (c) MineEjo.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import 'dart:html';

import '../../../virtual_dom/virtual_node_attr.dart';
import '../html.dart';
import '../html_element.dart';

// Experimental, not standard or obsolete tags and attributes
// are not and will not be implemented. If you notice this,
// send it as a issue to https://github.com/MineEjo/reiodart/issues
// Adapted for HTML version 5.

ReioHtml _html = ReioHtml();

/// Contains [ReioElement] that contains a virtual_dom
/// with the `<script>` tag.
class Script extends ReioElement {
  /// The `<script>` HTML element is used
  /// to embed executable code or data; this
  /// is typically used to embed or refer to JavaScript code.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/script)
  Script([super.value]) {
    setHtmlTag('script');
  }

  /// The load event is fired when the whole
  /// page has loaded, including all dependent
  /// resources such as stylesheets, scripts,
  /// iframes, and images.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/Window/load_event)
  Script onLoad(Function(Element, Event)? fun) {
    if (fun != null) on.call('load', fun);
    return this;
  }

  /// The error event is fired on an Element
  /// object when a resource failed to load,
  /// or can't be used.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/Element/error_event)
  Script onError(Function(Element, Event)? fun) {
    if (fun != null) on.call('error', fun);
    return this;
  }

  /// If the async attribute is present,
  /// then the classic script will be fetched in parallel
  /// to parsing and evaluated as soon as it is available.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/script#attr-async)
  Script async(bool boolean) {
    if (boolean && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('async', '');
      node.attrs!.add(attr);
    }
    return this;
  }

  /// Normal script elements pass minimal information
  /// to the window.onerror for scripts which do not pass
  /// the standard CORS checks.  To allow error logging
  /// for sites which use a separate domain
  /// for static media, use this attribute.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/script#attr-crossorigin)
  Script crossOrigin(String mode, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('crossorigin', mode);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// This attribute is set to indicate
  /// to a browser that the script is meant to be executed
  /// after the document has been parsed,
  /// but before firing DOMContentLoaded.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/script#attr-defer)
  Script defer(bool boolean) {
    if (boolean && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('defer', '');
      node.attrs!.add(attr);
    }
    return this;
  }

  /// This attribute contains inline metadata
  /// that a user agent can use to verify
  /// that a fetched resource has been delivered
  /// free of unexpected manipulation.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/script#attr-integrity)
  Script integrity(String metaData, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('integrity', metaData);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// This attribute is set to indicate that the script
  /// should not be executed in browsers
  /// that support ES modules — in effect,
  /// this can be used to serve fallback scripts
  /// to older browsers that do not support
  /// modular JavaScript code.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/script#attr-nomodule)
  Script noModule(bool boolean) {
    if (boolean && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('nomodule', '');
      node.attrs!.add(attr);
    }
    return this;
  }

  /// Indicates which referrer
  /// to send when fetching the script,
  /// or resources fetched by the script.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/script#attr-referrerpolicy)
  Script referrerPolicy(String referrer, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('referrerpolicy', referrer);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// This attribute specifies the URI of an external script;
  /// this can be used as an alternative
  /// to embedding a script directly within a document.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/script#attr-src)
  Script src(String url, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('src', url);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// This attribute indicates the type of script represented.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/script/type)
  Script type(String scriptType, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('type', scriptType);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// This attribute explicitly indicates
  /// that certain operations should be blocked
  /// on the fetching of the script.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/script#attr-blocking)
  Script blocking(List<String> operationList, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr =
          ReioNodeAttr('blocking', _html.listToCommas(operationList));
      node.attrs!.add(attr);
    }
    return this;
  }
}

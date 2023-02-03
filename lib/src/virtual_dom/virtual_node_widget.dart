// Copyright (c) MineEjo.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import 'dart:html';

import 'virtual_node.dart';

class ReioNodeWidget extends ReioNode {
  // Events that will be triggered after
  // the corresponding name has been activated.
  Function(Element)? onMount;
  Function()? onDestroy;
  Function()? onRemove;
  Function(Element)? onAdd;

  bool isMount = false;
  bool? isAdd;
  bool? isRemove;
  bool? isDestroy;

  //  HTML CSS styles: `<style>...<style>`.
  String? styles;

  /// Creates a node for the widget
  /// with its main functionality.
  ReioNodeWidget(
      {required super.tag,
      required super.value,
      super.attrs,
      super.children,
      this.onRemove,
      this.onAdd,
      this.onMount,
      this.onDestroy});

  /// Removes element from DOM, works only with HTML element,
  /// so easier to destroy.
  void remove() {
    if (element == null) return;

    // Removing an HTML element.
    element!.remove();

    // Event Calling.
    onRemove?.call();

    isAdd = false;
    isRemove = true;
  }

  /// Inserts element into parent,
  /// works only with HTML element,
  /// so easier to mount.
  void add(Element parent, int number) {
    if (element == null) return;

    if (parent.childNodes.length == number) {
      // If the number of elements equals the position,
      // then the element can be inserted
      // at the end of the array.
      parent.append(element!);
    } else {
      // Otherwise, it will be inserted
      // in the same position it was in before.
      parent.insertBefore(element!, parent.children[number]);
    }

    // Event Calling.
    onAdd?.call(element!);

    isAdd = false;
    isRemove = false;
  }

  @override
  void destroy() {
    // Removing an HTML element.
    element?.remove();
    element = null;

    // Event Calling.
    onDestroy?.call();

    isMount = false;
    isDestroy = true;
  }

  /// Initializes a [ReioNodeWidget] in the HTML DOM.
  /// Takes an [htmlNode] to insert into an element
  /// and [replace] to denote insertion
  /// in place of that element.
  @override
  void init([Node? htmlNode, bool? replace]) {
    // Saves the initial value.
    saveValue(value);

    final Element newElement = document.createElement(tag);
    ReioNodeWidgetController(this)
      // Ready-made code that can help at any time.
      // ..initData(newElement)
      ..initValue(newElement)
      ..initAttrs(newElement)
      ..initStyles(newElement)
      ..initChildren(newElement);
    element = newElement;

    // Mounting an element at once.
    if (htmlNode != null) {
      if (replace == true) {
        htmlNode.replaceWith(newElement);
      } else {
        htmlNode.append(newElement);
      }
    }

    // Event Calling.
    onMount?.call(element!);

    isMount = true;
    isDestroy = false;
  }

  /// Replaces the values of the old [ReioNodeWidget]
  /// with those of the new [ReioNodeWidget].
  @override
  void updateTo(ReioNode newNode) {
    newNode as ReioNodeWidget;

    // With different tags, recreates
    // a ReioNodeWidget in the same parent.
    if (tag != newNode.tag) {
      newNode.init(element?.parentNode);
      // This ReioNodeWidget is destroyed because
      // a new ReioNodeWidget has been created.
      destroy();
    } else {
      saveValue(newNode.value);

      // ReioNodeWidget does not have its own
      // element in the DOM at this stage,
      // but it must keep the data of the previous one.
      newNode.element = element;
      newNode.number = number;

      ReioNodeWidgetController(this, newNode)
        ..initValue()
        ..initAttrs()
        ..initStyles()
        ..initChildren();
    }
  }
}

class ReioNodeWidgetController extends ReioNodeController {
  ReioNodeWidgetController(super.node, [super.newNode]);

  /// Initializing a CSS block in a virtual virtual_dom.
  void initStyles([Element? element]) {
    ReioNodeWidget cNode = node as ReioNodeWidget;

    void init(Element? newNode) {
      const String attrStyleWidget = 'reio-widget-style';
      const String attrStyleType = 'reio-style-type';

      // The public class is not required because
      // styles are public in the first place.
      const String pvStyleClass = 'reio-private-style';
      const String ptStyleClass = 'reio-protected-style';

      const String pvType = 'private';
      const String ptType = 'protected';
      const String pbType = 'public';

      const String pvKey = '{private}:';
      const String ptKey = '{protected}:';
      const String pbKey = '{public}:';

      final RegExp pvRegExp = RegExp(r'(\(.*\s*)?{private}:?.*{[\s\S]*?}');
      final RegExp ptRegExp = RegExp(r'(\(.*\s*)?{protected}:?.*{[\s\S]*?}');
      final RegExp pbRegExp = RegExp(r'(\(.*\s*)?{public}:?.*{[\s\S]*?}');
      final RegExp ruleRegExp = RegExp(r'^\(');

      final RegExp minifyRegExp = RegExp(r'[\s\n\r]{2,}|/\*[\s\S]*?\*/');

      void initModifier(String type, RegExp regExp, String modifier,
          [String? mClass]) {
        final query = 'style[$attrStyleWidget="${cNode.number}"]'
            '[$attrStyleType="$type"]';

        void addClass(String styleClass) {
          if (mClass != null && newNode?.classes.contains(styleClass) == true) {
            newNode?.classes.add(styleClass);
          }
        }

        List<String>? oldStyles = [];
        List<Element>? oldStylesTags = cNode.element?.querySelectorAll(query);
        cNode.element?.querySelectorAll(query).forEach((el) {
          return oldStyles.add(el.text as String);
        });

        String styleClass = (mClass != null) ? '$mClass-${cNode.number}' : '';

        // The old virtual_dom must have at least an empty string instead of null,
        // so that the new one can add new styles.
        if (cNode.styles == null) return;

        List<RegExpMatch> modifiers = regExp.allMatches(cNode.styles!).toList();
        for (RegExpMatch match in modifiers) {
          String? style = match.group(0);
          if (style == null) continue;

          // The modifier class is set instead of the key.
          if (mClass != null) {
            style = style.replaceFirst(modifier, '.$styleClass');
          } else {
            // If there is no class, there shouldn't be a key in the styles.
            style = style.replaceFirst(modifier, '');
          }

          // Formatting and minifying style.
          style = style.trim();
          style = style.replaceAllMapped(minifyRegExp, (match) => '');

          // Removes the bracket for rules at the beginning of the style.
          style = style.replaceAllMapped(ruleRegExp, (match) => '');

          // If the style is in the old ones,
          // it means that it is already in use.
          if (oldStyles.contains(style)) {
            oldStyles.remove(style);

            // If the used style had a class,
            // it is important to keep it in the new virtual_dom.
            addClass(styleClass);

            continue;
          }

          Element styleTag = StyleElement();
          styleTag.setAttribute(attrStyleWidget, cNode.number);
          styleTag.setAttribute(attrStyleType, type);
          styleTag.text = style;
          addClass(styleClass);

          if (newNode != null) {
            newNode.append(styleTag);
          } else {
            cNode.element?.append(styleTag);
          }
        }

        // Removes unused styles.
        oldStylesTags?.forEach((el) {
          if (oldStyles.contains(el.text)) el.remove();
        });
      }

      // Initialization of the private modifier.
      initModifier(pvType, pvRegExp, pvKey, pvStyleClass);
      // Initialization of the protected modifier.
      initModifier(ptType, ptRegExp, ptKey, ptStyleClass);
      // Initialization of the public modifier.
      initModifier(pbType, pbRegExp, pbKey);
    }

    if (isUpdate) {
      ReioNodeWidget newNode = minorNode as ReioNodeWidget;
      // No element = no attributes in the element.
      if (newNode.element == null || newNode.styles == null) return;
      if (cNode.styles == newNode.styles) return;

      init(minorNode?.element);
    } else if (element != null) {
      init(element);
    }
  }
}

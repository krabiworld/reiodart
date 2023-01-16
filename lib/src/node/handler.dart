import 'dart:html';
import 'dart:math';

import '../tools.dart';

const String reioComponent = 'reio-component';

/// Stores the attribute name and value from HTML.
class ReioNodeAttr {
  String name;
  String value;

  ReioNodeAttr(this.name, this.value);
}

int totalGenerated = 0;
String getComponentNumber() {
  totalGenerated++;
  return totalGenerated.toString();
}

/// The virtual node used in the virtual DOM
/// tries to be similar to the HTML.
abstract class ReioNode {
  String tag;
  String value;
  List<ReioNodeAttr>? attrs;
  List<ReioNode>? children;

  // Used as an identifier for a component.
  String number = getComponentNumber();

  // Stores all unique values of a component,
  // for checking them in the future.
  // For example, to see if the new value was the original value.
  List<String> values = [];
  bool isNewValue(String value) => (values.length > 1 && values[0] != value);
  bool isOldValue(String value) => (values.length == 1 && values[0] == value);

  // Stores the element from the DOM,
  // to change the HTML, because Reio uses virtual.
  Element? element;

  ReioNode({required this.tag, required this.value, this.attrs, this.children});

  void destroy();

  void init([Node? htmlNode]);

  void replace(ReioNode newNode);

  void saveValue(dynamic value) {
    // Saves the original values, if there are more than 1,
    // for checking them in the future.
    // For example, to see if the new value was the original value.
    if (!values.contains(value)) {
      values.add(value);
      // if there are more than 1, it reverses the list and
      // trims the rest, leaving the standard and new values.
      if (values.length > 1) values = values.reversed.toList().sublist(0, 2);
    }
  }
}

/// Initializes or overwrites a [ReioNode].
class ReioNodeController {
  final ReioNode node;
  ReioNode? minorNode;
  ReioTools tools = ReioTools();

  bool isReplacement = false;

  ReioNodeController(this.node, [this.minorNode]) {
    // The new node, must update the old one, so the replacement is true.
    if (minorNode != null) isReplacement = true;
  }

  void initData([Element? element]) {
    // No element = no data in the element.
    if (element == null) return;
    element.setAttribute(reioComponent, node.number);
  }

  void initValue([Element? element]) {
    if (isReplacement) {
      ReioNode newNode = minorNode as ReioNode;

      // No element = no value in the element.
      if (newNode.element == null ||
          newNode.value == node.value && node.isOldValue(newNode.value)) return;

      newNode.element?.innerHtml = newNode.value;
    } else {
      // No element = no value in the element.
      if (element == null || node.value.isEmpty) return;
      element.innerHtml = node.value;
    }
  }

  void initAttrs([Element? element]) {
    final List<String> ignore = [reioComponent];

    if (isReplacement) {
      // No element = no attributes in the element.
      if (minorNode?.element == null || minorNode?.attrs == null) return;
      ReioNode newNode = minorNode as ReioNode;
      Element newElement = minorNode!.element as Element;

      if (tools.compareMapOfList(
          node.attrs, newNode.attrs, (m) => m.name + m.value)) {
        return;
      }

      // Cleaning old attributes.
      List<String> keys = node.element!.attributes.keys.toList();
      List<String> newKeys = [];
      newNode.attrs?.toSet().forEach((attr) => newKeys.add(attr.name));
      for (var key in keys) {
        if (ignore.contains(key) || newKeys.contains(key)) continue;
        newElement.removeAttribute(key);
      }

      // Inserts new attributes.
      List<ReioNodeAttr> attrs = newNode.attrs as List<ReioNodeAttr>;
      for (ReioNodeAttr attr in attrs) {
        newElement.setAttribute(attr.name, attr.value);
      }
    } else {
      // No element = no attributes in the element.
      if (element == null || node.attrs == null) return;
      List<ReioNodeAttr> attrs = node.attrs as List<ReioNodeAttr>;

      for (ReioNodeAttr attr in attrs) {
        element.setAttribute(attr.name, attr.value);
      }
    }
  }

  void initChildren([Element? element]) {
    if (isReplacement) {
      if (minorNode?.element == null || minorNode?.children == null) return;
      List<ReioNode> newChildren = minorNode!.children as List<ReioNode>;

      if (node.children != null) {
        List<ReioNode> children = node.children as List<ReioNode>;

        // A loop that compares the children of
        // the current node with the children of the new node.
        for (int i = 0; i < min(children.length, newChildren.length); i++) {
          children[i].replace(newChildren[i]);
        }

        // If the new node has fewer children than
        // the current one, the excess children are removed.
        if (children.length > newChildren.length) {
          children.sublist(newChildren.length).forEach((child) {
            return child.destroy();
          });
        }
      }

      // If the new node has more children than
      // the current one, the children are added.
      int length = (node.children?.length != null) ? node.children!.length : 0;
      if (newChildren.length > length) {
        newChildren.sublist(length).forEach((child) {
          return child.init();
        });
      }
    } else {
      // No element = no attributes in the element.
      if (element == null || node.children == null) return;

      for (var child in node.children!) {
        child.init(element);
      }
    }
  }
}

class ReioNodeComponent extends ReioNode {
  // Events that will be triggered after
  // the corresponding name has been activated.
  Function(Element)? onMount;
  Function()? onDestroy;

  bool isMount = false;
  bool? isDestroy;

  String? styles;

  ReioNodeComponent(
      {required super.tag,
      required super.value,
      super.attrs,
      super.children,
      this.onMount,
      this.onDestroy});

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

  @override
  void init([Node? htmlNode]) {
    saveValue(value);

    final Element newElement = document.createElement(tag);
    ReioNodeComponentController(this)
      ..initData(newElement)
      ..initValue(newElement)
      ..initAttrs(newElement)
      ..initStyles(newElement)
      ..initChildren(newElement);
    element = newElement;

    // Mounting an element at once.
    if (htmlNode != null) htmlNode.append(newElement);

    // Event Calling.
    onMount?.call(element!);

    isMount = true;
    isDestroy = false;
  }

  @override
  void replace(ReioNode newNode) {
    newNode as ReioNodeComponent;

    // With different tags, recreates a node in the same parent.
    if (tag != newNode.tag) {
      newNode.init(element?.parentNode);
      // This node is destroyed because a new node has been created.
      destroy();
    } else {
      saveValue(newNode.value);

      // The new virtual node does not have its own element in the DOM
      // at this stage, but it must keep the data of the previous one.
      newNode.element = element;
      newNode.number = number;

      ReioNodeComponentController(this, newNode)
        ..initValue()
        ..initAttrs()
        ..initStyles()
        ..initChildren();
    }
  }
}

class ReioNodeComponentController extends ReioNodeController {
  ReioNodeComponentController(super.node, [super.newNode]);

  /// Initializing a CSS block in a virtual node.
  void initStyles([Element? element]) {
    ReioNodeComponent cNode = node as ReioNodeComponent;

    void init(Element? newNode) {
      const String attrStyleComponent = 'reio-component-style';
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
        final query = 'style[$attrStyleComponent="${cNode.number}"]'
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

        // The old node must have at least an empty string instead of null,
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
            // it is important to keep it in the new node.
            addClass(styleClass);

            continue;
          }

          Element styleTag = StyleElement();
          styleTag.setAttribute(attrStyleComponent, cNode.number);
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

    if (isReplacement) {
      ReioNodeComponent newNode = minorNode as ReioNodeComponent;
      // No element = no attributes in the element.
      if (newNode.element == null || newNode.styles == null) return;
      if (cNode.styles == newNode.styles) return;

      init(minorNode?.element);
    } else if (element != null) {
      init(element);
    }
  }
}

import 'dart:html';
import 'dart:math';

import '../../src/virtual_node.dart';

const String _attrReioComponentId = 'reio-component-id';
const String _attrReioTypeStyle = 'reio-style-type';

const String _classReioPrivateStyle = 'reio-style-private';
const String _classReioProtectedStyle = 'reio-style-protected';

const String _typePrivate = 'private';
const String _typeProtected = 'protected';
const String _typePublic = 'public';

const String _modifierPrivate = '{private}:';
const String _modifierProtected = '{protected}:';
const String _modifierPublic = '{public}:';

final RegExp _regExpPrivateModifier =
    RegExp(r'(\(.*\s*)?{private}:?.*{[\s\S]*?}');
final RegExp _regExpProtectedModifier =
    RegExp(r'(\(.*\s*)?{protected}:?.*{[\s\S]*?}');
final RegExp _regExpPublicModifier =
    RegExp(r'(\(.*\s*)?{public}:?.*{[\s\S]*?}');
final RegExp _regExpMinifyCss = RegExp(r'[\s\n\r]{2,}|/\*[\s\S]*?\*/');

const List<String> _ignoredAttrs = [_attrReioComponentId];

class VirtualNodeController {
  final VirtualNode _currentNode;
  VirtualNode? _newNode;
  bool _compare = true;

  VirtualNode get currentNode => _currentNode;

  VirtualNode? get newNode => _newNode;

  bool get isComparison => _compare;

  /// Initializing systems and updating virtual nodes.
  ///
  /// **Args:**<br>
  ///   - [_currentNode] ([VirtualNode]): The current node that is being rendered.
  ///   - [_newNode] ([VirtualNode]): The new node that is being rendered.
  VirtualNodeController(this._currentNode, [this._newNode]) {
    if (_newNode == null) {
      _compare = false;
      _newNode = _currentNode;
    }
  }

  void initData([Element? element]) {
    if (element == null) return;
    element.setAttribute(_attrReioComponentId, _currentNode.id);
  }

  /// Initializing a virtual node value.<br><br>
  ///
  /// **Args:**<br>
  ///   - [element] ([Element]): The element that is being updated.
  void initValue([Element? element]) {
    if (_compare) {
      if (_newNode?.dom == null || _newNode?.value == null) return;
      if (_newNode?.value == _currentNode.value &&
          _currentNode.isOldValue(_newNode!.value!)) return;
      _newNode!.dom?.innerHtml = _newNode!.value;
    } else {
      if (_currentNode.value == null || element == null) return;
      element.innerHtml = _currentNode.value;
    }
  }

  /// Initializing a CSS block in a virtual node.
  void initCss([Element? element]) {
    void set(Element? element) {
      void setModifier(String type, RegExp regExpModifier, String modifier,
          [String? modifierClass]) {
        final query =
            'style[$_attrReioComponentId="${_currentNode.id}"][$_attrReioTypeStyle="$type"]';

        List<String>? oldStyles = [];

        _currentNode.dom?.querySelectorAll(query).forEach((element) {
          return oldStyles.add(element.text as String);
        });

        List<Element>? oldStylesTags =
            _currentNode.dom?.querySelectorAll(query);
        List<RegExpMatch> modifiers =
            regExpModifier.allMatches(_currentNode.css).toList();

        String cssClass = '';
        if (modifierClass != null) {
          cssClass = '$modifierClass-${_currentNode.id}';
        }

        for (RegExpMatch match in modifiers) {
          String? mod = match.group(0);
          if (mod == null) continue;
          mod = mod.trim();

          /// Adding a class and minifying styles.
          if (modifierClass != null) {
            mod = mod.replaceFirst(modifier, '.$cssClass');
          } else {
            mod = mod.replaceFirst(modifier, cssClass);
          }

          mod = mod.replaceAllMapped(RegExp(r'^\(|\)$'), (match) => '');
          mod = mod.replaceAllMapped(_regExpMinifyCss, (match) => '');

          /// If the style is in the old ones, it means it is in use, so we remove it from the array.
          if (oldStyles.contains(mod)) {
            oldStyles.remove(mod);

            if (modifierClass != null && !element!.classes.contains(cssClass)) {
              element.classes.add(cssClass);
            }

            continue;
          }

          Element styleTag = StyleElement();
          styleTag.setAttribute(_attrReioComponentId, _currentNode.id);
          styleTag.setAttribute(_attrReioTypeStyle, type);
          styleTag.text = mod;

          if (modifierClass != null && !element!.classes.contains(cssClass)) {
            element.classes.add(cssClass);
          }

          if (element != null) {
            element.append(styleTag);
          } else {
            _currentNode.dom?.append(styleTag);
          }
        }

        /// Removes unused styles.
        oldStylesTags?.forEach((element) {
          if (oldStyles.contains(element.text)) element.remove();
        });
      }

      setModifier(_typePrivate, _regExpPrivateModifier, _modifierPrivate,
          _classReioPrivateStyle);
      setModifier(_typeProtected, _regExpProtectedModifier, _modifierProtected,
          _classReioProtectedStyle);
      setModifier(_typePublic, _regExpPublicModifier, _modifierPublic);
    }

    if (_compare) {
      if (_newNode?.dom == null || _newNode?.css == null) return;
      if (_currentNode.css == _newNode!.css) return;
      set(_newNode?.dom);
    } else {
      if (element == null) return;
      set(element);
    }
  }

  /// Initializing virtual node attributes.<br><br>
  ///
  /// **Args:**<br>
  ///   - [element] ([Element]): The element to be used for the attributes.
  void initAttrs([Element? element]) {
    if (_compare) {
      if (_newNode?.dom == null || _newNode?.attrs == null) return;
      if (_newNode!.attrs!.isEmpty) return;

      List<String> currentAttrs = [];
      List<String> newAttrs = [];
      _currentNode.attrs
          ?.toSet()
          .forEach((attr) => currentAttrs.add('${attr.name} ${attr.value}'));
      _newNode!.attrs!
          .toSet()
          .forEach((attr) => newAttrs.add('${attr.name} ${attr.value}'));

      /// Check for a new value.
      if (currentAttrs.join('') == newAttrs.join('')) return;

      List<String> keys = _newNode!.dom!.attributes.keys.toList();

      for (int i = 0; i < keys.length; i++) {
        String key = keys[i];
        if (_ignoredAttrs.contains(key)) continue;
        _newNode!.dom!.removeAttribute(key);
      }

      for (Attr attr in _currentNode.attrs!) {
        _newNode!.dom!.setAttribute(attr.name, attr.value);
      }
    } else {
      if (_currentNode.attrs == null || element == null) return;
      if (_currentNode.attrs!.isEmpty) return;

      for (Attr attr in _currentNode.attrs!) {
        element.setAttribute(attr.name, attr.value);
      }
    }
  }

  /// Initializing children of a virtual node.<br><br>
  ///
  /// **Args:**<br>
  ///   - [element] ([Element]): The element that is mounted.
  void initChildren([Element? element]) {
    if (_currentNode.children == null) return;
    if (_currentNode.children!.isEmpty) return;

    if (_compare) {
      if (_newNode?.dom == null || _newNode?.children == null) return;

      /// A loop that compares the children of the current node with the children of the new node.
      for (int i = 0;
          i < min(_currentNode.children!.length, _newNode!.children!.length);
          i++) {
        _currentNode.children![i].replace(_newNode!.children![i]);
      }

      /// If the new node has fewer children than the current one, the excess children are deleted.
      if (_currentNode.children!.length > _newNode!.children!.length) {
        _currentNode.children!
            .sublist(_newNode!.children!.length)
            .forEach((child) => child.destroy());
      }

      /// If the new node has more children than the current one, the children are added.
      if (_newNode!.children!.length > _currentNode.children!.length) {
        _newNode!.children!
            .sublist(_currentNode.children!.length)
            .forEach((child) => child.mount());
      }
    } else {
      if (element == null) return;

      for (var child in _currentNode.children!) {
        child.mount(element);
      }
    }
  }
}

// Copyright (c) MineEjo.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

// Prepared for use in the element value.
import 'package:reio/src/widget/html/tag/element_tag_br.dart';
import 'package:reio/src/widget/html/tag/element_tag_wbr.dart';

final br = '<${Br().node.tag}>';
final wbr = '<${Wbr().node.tag}>';

/// Contains useful methods to make working with HTML easier.
class WidgetHtml {
  static const String semicolonSep = '; ';
  static const String commaSep = ', ';
  static const String spaceSep = ' ';

  /// Converts the array to one of the HTML styles. <br>
  /// For example, which uses coords attribute - `0, 0, 82, 126`.<br>
  /// **Input**: `'a', 'b', 'c'`.<br>
  /// **Output**: `'a, b, c'`.
  String listToCommas(List<dynamic> list) {
    return _listToSeparator(commaSep, list);
  }

  /// Converts the array to one of the HTML styles. <br>
  /// For example, which uses class attribute: `name1 name2`.<br>
  /// **Input**: `'a', 'b', 'c'`.<br>
  /// **Output**: `'a b c'`.
  String listToSpaces(List<dynamic> list) {
    return _listToSeparator(spaceSep, list);
  }

  /// Converts the array to one of the HTML styles.<br>
  /// For example, which uses style attribute:
  /// `(margin: 10px; padding: 10px)`.<br>
  /// **Input**: `'a', 'b', 'c'`.<br>
  /// **Output**: `'a; b; c'`.
  String listToSemicolons(List<dynamic> list) {
    return _listToSeparator(semicolonSep, list);
  }

  /// Converts the list to a string separated
  /// by a configurable separator - [sep],
  /// similar in appearance to a modified [toString].
  String _listToSeparator(String sep, List<dynamic> list) {
    final RegExp startSquareBracketRegExp = RegExp(r'\[');
    final RegExp endSquareBracketRegExp = RegExp(r'\]');
    final RegExp commasRegExp = RegExp(r', ');

    // External array mapping being a string: ['x', 'y']
    String value = list.toString();
    // Removes the square brackets of the array.
    value = value.replaceFirstMapped(startSquareBracketRegExp, (match) => '');
    value = value.replaceFirstMapped(endSquareBracketRegExp, (match) => '');

    // Checks if the custom separator
    // is equal to the standard separator.
    if (sep != commaSep) {
      // Replaces the standard array separator with a custom one.
      value = value.replaceAllMapped(commasRegExp, (match) => sep);
    }

    return value;
  }
}

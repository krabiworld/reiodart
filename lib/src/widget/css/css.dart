// Copyright (c) MineEjo.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import 'css_root.dart';
import 'css_styles.dart';
import 'css_class.dart';

String importStyle({Theme? theme, bool? tags}) {
  String styles = '''<style>
    ${importRootStyle(theme: theme)}
    ${importBaseStyle()}
    ${importClassStyle()}
  </style>''';

  if (tags == false) {
    return styles.replaceFirst('<style>', '').replaceFirst('</style>', '');
  }

  return styles;
}

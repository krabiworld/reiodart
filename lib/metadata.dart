// Copyright (c) MineEjo.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

class ReioMetadata {
  static const String name = 'reio';
  static const String description =
      'Reio is a progressive Dart framework for creating UI on the web. '
      'Uses HTML, CSS and Dart, which is compiled into efficient JavaScript code.';
  static const String version = '0.2.14';
  static const String homepage = 'https://reiodart.vercel.app';
  static const String repository = 'https://github.com/MineEjo/reiodart';
  static const String issueTracker =
      'https://github.com/MineEjo/reiodart/issues';
  static const String documentation = 'https://mineejo.github.io/reiodart';

  static const List<String> platforms = ['web'];

  static const Map<String, dynamic> environment = {'sdk': '>=2.17.6 <3.0.0'};

  static const Map<String, dynamic> devDependencies = {
    'test': '^1.23.0',
    'lints': '^2.0.1',
    'build_runner': '^2.3.3',
    'build_test': '^2.1.6',
    'build_web_compilers': '^3.2.7'
  };
}

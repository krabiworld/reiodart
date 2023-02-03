// Copyright (c) MineEjo.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

/// Compares lists containing maps, pass values
/// from the maps you want to compare into the function.
/// ```
/// compareMapOfList(list1, list2, (map) {
///   map as Banana;
///   return m.peel + m.pulp;
/// })
/// ```
bool compareMapOfList(List? l1, List? l2, dynamic Function(dynamic) getValue) {
  List<dynamic> firstValues = [];
  l1?.toSet().forEach((map) => firstValues.add(getValue.call(map)));

  List<dynamic> secondValues = [];
  l2?.toSet().forEach((map) => secondValues.add(getValue.call(map)));

  return firstValues.join('') == secondValues.join('');
}

// Copyright (c) MineEjo.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

/// Compares lists containing classes, pass values
/// from the classes you want to compare into the function.
/// ```
/// compareClassOfList<Banana>(list1, list2, (c) {
///   return c.peel + c.pulp;
/// })
/// ```
bool compareClassOfList<T>(List<dynamic>? l1, List<dynamic>? l2, dynamic Function(T) getValue) {
  List<dynamic> firstValues = [];
  l1?.toSet().forEach((c) => firstValues.add(getValue.call(c)));

  List<dynamic> secondValues = [];
  l2?.toSet().forEach((c) => secondValues.add(getValue.call(c)));

  return firstValues.join('') == secondValues.join('');
}

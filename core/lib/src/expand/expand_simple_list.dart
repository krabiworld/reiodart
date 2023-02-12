// Copyright (c) MineEjo.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

/// [SimpleList] used in the widget,
/// avoiding a lot of checking.
/// To get the original [List], use the [toList] method.
class SimpleList<T> {
  final List<T> _list;

  SimpleList(this._list);

  T operator [](int number) {
    if (number > _list.length - 1) return _list.last;
    if (number < 0) return _list.first;
    return _list[number];
  }

  operator +(T item) {
    _list.add(item);
  }

  operator -(T item) {
    _list.remove(item);
  }

  List<T> toList() => _list;
}

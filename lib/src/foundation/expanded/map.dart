bool compareMapOfList(
    List? first, List? second, dynamic Function(dynamic) getValue) {
  List<dynamic> firstValues = [];
  first?.toSet().forEach((map) => firstValues.add(getValue.call(map)));

  List<dynamic> secondValues = [];
  second?.toSet().forEach((map) => secondValues.add(getValue.call(map)));

  return firstValues.join('') == secondValues.join('');
}

class ReioTools {
  bool compareMapOfList(
      List? first, List? second, dynamic Function(dynamic) value) {
    dynamic firstValues = [];
    first?.toSet().forEach((map) => firstValues.add(value(map)));

    dynamic secondValues = [];
    second?.toSet().forEach((map) => secondValues.add(value(map)));

    return firstValues.join('') == secondValues.join('');
  }
}

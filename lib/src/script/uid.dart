const String _chars =
    '0123456789ABCDEFGHJKLMNOPQRSTUVWXYabcdefghjklmnopqrstuvwxy';
const String _prefix = 'I';
const String _sep = 'Z';
const int _intLimit = 2147483646;
const int _lengthTimeStampBlock = 4;

/// The length is reduced by 1, because it is used as an array index.
final int _charsLength = _chars.length - 1;

int _totalGenerated = 0;

String uid() {
  List timeStampChars =
      List.filled(_lengthTimeStampBlock, null, growable: false);
  int microseconds = DateTime.now().microsecondsSinceEpoch;

  for (int i = 0; i < _lengthTimeStampBlock; i++) {
    timeStampChars[i] = _chars[microseconds % _charsLength];
    microseconds = (microseconds / _charsLength).floor();
  }

  String uniqueId =
      '$_prefix${_chars.length}$_sep${timeStampChars.join('')}$_sep$_totalGenerated';

  /// Resets the variable if its value exceeds the type value.
  if (_totalGenerated >= _intLimit) _totalGenerated = 0;

  _totalGenerated++;
  return uniqueId;
}

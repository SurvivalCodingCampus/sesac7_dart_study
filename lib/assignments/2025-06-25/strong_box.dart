import 'package:modu_3_dart_study/assignments/2025-06-25/key_type.dart';

class StrongBox<T> {
  static const Map<KeyType, int> _maxTrials = {
    KeyType.padlock: 1024,
    KeyType.button: 10000,
    KeyType.dial: 30000,
    KeyType.finger: 1_000_000,
  };

  Map<KeyType, int> get maxTrials => _maxTrials;

  T? _content;
  final KeyType keyType;
  int _tryCount = 0;

  StrongBox(this.keyType, {T? content}) : _content = content;

  T? get() {
    if (_tryCount < StrongBox._maxTrials[keyType]!) {
      //print("$_tryCount out of ${StrongBox._maxTrials[keyType]!}");
      _tryCount++;
      return null;
    }
    return _content;
  }

  void set(T item) {
    if (_content == null) {
      _content = item;
      _tryCount = 0;
    } else {
      print(
        "The strongbox is already occupied. Need to open it before putting new items.",
      );
    }
  }
}

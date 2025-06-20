import '../enum/key_type.dart';

class StrongBox<E> {
  static int padlockTryCount = 1024;
  static int buttonTryCount = 10000;
  static int dialTryCount = 30000;
  static int fingerTryCount = 1000000;

  E? _item;
  late int _openTryCount;

  final KeyType keyType;

  StrongBox(this.keyType) {
    switch (keyType) {
      case KeyType.padlock:
        _openTryCount = padlockTryCount;
        break;
      case KeyType.button:
        _openTryCount = buttonTryCount;
        break;
      case KeyType.dial:
        _openTryCount = dialTryCount;
        break;
      case KeyType.finger:
        _openTryCount = fingerTryCount;
        break;
    }
  }

  void put(E value) => _item = value;

  E? get() {
    if (_openTryCount < 0) {
      throw Exception('이미 아이템 찾아갔음');
    }
    if (_openTryCount == 0) {
      return _item;
    } else {
      _openTryCount--;
      return null;
    }
  }
}

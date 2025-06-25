import 'package:modu_3_dart_study/06_generic/exam/key_type.dart';

class StrongBox<E> {
  final KeyType _keyType;

  KeyType get keyType => _keyType;

  E? _item;

  int _count = 0;

  StrongBox({required KeyType keyType}) : _keyType = keyType;

  void put(E item) {
    _item = item;
  }

  E? get() {
    switch (_keyType) {
      case KeyType.padlock:
        if (_count < 1024) {
          _count++;
          return null;
        }
      case KeyType.button:
        if (_count < 10_000) {
          _count++;
          return null;
        }
      case KeyType.dial:
        if (_count < 30_000) {
          _count++;
          return null;
        }
      case KeyType.finger:
        if (_count < 1_000_000) {
          _count++;
          return null;
        }
    }

    return _item;
  }
}

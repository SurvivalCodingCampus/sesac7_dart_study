import 'package:modu_3_dart_study/10_generic_enum/key_type.dart';

class StrongBox<E> {
  E? _instance;
  final KeyType _keyType;
  int _count = 0;

  int get count => _count;

  StrongBox({required KeyType keyType}) : _keyType = keyType;

  void put(E instance) {
    _instance = instance;
  }

  get() {
    if (_keyType.count == _count) {
      return _instance;
    } else {
      _count++;
      return null;
    }
  }
}

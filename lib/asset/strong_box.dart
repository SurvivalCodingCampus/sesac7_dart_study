import '../enum/key_type.dart';

class StrongBox<E> {
  E? _item;
  int _openTryCount;

  final KeyType keyType;

  StrongBox({required this.keyType}): _openTryCount = keyType.tryCount;

  void put(E value) => _item = value;

  E? get() {
    if (_openTryCount < 0) {
      throw Exception('이미 아이템 찾아갔음');
    }
    if (_openTryCount == 0) {
      _openTryCount--;
      return _item;
    } else {
      _openTryCount--;
      return null;
    }
  }
}

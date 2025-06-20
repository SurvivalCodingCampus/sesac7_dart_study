import '../enum/key_type.dart';

class StrongBox<E> {
  E? _item;
  int openTryCount;

  final KeyType keyType;

  StrongBox({required this.keyType}): openTryCount = keyType.tryCount;

  void put(E value) => _item = value;

  E? get() {
    if (openTryCount < 0) {
      throw Exception('이미 아이템 찾아갔음');
    }
    if (openTryCount == 0) {
      openTryCount--;
      return _item;
    } else {
      openTryCount--;
      return null;
    }
  }
}

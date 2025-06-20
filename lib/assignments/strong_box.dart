enum KeyType {
  padlock(1024),
  button(10000),
  dial(30000),
  finger(1000000);

  final int remainOpenCount;

  const KeyType(this.remainOpenCount);
}

class StrongBox<T> {
  T? _item;
  final KeyType key;
  int _openCount = 0;

  StrongBox({required this.key});

  void put(T item) {
    this._item = item;
  }

  T? get() {
    if (_openCount < key.remainOpenCount) {
      _openCount++;
      return null;
    }

    return _item;
  }
}

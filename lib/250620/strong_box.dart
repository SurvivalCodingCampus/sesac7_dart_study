enum KeyType { padlock, button, dial, finger }

class StrongBox<T> {
  T? _value;

  int _remainCount;

  //열릴때까지 시도해야하는 횟수
  static const targetCounts = [1024, 10000, 3000, 100];

  StrongBox({required KeyType keyType})
    : _remainCount = targetCounts[keyType.index];

  void put({T? input}) {
    _value = input;
  }

  T? get() {
    _remainCount--;

    if (_remainCount == 0) {
      return _value;
    } else {
      return null;
    }
  }
}

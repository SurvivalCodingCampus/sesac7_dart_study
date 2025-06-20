enum KeyType {
  padlock,
  button,
  dial,
  finger,
}

class StrongBox<E> {
  E? _entity; // 상자에 들어갈 물건
  int _tryCount = 0; // 열쇠를 사용한 횟수
  final KeyType _keyType; // 열쇠의 종류

  // 각 열쇠 별 시도횟수의 한도
  final Map<KeyType, int> _keyTypeMap = {
    KeyType.padlock: 1024,
    KeyType.button: 10000,
    KeyType.dial: 30000,
    KeyType.finger: 1000000,
  };

  // 생성자
  StrongBox({required KeyType keyType}) : _keyType = keyType;

  // getter
  E? get entity => _entity;

  int get tryCount => _tryCount;

  KeyType get keyType => _keyType;

  Map<KeyType, int> get keyTypeMap => _keyTypeMap;

  // method
  void put(E something) {
    // 금고에는 물건을 하나만 담을 수 있으므로, 이미 물건이 담긴 상태라면,
    // 즉, entity가 null이 아닌 상태라면 물건을 더 담을 수 없도록 함.
    if (entity != null) {
      throw Exception('금고에는 물건을 하나만 담을 수 있습니다.');
    }

    _entity = something;
  }

  E? get() {
    // 설정한 keyType에 따라 entity를 얻는 시도를 한다. (getEntity)
    // 사용횟수 제한은 keyTypeMap[keyType]을 따른다.
    switch (keyType) {
      case KeyType.padlock:
        return getEntity(keyTypeMap[keyType]!);
      case KeyType.button:
        return getEntity(keyTypeMap[keyType]!);
      case KeyType.dial:
        return getEntity(keyTypeMap[keyType]!);
      case KeyType.finger:
        return getEntity(keyTypeMap[keyType]!);
    }
  }

  // 사용횟수 제한보다 시도횟수가 적으면 시도횟수를 1 증가시키고 null을 리턴
  // 사용횟수 제한을 초과한 순간 entity 리턴
  E? getEntity(int tryCountLimit) {
    if (tryCount < tryCountLimit) {
      _tryCount++;
      return null;
    }

    return entity;
  }
}

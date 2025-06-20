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
    // selectEntityResult 결과에 따라 null을 리턴할지, entity를 리턴하고 금고를 초기화할지를 선택한다.
    switch (keyType) {
      case KeyType.padlock:
        return selectEntityResult(keyType);
      case KeyType.button:
        return selectEntityResult(keyType);
      case KeyType.dial:
        return selectEntityResult(keyType);
      case KeyType.finger:
        return selectEntityResult(keyType);
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

  // entity 값을 null로, tryCount 값을 0으로 초기화할지를 결정
  // 한 사이클이 끝났을 때(entity를 리턴할 때) 초기화 실행 후 임시 저장했던 result(entity)를 리턴
  // 사이클 실행 중에는 그대로 null을 리턴
  E? selectEntityResult(KeyType keyType) {
    E? result = getEntity(keyTypeMap[keyType]!);

    if (result != null) {
      _entity = null;
      _tryCount = 0;
      return result;
    }

    return null;
  }
}

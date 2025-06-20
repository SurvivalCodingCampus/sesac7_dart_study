// 금고, 열쇠를 타입으로 가진다
// 생성자가 선언될때 타입을 제한하는 것
class StrongBox<E extends KeyType> {
  // 금고 담는 인스턴스 타입은 미정
  E? _key;

  bool put(E key) {
    _key = key;
    return key.tryInsert();
  }

  E? get() {
    // 별도의 타입 캐스팅을 사용하지 않아도 됨
    return _key;
  }

  StrongBox();
}

// 사용할 수 있는 키 종류
enum LockType { padlock, button, dial, finger } // LockType 이라는 타입 값

// 사용할 키의 종류에 따른 사용 규칙
class KeyType<K> {
  // 어떤 종류의 키인가?를 판단해야함
  final LockType selectedLockType; // 타입
  final K value; // 키 이름

  // 실제 시도 횟수 
  int tryCount = 0;

  // 열쇠종류별 시도해야하는 횟수
  final int padlockCount = 1024;
  final int buttonCount = 10000;
  final int dialCount = 30000;
  final int fingerCount = 1000000;

  // 생성자
  KeyType({
    required this.selectedLockType,
    required this.value,
  });

  // 열쇠종류에 따른 unlock 기준
  bool isUnlocked() {
    switch( selectedLockType ) {
      case LockType.padlock:
        return tryCount >= padlockCount;
      case LockType.button:
        return tryCount >= buttonCount;
      case LockType.dial:
        return tryCount >= dialCount;
      case LockType.finger:
        return tryCount >= fingerCount;
    }
  }

  bool tryInsert(){
    tryCount++;
    
    if(!isUnlocked()) {
      print('금고열기 실패, $value키로 금고 열기 시도 $tryCount번째');
      return false;
    }
    print('금고열기 성공!!!, $value키로 금고 열기 시도 $tryCount번째');
    return true;
  }

}
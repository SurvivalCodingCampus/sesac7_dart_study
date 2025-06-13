class Hero {
  String _name; // 이름
  int _hp; // 현재 hp
  final int _hpMax; // hp 최대치

  // 생성자를 실행할 때 hp 최대치 값(_hpMax)은 입력 받은 hp 값과 같도록 초기화한다.
  Hero({required String name, required int hp}) : _name = name, _hp = hp, _hpMax = hp {
    if (hp < 1) {
      throw Exception('용사의 체력은 양수로 설정되어야합니다.');
    }
  }

  // getter
  String get name => _name;
  int get hp => _hp;
  int get hpMax => _hpMax;

  // setter
  set name(String name) {
    _name = name;
  }

  set hp(int hp) {
    _hp = hp;
  }

  // method
  void attack() {
    print('$name이 공격');
  }

  void run() {
    print('$name이 도망쳤다');
  }

}
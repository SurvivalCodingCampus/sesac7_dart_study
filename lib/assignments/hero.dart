class Hero {
  static const int maxHp = 50;
  static const int minHp = 0;

  final String name;
  int _hp;

  Hero(
    this.name, {
    int hp = maxHp,
  }) : _hp = hp;

  int get hp => _hp;

  void decreaseHp(int damage) {
    if (_hp <= minHp) {
      throw Exception('HP가 더 이상 감소할 수 없습니다.');
    }

    print('$name이/가 $damage의 피해를 입었습니다.');
    var actualDamage = damage;
    if (_hp - damage < minHp) {
      actualDamage = _hp;
    }

    _hp -= actualDamage;
    printCurrentHp();
  }

  void increaseHp(int heal) {
    if (_hp >= maxHp) {
      throw Exception('HP가 더 이상 증가할 수 없습니다.');
    }

    print('$name이/가 $heal의 회복을 받았습니다.');
    var actualHeal = heal;
    if (_hp + heal > maxHp) {
      actualHeal = maxHp - _hp;
    }

    _hp += actualHeal;
    printCurrentHp();
  }

  void printCurrentHp() {
    print('$name의 현재 HP: $_hp');
  }
}

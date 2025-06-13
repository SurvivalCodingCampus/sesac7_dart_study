class Wand {
  String _name;
  double _power;

  Wand({required String name, required double power})
    : _name = name,
      _power = power {
    wandName = name;
    wandPower = power;
  }

  // 이름은 null 일수없고 반드시 3문자 이상이여야한다
  set wandName(String newWandName) {
    if (newWandName.length < 3) {
      throw Exception('지팡이 이름이 너무 짧습니다');
    }
    _name = newWandName;
  }

  // 지팡이의 마력은 0.5 이상 100 이하
  set wandPower(double newWandPower) {
    if (newWandPower < 0.5) {
      throw Exception('지팡이의 마력은 5.0 이상이여야 합니다');
    }
    if (newWandPower > 100) {
      throw Exception('지팡이의 마력은 100.0 이상이여야 합니다');
    }
    _power = newWandPower;
  }
}

class Wizard {
  String _name;
  int _hp;
  int _mp;
  Wand? wand;

  // 마법사가 생성된 이후에는 지팡이를 null로 설정할 수 없다
  Wizard({required String name, int hp = 0, int mp = 0, required Wand wand})
    : _name = name,
      _hp = hp,
      _mp = mp {
    this.name = name;
    this.mp = mp;
    this.hp = hp;
  }

  // getter
  int get hp => _hp;

  // 이름은 null 일수없고 반드시 3문자 이상이여야한다
  set name(String newName) {
    if (newName.length < 3) {
      throw Exception('마법사 이름이 너무 짧습니다');
    }
    _name = newName;
  }

  // 마법사의 MP는 0 이상이여야 한다
  set mp(int newMp) {
    if (newMp < 0) {
      throw Exception('MP는 0 이상이여야 합니다');
    }

    _mp = newMp;
  }

  // hp가 음수가 되는 상황에서는 대신 0을 설정
  set hp(int newHp) {
    if (newHp < 0) {
      newHp = 0;
    }

    _hp = newHp;
  }
}

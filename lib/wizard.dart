import 'package:modu_3_dart_study/wand.dart';

class Wizard {
  String _name;
  int _hp;
  int _mp;
  Wand? _wand;

  // getter
  String get name => _name;
  int get hp => _hp;
  int get mp => _mp;
  Wand? get wand => _wand;

  // setter
  set name(String name) {
    if (name.length < 3) {
      throw Exception('마법사의 이름이 너무 짧습니다. 이름은 3문자 이상으로 설정되어야합니다.');
    }

    // 마법사 이름(_name)은 null을 허용하지 않는 String 타입이므로 조건문 생략
    _name = name;
  }

  set hp(int hp) {
    if (hp < 0) {
      print('음수값이 입력되었습니다. 0으로 설정합니다.');
      _hp = 0;
    }

    _hp = hp;
  }

  set mp(int mp) {
    if (mp < 0) {
      throw Exception('마법사의 MP는 0 이상으로 설정되어야합니다.');
    }

    _mp = mp;
  }

  set wand(Wand? wand) {
    if (wand == null) {
      throw Exception('마법사가 생성된 이후에는 지팡이의 정보를 null로 설정할 수 없습니다.');
    }

    _wand = wand;
  }

  Wizard(this._name, this._hp, this._mp, this._wand);
}

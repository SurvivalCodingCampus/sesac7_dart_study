import 'package:modu_3_dart_study/wand.dart';

class Wizard {
  String _name;
  int _hp;
  int _mp;
  Wand? _wand;

  Wizard(String name, int hp, int mp, Wand? wand)
    : _name = '',
      _hp = 0,
      _mp = 0 {
    this.name = name;
    this.hp = hp;
    this.mp = mp;
    this.wand = wand;
  }

  String get name => _name;

  int get hp => _hp;

  int get mp => _mp;

  Wand? get wand => _wand;

  set name(String newName) {
    if (newName.length < 3) {
      throw Exception('에러 : 마법사 이름은 3자 이상');
    }
    _name = newName;
  }

  set hp(int newHP) {
    _hp = newHP < 0 ? 0 : newHP;
  }

  set mp(int newMP) {
    if (newMP < 0) {
      throw Exception('에러 : MP는 0 이상');
    }
    _mp = newMP;
  }

  set wand(Wand? newWand) {
    if (newWand == null) {
      throw Exception('에러 : 지팡이는 null로 설정 불가');
    }
    _wand = newWand;
  }
}

import 'package:modu_3_dart_study/wand.dart';

class Wizard {
  String name;
  int _mp;
  int _hp;
  Wand? _wand;

  Wizard({required this.name, required int mp, required int hp, Wand? wand})
    : _mp = mp,
      _hp = hp,
      _wand = wand;

  Wand? get wand => _wand;

  int get mp => _mp;

  int get hp => _hp;

  set setWand(Wand? value) {
    if (value == null) {
      throw Exception('지팡이를 null로 설정할 수 없습니다.');
    } else {
      _wand = value;
    }
  }

  set setMp(int value) {
    if (value > 0) {
      _mp = value;
    } else {
      throw Exception('마법사의 MP는 0 이상이어야 합니다.');
    }
  }

  set setHp(int value) {
    if (value < 0) {
      _mp = 0;
    } else {
      _mp = value;
    }
  }
}

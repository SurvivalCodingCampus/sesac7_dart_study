import 'package:modu_3_dart_study/hero.dart';
import 'package:modu_3_dart_study/wand.dart';

class Wizard {
  String _name;
  int _hp;
  Wand? _wand;
  int _mp;

  Wizard(this._name, {required int hp, Wand? wand, int mp = 100})
    : _hp = hp,
      _wand = wand,
      _mp = mp;

  String get name => _name;

  Wand? get wand => _wand;

  int get mp => _mp;

  int get hp => _hp;

  set setName(String value) {
    if (value.length < 3) {
      throw Exception('마법사의 이릉은 3글자 이상이어야 합니다.');
    } else {
      _name = value;
    }
  }

  set setWand(Wand? value) {
    if (value == null) {
      throw Exception('지팡이를 null로 설정할 수 없습니다.');
    } else {
      _wand = value;
    }
  }

  set setMp(int value) {
    if (value >= 0) {
      _mp = value;
    } else {
      throw Exception('마법사의 MP는 0 이상이어야 합니다.');
    }
  }

  set setHp(int value) {
    if (value < 0) {
      _hp = 0;
    } else {
      _hp = value;
    }
  }

  void heal(Hero hero) {
    if (_mp < 10) {
      print('마나가 부족합니다.');
      return;
    }
    hero.hp = (hero.hp + 20).clamp(0, hero.maxHp);
    _mp -= 10;
    print('힐을 시전했습니다. 대상 HP: ${hero.hp}.');
  }
}

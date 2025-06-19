import 'package:modu_3_dart_study/assignments/hero.dart';
import 'package:modu_3_dart_study/assignments/wand.dart';

class Wizard {
  static const int minNameLength = 3;
  static const int minHp = 0;
  static const int maxMp = 100;
  static const int minMp = 0;
  static const int healCost = 10;
  static const int healAmount = 20;

  String _name;
  int _hp;
  int _mp;
  Wand? _wand;

  Wizard(
    this._name, {
    required int hp,
    int mp = maxMp,
    Wand? wand,
  }) : _hp = hp,
       _mp = mp,
       _wand = wand;

  String get name => _name;
  int get hp => _hp;
  int get mp => _mp;
  Wand? get wand => _wand;

  set name(String? value) {
    if (value == null || value.length < minNameLength) {
      throw Exception('이름은 $minNameLength문자 이상이어야 합니다.');
    }

    _name = value;
  }

  set hp(int value) {
    if (value < minHp) {
      value = minHp;
    }

    _hp = value;
  }

  set mp(int value) {
    if (value < minMp) {
      throw Exception('MP는 $minMp 이상이어야 합니다.');
    }

    _mp = value;
  }

  set wand(Wand? value) {
    if (value == null) {
      throw Exception('지팡이가 존재해야 합니다.');
    }

    _wand = value;
  }

  void heal(Hero hero) {
    if (_mp < healCost) {
      print('마나가 부족합니다.');
      return;
    }

    hero.increaseHp(healAmount);
    mp -= healCost;
    print('힐을 시전했습니다. 대상 HP: ${hero.hp}');
  }
}

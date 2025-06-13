import 'package:modu_3_dart_study/wand.dart';

import 'hero.dart';

class Wizard {
  String _name;
  int _hp;
  int _mp;
  Wand? _wand;

  Wizard({required String name, required int hp, int mp = 100, Wand? wand})
    : _name = name,
      _hp = hp,
      _mp = mp,
      _wand = wand;

  String get name => _name;

  int get hp => _hp;

  int get mp => _mp;

  Wand? get wand => _wand;

  set name(String? value) {
    if (value == null) {
      throw Exception('에러메세지');
    } else if (value.length < 3) {
      throw Exception('에러메세지');
    }
    _name = value;
  }

  set wand(Wand? value) {
    if (value == null) {
      throw Exception('에러메세지');
    }
    _wand = value;
  }

  set mp(int? value) {
    if (value == null) {
      throw Exception('에러메세지');
    } else if (value < 0) {
      throw Exception('에러메세지');
    }
    _mp = value;
  }

  set hp(int? value) {
    if (value == null) {
      throw Exception('에러메세지');
    } else if (value < 0) {
      _hp = 0;
    } else {
      _hp = value;
    }
  }
  void heal(Hero hero) {
    if (_mp >= 10) {
      hero.hp += 20;
      _mp -= 10;
      print('힐을 시전했습니다. 대상 HP: ${hero.hp}');
    } else {
      print('마나가 부족합니다');
    }
  }
}

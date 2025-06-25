import 'package:modu_3_dart_study/rpg_game/hero.dart';
import 'package:modu_3_dart_study/rpg_game/sword.dart';

class SuperHero extends Hero {
  Sword? sword;
  bool _isFlying = false;

  SuperHero({required super.name, required super.hp});

  // getter
  bool get isFlying => _isFlying;

  // setter
  set isFlying(bool value) {
    _isFlying = value;

    if (value) {
      print('$name이 날개를 펼쳤다.');
    } else {
      print('$name이 날개를 접었다.');
    }
  }
}

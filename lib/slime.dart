import 'package:modu_3_dart_study/hero.dart';

class Slime {
  int _hp = 50;
  final String _suffix;

  Slime(this._suffix);

  void attack(Hero hero) {
    print('슬라임$_suffix이/가 공격했다');
    print('10의 데미지');
    hero.hp -= 10;
  }
}
import 'package:modu_3_dart_study/hero.dart';

class Slime {
  final int _hp = 50;

  int get hp => _hp;

  final String _suffix;

  Slime(this._suffix);

  void attack(Hero hero) {
    if (hero.hp < 10) {
      hero.hp = 0;
      return;
    }

    print('슬라임$_suffix이/가 공격했다');
    print('10의 데미지');
    hero.receiveDamage(10);
  }
}

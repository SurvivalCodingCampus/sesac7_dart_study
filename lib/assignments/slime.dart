import 'package:modu_3_dart_study/assignments/hero.dart';

class Slime {
  static const int maxHp = 50;
  static const int damage = 10;

  final String suffix;
  final int hp;

  Slime(
    this.suffix, {
    this.hp = maxHp,
  });

  void attack(Hero hero) {
    print('슬라임$suffix이/가 ${hero.name}을/를 공격했다.');
    print('$damage의 데미지.');
    hero.decreaseHp(damage);
  }
}

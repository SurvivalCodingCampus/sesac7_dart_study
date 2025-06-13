import 'package:modu_3_dart_study/character/hero.dart';

class Slime {
  int hp = 50;

  final int level = 10;
  final String suffix;
  final int slimeAttackDamage = 10;

  Slime(this.suffix);

  void run() {
    print('슬라임 $suffix가 도망갔다.');
  }

  void attack(Hero hero) {
    print('슬라임$suffix이/가 공격했다.');
    print('10의 데미지');
    hero.hp -= slimeAttackDamage;
  }
}
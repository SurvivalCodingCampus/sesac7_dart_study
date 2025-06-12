import 'package:modu_3_dart_study/slime.dart';

import 'hero.dart';

class PoisonSlime extends Slime {
  PoisonSlime(super.suffix);

  int _poisonCount = 5;

  int get poisonCount => _poisonCount;

  @override
  void attack(Hero hero) {
    print('슬라임$suffix이/가 공격했다');
    print('10의 대미지');
    hero.hp -= 10;

    if (_poisonCount > 0) {
      int poisonDamage = (hero.hp / 5).toInt();

      print('추가로, 독 포자를 살포했다!');
      hero.hp -= poisonDamage;
      print('$poisonDamage포인트의 데미지');
      _poisonCount--;
    }
  }
}

void main() {
  final pSlime = PoisonSlime('A');

  final hero = Hero(name: '홍길동', hp: 200);

  for (int i = 0; i < 7; i++) {
    pSlime.attack(hero);
  }
}

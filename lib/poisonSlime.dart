import 'package:modu_3_dart_study/slime.dart';

import 'hero.dart';

class PoisonSlime extends Slime {
  PoisonSlime(super.suffix);

  int _poisonCount = 5;
  int get poisonCount => _poisonCount;

  @override
  attack(Hero hero) {
    if (hero.hp <= 0) {
      hero.hp = 0;
      return;
    }
    super.attack(hero);

    if (_poisonCount > 0) {
      print('추가로, 독 포자를 살포했다!');
      final poisonDamage = hero.hp / 5;
      hero.hp -= poisonDamage.toInt();

      print('~포인트의 데미지');

      _poisonCount--;
    }
  }
}
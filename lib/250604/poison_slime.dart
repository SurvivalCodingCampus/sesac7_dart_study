import 'package:modu_3_dart_study/250604/slime.dart';
import 'package:modu_3_dart_study/250604/hero.dart';

class PoisonSlime extends Slime {
  int poisonCount;

  PoisonSlime(super.suffix, [this.poisonCount = 5]);

  @override
  void attack(Hero hero) {
    super.attack(hero);

    if (poisonCount > 0) {
      print('추가로, 독 포자를 살포했다!');

      int damage = hero.hp ~/ 5;
      hero.hp -= damage;
      print('$damage포인트의 데미지: ${hero.hp}');

      poisonCount--;
    }
  }
}

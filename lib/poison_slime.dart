import 'package:modu_3_dart_study/hero.dart';
import 'package:modu_3_dart_study/slime.dart';

class PoisonSlime extends Slime {
  int _poisonCount = 5;

  PoisonSlime(super.suffix);

  @override
  void attack(Hero hero) {
    super.attack(hero);
    if (_poisonCount > 0) {
      print('추가로, 독포자를 살포했다!');
      // 독공격에 의한 hp 감소치
      int damageByPoisonSlime = hero.hp ~/ 5;
      hero.hp -= damageByPoisonSlime;
      print('$damageByPoisonSlime 포인트의 데미지');
      _poisonCount -= 1;
    }
  }
}

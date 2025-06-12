import 'package:modu_3_dart_study/assignments/hero.dart';
import 'package:modu_3_dart_study/assignments/slime.dart';

class PoisonSlime extends Slime {
  int _poisonCount = 5;

  PoisonSlime(super.suffix);

  int get poisonCount => _poisonCount;

  @override
  void attack(Hero hero) {
    super.attack(hero);

    // poisonCount가 남아있으면 독 공격 추가
    if (_poisonCount > 0) {
      print('추가로, 독 포자를 살포했다!');
      int poisonDamage = (hero.hp / 5).floor();
      hero.hp -= poisonDamage;
      print('$poisonDamage의 데미지');
      _poisonCount--;
    }
  }
}

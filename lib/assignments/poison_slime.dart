import 'package:modu_3_dart_study/assignments/hero.dart';
import 'package:modu_3_dart_study/assignments/slime.dart';

class PoisonSlime extends Slime {
  static const int maxPoisonCount = 5;
  static const int minPoisonCount = 0;
  static const double poisonDecreaseRate = 0.2;
  static const int poisonCountDecrease = 1;

  int _poisonCount;

  PoisonSlime(
    super.suffix, {
    super.hp,
    int poisonCount = maxPoisonCount,
  }) : _poisonCount = poisonCount;

  int get poisonCount => _poisonCount;

  @override
  void attack(Hero hero) {
    super.attack(hero);

    if (_poisonCount <= minPoisonCount) return;

    print('추가로, 독 포자를 살포했다!');
    hero.decreaseHp((Hero.maxHp * poisonDecreaseRate).toInt());
    _poisonCount -= poisonCountDecrease;
  }
}

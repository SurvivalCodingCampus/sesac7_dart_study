import 'package:modu_3_dart_study/250604/hero.dart';
import 'package:modu_3_dart_study/250604/poison_slime.dart';

class Slime {
  int hp = 50;
  final String suffix;
  static const int attackDemage = 10;

  Slime(this.suffix);

  void attack(Hero hero) {
    print('슬라임$suffix이/가 공격했다');
    print('10의 데미지: ${hero.hp}');

    hero.hp -= attackDemage;
  }
}

void main() {
  PoisonSlime poisonSlime = PoisonSlime('A');

  poisonSlime.attack(Hero('heorX', 100));
  poisonSlime.attack(Hero('heorX', 100));
  poisonSlime.attack(Hero('heorX', 100));
  poisonSlime.attack(Hero('heorX', 100));
  poisonSlime.attack(Hero('heorX', 100));
  poisonSlime.attack(Hero('heorX', 100));
  poisonSlime.attack(Hero('heorX', 100));
}

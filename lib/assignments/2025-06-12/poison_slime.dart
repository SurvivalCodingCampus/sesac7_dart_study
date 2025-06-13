import 'package:modu_3_dart_study/assignments/2025-06-12/slime.dart';

import '../../hero.dart';

class PoisonSlime extends Slime {
  int _poisonCount = 5;

  set poisonCount(int value) {
    if (value < 0) {
      throw Exception('poisonCount는 0 이상이어야 합니다.');
    }
    _poisonCount = value;
  }

  int get poisonCount => _poisonCount;

  PoisonSlime(super.suffix);

  @override
  void attack(Hero hero) {
    // TODO: implement attack
    print('1차 공격 전 : ${hero.name}의 hp : ${hero.hp}');
    super.attack(hero); //여기서 hero hp를 10깎음.
    print('1차 공격 후 : ${hero.name}의 hp : ${hero.hp}');
    if (poisonCount > 0) {
      print('추가로, 독 포자를 살포했다.');
      int damage = (hero.hp / 5).toInt();
      hero.hp -= damage;
      print('$damage포인트의 데미지');
      print('독 공격 후 : ${hero.name}의 hp : ${hero.hp}');
      poisonCount -= 1;
    }
  }
}

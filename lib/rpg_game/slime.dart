import 'package:modu_3_dart_study/rpg_game/hero.dart';

class Slime {
  int hp = 50;
  final String suffix;
  final int attackDamage = 10;

  Slime(this.suffix);

  void attack(Hero hero) {
    // 용사 생사 검증
    if (hero.hp <= 0) {
      print('용사가 이미 죽었습니다. 공격할 수 없습니다.');
      return;
    }

    print('슬라임 $suffix이/가 공격했다');
    print('10의 데미지');

    if (hero.hp - attackDamage < 0) {
      // hp 잔여량에서 데미지를 뺀 값이 0보다 작으면 hp 잔여량을 0으로 보정하고,
      hero.hp = 0;
    } else {
      // 0이거나 0보다 크다면 그대로 잔여량에 반영한다.
      hero.hp -= attackDamage;
    }
  }
}

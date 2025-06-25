import 'package:modu_3_dart_study/rpg_game/slime.dart';

import 'hero.dart';

class PoisonSlime extends Slime {
  int _poisonCount = 5; // 독 포자를 살포 가능한 횟수
  final int _poisonCountStandard = 0; // 독 포자를 살포하지 못하는 개수의 기준.
  final int _poisonCountCheck = 1; // 독 포자 살포 시 제거할 카운터 개수.

  PoisonSlime(super.suffix);

  // getter
  int get poisonCount => _poisonCount;

  int get poisonCountStandard => _poisonCountStandard;

  int get poisonCountCheck => _poisonCountCheck;

  // setter
  set poisonCount(int poisonCount) {
    _poisonCount = poisonCount;
  }

  @override
  void attack(Hero hero) {
    // 용사 생사 검증
    if (hero.hp <= 0) {
      print('용사가 이미 죽었습니다. 공격할 수 없습니다.');
      return;
    }

    // 만약 super.attack(hero)을 위 검증보다 먼저 작성하면,
    // 용사의 체력이 0이거나 더 작을 경우에 검증 문구를 두 번 찍는다.
    // 부모 클래스에서 검증 후 리턴하고 나오면서 자식 클래스에서 한 번 더 검증을 실행하기 때문.
    // 때문에 뒤쪽에 적어주는 것이 맞다.
    super.attack(hero); // 부모 클래스의 attack을 먼저 실행 후,

    // 독을 살포할 수 있는 카운터 개수가 최소 기준보다 많으면 추가로 독을 살포
    if (poisonCount > poisonCountStandard) {
      final double poisonDamageStandard = 0.2; // 독 데미지 계산 기준
      final int poisonDamage = (hero.hp * poisonDamageStandard)
          .toInt(); // hero의 hp을 1/5한 결과값에서 소수점 부분을 제외하고 정수형으로 반환한 값

      print('추가로, 독 포자를 살포했다!');

      if (hero.hp - poisonDamage < 0) {
        // hp 잔여량에서 독 데미지를 뺀 값이 0보다 작으면 hp 잔여량을 0으로 보정하고,
        hero.hp = 0;
      } else {
        // 0이거나 0보다 크다면 그대로 잔여량에 반영한다.
        hero.hp -= poisonDamage;
      }

      print('$poisonDamage포인트의 데미지');
      print('용사의 hp는 ${hero.hp}\n');

      poisonCount -= poisonCountCheck; // 독을 살포하면 카운터를 하나 제거한다
    }
  }
}

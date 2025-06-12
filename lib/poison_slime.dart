import 'package:modu_3_dart_study/hero.dart';
import 'package:modu_3_dart_study/slime.dart';

class PoisonSlime extends Slime {
  int _poisonCount = 5;
  final int poisonCountStandard = 0; // 독 포자를 살포하지 못하는 개수의 기준.
  final int poisonCountCheck = 1; // 독 포자 살포 시 제거할 카운터 개수.

  PoisonSlime(super.suffix);

  // getter
  int get poisonCount => _poisonCount;

  // setter
  set poisonCount(int poisonCount) {
    _poisonCount = poisonCount;
  }

  @override
  void attack(Hero hero) {
    super.attack(hero);

    if (poisonCount > poisonCountStandard) {
      final double poisonDamageStandard = 0.2; // 독 데미지 계산 기준
      final int poisonDamage = (hero.hp * poisonDamageStandard).toInt(); // hero의 hp을 1/5한 결과값에서 소수점 부분을 제외하고 정수형으로 반환한 값

      print('추가로, 독 포자를 살포했다!');
      hero.hp -= poisonDamage;
      print('$poisonDamage포인트의 데미지');

      poisonCount -= poisonCountCheck;
    }
  }
}

void main() {
  Hero hero = Hero(name: '이학민', hp: 48);
  PoisonSlime ps = PoisonSlime('탱탱볼');
  ps.attack(hero);
  ps.attack(hero);
  ps.attack(hero);
  ps.attack(hero);
}

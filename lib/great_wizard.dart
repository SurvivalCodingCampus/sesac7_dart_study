import 'package:modu_3_dart_study/hero.dart';
import 'package:modu_3_dart_study/wand.dart';
import 'package:modu_3_dart_study/wizard.dart';

class GreatWizard extends Wizard {
  // GreatWizard 인스턴스 공통 속성
  static const int greatWizMpInit = 150; // 초기 mp량
  static const int greatWizHealMpCost = 5; // GreatWizard의 힐 mp 소모량
  static const int greatWizHealHpIncrease = 25; // GreatWizard의 힐 hp 회복량
  static const int greatWizSuperHealMpCost = 50; // GreatWizard의 슈퍼 힐 mp 소모량

  GreatWizard({required super.name, required super.hp, required super.wand}) {
    super.mp = greatWizMpInit;
  }

  // method
  void superHeal(Hero hero) {
    if (mp < greatWizSuperHealMpCost) {
      print('마나가 부족합니다');
    } else {
      hero.hp = hero.hpMax; // hp 잔여량을 최대치로 보정
      mp -= greatWizSuperHealMpCost;
      print('슈퍼 힐을 시전했습니다. 대상 HP: ${hero.hp}');
    }
  }

  @override
  void heal(Hero hero) {
    if (mp < greatWizHealMpCost) {
      print('마나가 부족합니다');
    } else {
      if (hero.hp + greatWizHealHpIncrease <= hero.hpMax) {
        // 현재 hp 잔여량 + 회복량이 hp 최대치 이하면 잔여량에 그대로 적용하고,
        hero.hp += greatWizHealHpIncrease;
      } else {
        // 최대치를 넘어가면 hp 잔여량을 최대치 값으로 보정.
        hero.hp = hero.hpMax;
      }

      mp -= greatWizHealMpCost;
      print('힐을 시전했습니다. 대상 HP: ${hero.hp}');
    }
  }
}

void main() {
  GreatWizard g = GreatWizard(
    name: 'name',
    hp: 50,
    wand: Wand(name: 'name', power: 0.5),
  );
  Hero h = Hero(name: '홍길동', hp: 50);
  print('법사의 mp는 ${g.mp}');
  print('용사의 hp는 ${h.hp}');

  h.hp -= 45;
  print('용사의 hp는 ${h.hp}');

  g.superHeal(h);
  g.superHeal(h);
  g.heal(h);
  print('법사의 mp는 ${g.mp}');
  print('용사의 hp는 ${h.hp}');
}

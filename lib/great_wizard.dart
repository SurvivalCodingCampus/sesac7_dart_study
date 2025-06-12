import 'package:modu_3_dart_study/wizard.dart';

import 'hero.dart';

class GreatWizard extends Wizard {
  GreatWizard({required super.name, required super.hp, super.mp = 150});

  @override
  void heal(Hero hero) {
    if (super.mp >= 5) {
      hero.hp += 25;
      mp = super.mp - 50;
      print('힐을 시전했습니다. 대상 HP: ${hero.hp}');
    } else {
      print('마나가 부족합니다');
    }
  }

  void superHeal(Hero hero) {
    if (super.mp >= 50) {
      hero.hp = hero.maxHp;
      super.mp -= 50;
      print('슈퍼 힐을 시전했습니다. 대상 HP: ${hero.hp}');
    } else {
      print('마나가 부족합니다');
    }
  }
}

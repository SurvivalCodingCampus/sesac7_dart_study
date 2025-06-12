import 'package:modu_3_dart_study/wizard.dart';

import 'hero.dart';

class GreatWizard extends Wizard {
  int _mp = 150;

  GreatWizard(super.name, {required super.hp});

  int get mp => _mp;

  @override
  void heal(Hero hero) {
    if (_mp < 5) {
      print('마나가 부족합니다.');
    }
    hero.hp = (hero.hp + 25).clamp(0, hero.maxHp);
    _mp -= 5;
    print('힐을 시전했습니다. 대상 HP: ${hero.hp}.');
  }

  void superHeal(Hero hero) {
    if (_mp < 50) {
      print('마나가 부족합니다.');
    }
    hero.hp = hero.maxHp;
    _mp -= 50;
    print('슈퍼 힐을 시전했습니다. 대상 HP: ${hero.hp}.');
  }
}

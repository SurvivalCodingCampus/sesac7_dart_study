import 'dart:math';

import 'package:modu_3_dart_study/character/wizard.dart';

import 'hero.dart';

class GreatWizard extends Wizard {
  final int greatWizardHealHp = 25;
  final int greatWizardHealMpCost = 5;
  final int greatWizardSuperHealMpCost = 50;

  static final int greatWizardDefaultMp = 150;

  GreatWizard({required super.name, required super.hp, super.wand}) {
    wizardMp = greatWizardDefaultMp;
  }

  @override
  void heal(Hero hero) {
    if (wizardMp < greatWizardHealMpCost) {
      print('마나가 부족합니다.');
      return;
    }
    wizardMp -= greatWizardHealMpCost;
    hero.hp = min(hero.hp + greatWizardHealHp, hero.heroMaxHp);
    print('힐을 시전했습니다. 대상 HP: ${hero.hp}');
  }

  void superHeal(Hero hero) {
    if (wizardMp < greatWizardSuperHealMpCost) {
      print('마나가 부족합니다.');
      return;
    }
    wizardMp -= greatWizardSuperHealMpCost;
    hero.hp = hero.heroMaxHp;
    print('슈퍼 힐을 시전했습니다. 대상 HP: ${hero.hp}');
  }
}
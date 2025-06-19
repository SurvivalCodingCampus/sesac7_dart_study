import 'package:modu_3_dart_study/assignments/hero.dart';
import 'package:modu_3_dart_study/assignments/wizard.dart';

class GreatWizard extends Wizard {
  static const int maxMp = 150;
  static const int healCost = 5;
  static const int healAmount = 25;
  static const int superHealCost = 50;

  GreatWizard(
    super.name, {
    required super.hp,
    super.mp = maxMp,
    super.wand,
  });

  @override
  void heal(Hero hero) {
    _heal(
      hero: hero,
      healCost: healCost,
      healAmount: healAmount,
      actionName: '힐',
    );
  }

  void superHeal(Hero hero) {
    _heal(
      hero: hero,
      healCost: superHealCost,
      healAmount: Hero.maxHp - hero.hp,
      actionName: '슈퍼 힐',
    );
  }

  void _heal({
    required Hero hero,
    required int healCost,
    required int healAmount,
    required String actionName,
  }) {
    if (mp < healCost) {
      print('마나가 부족합니다.');
      return;
    }

    hero.increaseHp(healAmount);
    mp -= healCost;
    print('$actionName을 시전했습니다. 대상 HP: ${hero.hp}');
  }
}

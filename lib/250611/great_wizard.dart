import 'package:modu_3_dart_study/250604/hero.dart';
import 'package:modu_3_dart_study/250611/wizard.dart';

class GreatWizard extends Wizard {
  GreatWizard(super.name, super.hp, super.wand, [super.mp = 150]);

  @override
  void heal(Hero hero) {
    if (mp >= 5) {
      mp = mp - 5;
      hero.hp += 25;
      print('힐을 시전했습니다. 대상HP: ${hero.hp}');
    } else {
      print('마나가 부족합니다');
    }
  }

  void superHeal(Hero hero) {
    if (mp >= 50) {
      mp = mp - 50;
      hero.hp = hero.maxHP;
      print('슈퍼힐을 시전했습니다. 대상HP: ${hero.hp}');
    } else {
      print('마나가 부족합니다');
    }
  }
}

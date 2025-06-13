import 'package:modu_3_dart_study/20250611/wizard.dart';

import '../hero.dart';

class GreatWizard extends Wizard {
  GreatWizard(
    super.name, {
    required super.hp,
    super.mp = 150,
    required super.wand,
  });

  @override
  void heal(Hero hero) {
    if (mp >= 5) {
      mp -= 5;
      hero.receivedHeal(25);
      print('${hero.name}에게 힐을 시전했습니다. 대상 HP: ${hero.hp}');
    } else {
      print('마나가 부족합니다');
    }
  }

  void superHeal(Hero hero) {
    if (mp >= 50) {
      mp -= 50;
      hero.receivedHeal(hero.maxHp);
      print('${hero.name}에게 슈퍼 힐을 시전했습니다. 대상 HP: ${hero.hp}');
    } else {
      print('전체회복에 필요한 마나가 부족합니다');
    }
  }
}

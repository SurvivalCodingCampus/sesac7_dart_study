import 'package:modu_3_dart_study/assignments/2025-06-12/wizard.dart';

import '../../hero.dart';

class GreatWizard extends Wizard {

  GreatWizard({required super.name, required super.hp}) : super(mp: 150);

  @override
  void heal(Hero hero) {
    // TODO: implement heal
    if (mp < 5) {
      print('마나(mp)가 부족합니다.');
      throw Exception('마나 부족');
    }
    hero.hp += 25;
    mp -= 5;
  }

  void superHeal(Hero hero) {
    if (mp < 50) {
      print('마나(mp)가 부족합니다.');
      throw Exception('마나 부족');
    }
    hero.hp = hero.maxHp;
    mp -= 50;
    print('슈퍼 힐을 시전했습니다. 대상 HP : ${hero.hp}');
  }
}

void main() {
  GreatWizard greatWizard = GreatWizard(name: 'ads', hp: 12);

  print(greatWizard.mp);
}

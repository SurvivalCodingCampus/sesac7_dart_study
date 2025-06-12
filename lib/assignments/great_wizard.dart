import 'package:modu_3_dart_study/assignments/hero.dart';
import 'package:modu_3_dart_study/assignments/wand.dart';
import 'package:modu_3_dart_study/assignments/wizard.dart';

class GreatWizard extends Wizard {
  //wand required 변경 후 wand 필수
  GreatWizard(super.name, super.hp, {Wand? wand}) : super(mp: 150, wand: wand!);

  @override
  void heal(Hero hero) {
    if (mp < 5) {
      print('마나가 부족합니다');
      return;
    }

    hero.hp += 25;
    mp -= 5;

    print('힐을 시전했습니다. 대상 HP: ${hero.hp}');
  }

  void superHeal(Hero hero) {
    if (mp < 50) {
      print('마나가 부족합니다');
      return;
    }

    mp -= 50;
    hero.hp = hero.maxHp;

    print('슈퍼 힐을 시전했습니다. 대상 HP: ${hero.hp}');
  }
}

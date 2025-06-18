import 'package:modu_3_dart_study/wizard.dart';
import 'hero.dart';

class GreatWizard extends Wizard {
  GreatWizard({required super.name});

  // GreatWizard({required super.name}){ 이후에 작성 가능 ex.if(){}};

  static int defaultMP = 150;
  static int needMP = 50;

  @override
  int mp = defaultMP;

  @override
  void heal(Hero hero) {
    if (mp < 5) {
      print('마나가 부족합니다');
      throw Exception('마나가 부족합니다');
    }

    // else 대신 if 에서 return
    hero.hp += 25;
    mp -= 5;
    print('힐을 시전했습니다. 대상 HP: ${hero.hp}');
  }

  void superHeal(Hero hero) {
    if (mp < needMP) {
      print('마나가 부족합니다');
      throw Exception('마나가 부족합니다');
    }

    // else 대신 if 에서 return
    hero.hp = Hero.defaultHp;
    mp -= needMP;
    print('슈퍼 힐을 시전했습니다. 대상 HP: ${hero.hp}');
  }
}

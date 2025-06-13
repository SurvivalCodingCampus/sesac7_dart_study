import 'package:modu_3_dart_study/assignments/2025-06-12/wand.dart';
import 'package:modu_3_dart_study/assignments/2025-06-12/hero.dart';

class Wizard {
  static const int defaultWizardMP = 100;
  String _name;
  int _hp;
  int _mp;
  Wand? _wand;
  final int healManaCost = 10;
  final int healAmount = 20;

  Wizard(this._name, {required int hp, Wand? wand, int mp = defaultWizardMP})
    : _hp = hp,
      _wand = wand,
      _mp = mp;
  String get name => _name;
  int get hp => _hp;
  int get mp => _mp;
  Wand? get wand => _wand;

  set name(String newName) {
    if (newName.length < 3) {
      throw Exception('Wizard name cannot be shorter than three characters.');
    }

    _name = newName;
  }

  set hp(int newHP) {
    if (newHP < 0) {
      _hp = 0;
    } else {
      _hp = newHP;
    }
  }

  set mp(int newMP) {
    if (newMP < 0) {
      _mp = 0;
    } else {
      _mp = newMP;
    }
  }

  set wand(Wand? newWand) {
    if (newWand == null) {
      throw Exception('Wizard wand cannot be set to null.');
    }

    _wand = newWand;
  }

  /*
  void heal(Hero hero) : hp를 20 회복시키고 자신의 mp를 10 소모
  mp가 부족하면 "마나가 부족합니다" 출력
  힐을 성공하면 "힐을 시전했습니다. 대상 HP: ${hero.hp}" 출력
  */
  void heal(Hero hero) {
    if (mp < healManaCost) {
      print(
        'Wizard \'$name\' does not have enough mp($healManaCost) to cast Heal',
      );
      return;
    } else {
      mp -= healManaCost;
      hero.hp += healAmount;
      print('Wizard \'$name\' cast Heal on \'${hero.name}\'.');
      print('Current target HP: ${hero.hp}.');
    }
  }
}

/*
GreatWizard 클래스 요구사항:
Wizard 클래스를 상속받음
속성:
  mp가 150으로 증가
메서드:
  void heal(Hero hero) 재정의 :  hp를 25 회복시키고 자신의 mp를 5 소모
  void superHeal(Hero hero) : hp를 전부 회복시키고 자신의 mp를 50 소모
  mp가 부족하면 "마나가 부족합니다" 출력
  힐을 성공하면 "슈퍼 힐을 시전했습니다. 대상 HP: ${hero.hp}" 출력

*/
class GreatWizard extends Wizard {
  static const int defaultGreatWizardMP = 150;
  @override
  final int healManaCost = 5;
  @override
  final int healAmount = 25;
  final int superHealManaCost = 50;

  GreatWizard(super.name, {required super.hp, super.mp = defaultGreatWizardMP});

  void superHeal(Hero hero) {
    if (mp < superHealManaCost) {
      print(
        'Wizard \'$name\' does not have enough mp($superHealManaCost) to cast Superheal',
      );
      return;
    }
    mp -= superHealManaCost;
    hero.hp = hero.maxHP;
    print('Wizard \'$name\' cast Superheal on \'${hero.name}\'.');
    print('Current target HP: ${hero.hp}.');
  }
}

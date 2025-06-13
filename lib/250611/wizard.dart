import 'package:modu_3_dart_study/250611/wand.dart';
import 'package:modu_3_dart_study/250604/hero.dart';
import 'package:modu_3_dart_study/250611/great_wizard.dart';

class Wizard {
  String _name;
  int _hp;
  int _mp;
  Wand? _wand;

  //마법사 이름은 널일 수 없고, 반드시 3문자이상
  set name(String value) {
    if (value.length < 3) {
      throw Exception('이름은 3문자이상');
    } else {
      _name = value;
    }
  }

  //음수대신 0으로
  set hp(int value) {
    if (value < 0) {
      _hp = 0;
    } else {
      _hp = value;
    }
  }

  //0이상이어야함
  set mp(int value) {
    if (value < 0) {
      throw Exception('mp는 0이상이어야한다');
    } else {
      _mp = value;
    }
  }

  int get mp {
    return _mp;
  }

  //null이면 안됨
  set wand(Wand? value) {
    if (value == null) {
      throw Exception('지팡이는 널일 수 없다');
    } else {
      _wand = value;
    }
  }

  Wizard(this._name, this._hp, this._wand, [int mp = 100]) : _mp = mp {
    //마법사 이름은 널일 수 없고, 반드시 3문자이상
    name = _name;

    //음수대신 0으로
    hp = _hp;

    //0이상이어야함
    mp = _mp;

    //null이면 안됨
    wand = _wand;
  }

  void heal(Hero hero) {
    if (mp >= 10) {
      mp = mp - 10;
      hero.hp += 20;
      print('힐을 시전했습니다. 대상HP: ${hero.hp}');
    } else {
      print('마나가 부족합니다');
    }
  }
}

void main() {
  Hero hero = Hero('hero', 100);
  Wand wand = Wand(name: 'wand', power: 50);
  Wizard wizard = Wizard('wizard', 100, wand);
  GreatWizard greatWizard = GreatWizard('greatWizard', 100, wand);

  wizard.heal(hero);
  wizard.heal(hero);
  wizard.heal(hero);
  wizard.heal(hero);
  wizard.heal(hero);
  wizard.heal(hero);
  wizard.heal(hero);
  wizard.heal(hero);

  greatWizard.superHeal(hero);
  greatWizard.superHeal(hero);
  greatWizard.superHeal(hero);
  greatWizard.superHeal(hero);
  greatWizard.superHeal(hero);
  greatWizard.superHeal(hero);
  greatWizard.superHeal(hero);
  greatWizard.superHeal(hero);
}

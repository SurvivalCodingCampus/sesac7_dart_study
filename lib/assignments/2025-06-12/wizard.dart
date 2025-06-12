import '../../hero.dart';
import '../2025-06-11/wand.dart';
import 'great_wizard.dart';

class Wizard {
  String _name;
  int _hp;
  int _mp;
  Wand? _wand;

  ///Wand는 null허용을 하기 위해 만들었는데, 예외처리할때는 그냥 null체크를 통해 예외 터뜨리는 작업 우겨넣음.(문제를 위한 문제)

  Wizard({required String name, required int hp, int? mp, Wand? wand})
    : _name = name,
      _hp = hp,
      _mp = 100,
      _wand = wand;

  // Wizard(this._name, this._hp, this._mp, {Wand? wand}) : _wand = wand;

  String get name => _name;

  int get hp => _hp;

  int get mp => _mp;

  Wand? get wand => _wand;

  set name(String value) {
    if (value.length < 3) {
      throw Exception('마법사의 이름은 3글자 이상이어야 합니다.');
    }
    _name = value;
  }

  set mp(int value) {
    if (value < 0) {
      throw Exception('마법사의 MP는 0이상이어야 합니다.');
    }
    _mp = value;
  }

  set hp(int value) {
    if (value < 0) {
      _hp = 0;
      return;
    }
    _hp = value;
  }

  set wand(Wand? wand) {
    if (wand == null) {
      throw Exception('마법사가 생성된 이후에는 지팡이를 null로 설정할 수 없습니다.');
    }
    _wand = wand;
  }

  void heal(Hero hero) {
    if (mp < 10) {
      print('mp(마나)가 부족합니다.');
      throw Exception('마나 부족');
    }
    mp -= 10;
    hero.hp += 20;
    print('힐을 시전했습니다. 대상 HP: ${hero.hp}');
  }
}

void main() {
  Hero hero = Hero(name: '임찬규', hp: 10);
  Wizard wizard = Wizard(name: '켈리', hp: 20);

  ///wizard mp값 100 초기화 되는지 확인.

  print(wizard.mp);

  ///힐 양 = 20. 초기 hp = 10 -> 30.
  wizard.heal(hero);

  ///힐 이후에 wizard의 mp는 90.
  ///힐 이후에 hero의 hp는 30.
  print('wizard의 mp : ${wizard.mp}'); //90
  print('hero의 hp : ${hero.hp}'); //30

  GreatWizard greatWizard = GreatWizard(name: 'asd', hp: 30);
  print('greatWizard의 이름 : ${greatWizard.name}'); //asd
  print('greatWizard의 hp : ${greatWizard.hp}'); //30
  print('greatWizard의 mp : ${greatWizard.mp}'); //150

  ///superHeal시전하면 greatWizard의 mp는 50이 달고, hero의 체력은 maxHp인 100이된다.
  greatWizard.superHeal(hero);

  print('superHeal 이후 greatWizard의 mp : ${greatWizard.mp}');

  ///150-50 => 100
  print('superHeal 이후 hero의 hp : ${hero.hp}');

  ///100
}

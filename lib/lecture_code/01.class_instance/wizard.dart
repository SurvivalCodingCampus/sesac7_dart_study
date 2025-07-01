import 'hero.dart';

class Wand {
  String _name;
  double _power;

  Wand({required String name, required double power})
    : _name = name,
      _power = power;

  String get getName => _name;

  double get getPower => _power;

  set setName(String? name) {
    String checkName = checkNullAndLength(name);
    _name = checkName;
  }

  //지팡이의 마력은 0.5 이상 100.0 이하여야 한다.
  set setPower(double power) {
    if (power < 0.5 || power > 100.0) {
      throw Exception('지팡이의 마력은 0.5 이상 100.0 이하여야 합니다.');
    }
    _power = power;
  }
}

class Wizard {
  final int useWizardMpValue = 5; //private으로 작성하는것이 Default임.
  final int useGreatWizardMpValue = 50;
  final int useGreatWizardMaxMpValue = 50;
  final int recoverHeroHpValue = 20;
  final int recoverGreatHeroHpValue = 25;
  final int useGreatWizardMaxMp = 150;
  static const int a = 100;

  String name;
  int _hp;
  int _mp;

  int get mp => _mp;

  set mp(int value) => _mp = value;

  Wand? wand;

  Wizard({required this.name, required int hp, required this.wand}) : _mp = a, _hp = hp;

  set setName(String? name) {
    String checkName = checkNullAndLength(name);
    this.name = checkName;
  }

  // 마법사의 MP는 0 이상이어야 한다.
  set setMp(int mp) {
    if (mp < 0) throw Exception('마법사의 MP는 0 이상이어야 합니다.');
    this.mp = mp;
  }

  // HP가 음수가 되는 상황에서는 대신 0을 설정 되도록 한다
  set setHp(int hp) {
    if (hp < 0) {
      _hp = 0;
      return;
    }
    _hp = hp;
  }

  int get getHp => _hp;

  set setWand(Wand? wand) {
    if (wand == null) throw Exception('마법사가 생성된 이후에는 지팡이를 null 로 설정할 수 없습니다.');
    this.wand = wand;
  }

  //메서드:
  //- void heal(Hero hero) : hp를 20 회복시키고 자신의 mp를 10 소모
  //- mp가 부족하면 "마나가 부족합니다" 출력
  //- 힐을 성공하면 "힐을 시전했습니다. 대상 HP: ${hero.hp}" 출력
  void heal(Hero hero) {
    if (mp <= 9) {
      print('마나가 부족합니다');
      return;
    } else {
      mp -= 10;
      hero.hp += recoverHeroHpValue;
      print('힐을 시전했습니다. 대상 HP: ${hero.hp}');
    }
  }
}

//05. GreatWizard 작성
//GreatWizard 클래스 요구사항:
//- Wizard 클래스를 상속받음
class GreatWizard extends Wizard {
  //속성:
  //- mp가 150으로 증가
  int greatWizardLimit = 150;

  GreatWizard({required super.name, required super.hp, required super.wand}) {
    super.mp = greatWizardLimit;
  }

  //- void heal(Hero hero) 재정의 :  hp를 25 회복시키고 자신의 mp를 5 소모
  @override
  void heal(Hero hero) {
    //- mp가 부족하면 "마나가 부족합니다" 출력
    if (mp < 5) {
      print('마나가 부족합니다');
      return;
    } else {
      //- void heal(Hero hero) 재정의 :  hp를 25 회복시키고 자신의 mp를 5 소모
      mp -= useWizardMpValue;
      hero.hp += recoverHeroHpValue;
      print('힐을 시전했습니다. 대상 HP: ${hero.hp}');
    }
  }

  //- void superHeal(Hero hero) : hp를 전부 회복시키고 자신의 mp를 50 소모
  void superHeal(Hero hero) {
    //- mp가 부족하면 "마나가 부족합니다" 출력
    if (mp < 50) {
      print('마나가 부족합니다');
      return;
    } else {
      mp -= useGreatWizardMaxMpValue;
      hero.hp = 100; // coderabbit
      //- 힐을 성공하면 "슈퍼 힐을 시전했습니다. 대상 HP: ${hero.hp}" 출력
      print('슈퍼 힐을 시전했습니다. 대상 HP: ${hero.hp}');
    }
  }
}

// 마법사나 지팡이의 이름은 null 일 수 없고, 반드시 3문자 이상이어야 한다
String checkNullAndLength(String? name) {
  if (name == null) {
    throw Exception('이름은 null 일 수 없습니다.');
  } else if (name.length < 3) {
    throw Exception('이름은 반드시 3문자 이상이어야 합니다.');
  }
  return name;
}

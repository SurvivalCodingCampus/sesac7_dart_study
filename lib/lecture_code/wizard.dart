/*
01. 다음 2개의 클래스 “Wizard (마법사)”, “Wand (지팡이)” 를 작성하시오. 마법사는 지팡이를 들 수 있습니다.
    작성한 Wand 클래스와 Wizard 클래스에 대해, 아래의 규칙에 따라 타당성 검사를 추가하시오.
    부정한 값이 설정 될 경우에는 “Exception(“에러메세지");” 를 작성하여 프로그램을 중단 시킵니다.
   - 마법사나 지팡이의 이름은 null 일 수 없고, 반드시 3문자 이상이어야 한다
   - 지팡이의 마력은 0.5 이상 100.0 이하여야 한다.
   - 마법사가 생성된 이후에는 지팡이를 null 로 설정할 수 없다.
   - 마법사의 MP는 0 이상이어야 한다.
   - HP가 음수가 되는 상황에서는 대신 0을 설정 되도록 한다
*/

/*
04. Wizard 수정
  속성:
    - mp: Int (초기값 100)
  메서드:
    - void heal(Hero hero) : hp를 20 회복시키고 자신의 mp를 10 소모
    - mp가 부족하면 "마나가 부족합니다" 출력
    - 힐을 성공하면 "힐을 시전했습니다. 대상 HP: ${hero.hp}" 출력

05. GreatWizard 작성
  GreatWizard 클래스 요구사항:
    - Wizard 클래스를 상속받음
  속성:
    - mp가 150으로 증가
  메서드:
    - void heal(Hero hero) 재정의 :  hp를 25 회복시키고 자신의 mp를 5 소모
    - void superHeal(Hero hero) : hp를 전부 회복시키고 자신의 mp를 50 소모
    - mp가 부족하면 "마나가 부족합니다" 출력
    - 힐을 성공하면 "슈퍼 힐을 시전했습니다. 대상 HP: ${hero.hp}" 출력
 */
import 'package:modu_3_dart_study/lecture_code/hero.dart';

class Wand {
  String name;
  double power;

  Wand({required this.name, required this.power});

  String get getName {
    return name;
  }

  set setName(String? name) {
    String checkName = checkNullAndLength(name);
    this.name = checkName;
  }

  //지팡이의 마력은 0.5 이상 100.0 이하여야 한다.
  set setPower(double power) {
    if (power < 0.5 || power > 100.0) {
      throw Exception('지팡이의 마력은 0.5 이상 100.0 이하여야 합니다.');
    }
    this.power = power;
  }
}

class Wizard {
  String name;
  int hp;

  //연습문제 4
  //속성:
  //- mp: Int (초기값 100)
  int _mp;
  final int useWizardMpValue = 5; //private으로 작성하는것이 Default임.
  final int useGreatWizardMpValue = 50;
  final int useGreatWizardMaxMpValue = 50;
  final int recoverHeroHpValue = 20;
  final int recoverGreatHeroHpValue = 25;
  final int useGreatWizardMaxMp = 150;

  int get mp => _mp;

  set mp(int value) {
    _mp = value;
  }

  Wand? wand;

  Wizard({required this.name, required this.hp, required this.wand})
    : _mp = 100;


  set setName(String? name) {
    String checkName = checkNullAndLength(name);
    this.name = checkName;
  }

  // 마법사의 MP는 0 이상이어야 한다.
  set setMp(int mp) {
    if (mp < 0) {
      throw Exception('마법사의 MP는 0 이상이어야 합니다.');
    }
    this.mp = mp;
  }

  // HP가 음수가 되는 상황에서는 대신 0을 설정 되도록 한다
  set setHp(int hp) {
    if (hp < 0) {
      this.hp = 0;
    } else {
      this.hp = hp;
    }
  }

  int get getHp => hp;

  set setWand(Wand? wand) {
    if (wand == null) {
      throw Exception('마법사가 생성된 이후에는 지팡이를 null 로 설정할 수 없습니다.');
    }
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

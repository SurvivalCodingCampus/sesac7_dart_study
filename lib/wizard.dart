import 'wand.dart';
import 'hero.dart';

class Wizard {
  String _name;
  int _hp;
  int _mp;
  Wand? _wand;

  // Wizard 인스턴스 공통 속성
  static const int healMpCost = 10; // heal 사용 시 mp 소모량
  static const int healHpIncrease = 20; // heal 사용 시 hp 회복량
  static const int nameLengthStandard = 3; // 이름 길이 한도
  static const int lowHpStandard = 0; // hp 하한선
  static const int lowMpStandard = 0; // mp 하한선
  static const int mpInit = 100; // 초기 mp량

  Wizard({required String name, required int hp, required Wand? wand})
    : _name = name,
      _hp = hp,
      _mp = mpInit,
      _wand = wand;

  // getter
  String get name => _name;

  int get hp => _hp;

  int get mp => _mp;

  Wand? get wand => _wand;

  // setter
  set name(String name) {
    if (name.length < nameLengthStandard) {
      throw Exception('마법사의 이름이 너무 짧습니다. 이름은 3문자 이상으로 설정되어야합니다.');
    }

    // 마법사 이름(_name)은 null을 허용하지 않는 String 타입이므로 조건문 생략
    _name = name;
  }

  set hp(int hp) {
    if (hp < lowHpStandard) {
      print('음수값이 입력되었습니다. $lowHpStandard으로 설정합니다.');
      _hp = 0;
    } else {
      _hp = hp;
    }
  }

  set mp(int mp) {
    if (mp < lowMpStandard) {
      throw Exception('마법사의 MP는 $lowMpStandard 이상으로 설정되어야합니다.');
    }

    _mp = mp;
  }

  set wand(Wand? wand) {
    if (wand == null) {
      throw Exception('마법사가 생성된 이후에는 지팡이의 정보를 null로 설정할 수 없습니다.');
    }

    _wand = wand;
  }

  // method
  void heal(Hero hero) {
    if (mp < healMpCost) {
      print('마나가 부족합니다');
    } else {
      if (hero.hp + healHpIncrease <= hero.hpMax) {
        // 현재 hp 잔여량 + 회복량이 hp 최대치 이하면 잔여량에 그대로 적용하고,
        hero.hp += healHpIncrease;
      } else {
        // 최대치를 넘어가면 hp 잔여량을 최대치 값으로 보정.
        hero.hp = hero.hpMax;
      }

      mp -= healMpCost;
      print('힐을 시전했습니다. 대상 HP: ${hero.hp}');
    }
  }
}

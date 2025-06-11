import 'package:modu_3_dart_study/wand.dart';

class Wizard {
  String _name;
  int _hp;
  int _mp;
  Wand? _wand;

  final int _wizardNameLimit = 3;
  final int _wizardMinMpLimit = 0;

  Wizard({required String name, required int hp, required int mp, Wand? wand}): _name = name, _hp = hp, _mp = mp;

  String get wizardName => _name;
  set wizardName(String value) => {
    if (value.length < _wizardNameLimit) {
      throw Exception('wizardName은 $_wizardNameLimit문자 이상이어야 합니다.')
    } else {
      _name = value
    }
  };

  int get wizardHp => _hp;
  set wizardHp(int value) => {
    if (value < 0) { // hp set value 값이 음수인 경우
      _hp = 0 // 음수 대신 0 으로 저장
    } else {
      _hp = value
    }
  };

  int get wizardMp => _mp;
  set wizardMp(int value) => {
    if (value < _wizardMinMpLimit) {
      throw Exception('WizardMp 값은 항상 $_wizardMinMpLimit 이상이어야 합니다')
    } else {
      _mp = value
    }
  };

  /*
  * _wand property가 nullable하게 타입이 지정되어 있고
  * setter에서 notNull로 설정하면 getter의 return type을 nullable하게 할 수 없다.
  */
  Wand? get wand => _wand;
  set wand(Wand? value) => {
    if (wand == null) {
      throw Exception('Wizard 생성 후 wand value를 null로 설정할 수 없습니다.')
    } else {
      _wand = value
    }
  };
}

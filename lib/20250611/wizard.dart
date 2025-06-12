import 'package:modu_3_dart_study/20250611/wand.dart';

/*
마법사나 지팡이의 이름은 null 일 수 없고, 반드시 3문자 이상이어야 한다
지팡이의 마력은 0.5 이상 100.0 이하여야 한다.
마법사가 생성된 이후에는 지팡이를 null 로 설정할 수 없다.
마법사의 MP는 0 이상이어야 한다.
HP가 음수가 되는 상황에서는 대신 0을 설정 되도록 한다
 */

class Wizard {
  String _name;
  int _hp;
  int _mp;
  Wand? _wand;

  // HP
  int get hp => _hp >= 0 ? _hp : 0;
  set hp(int value) => _hp = value >= 0 ? value : 0;

  // MP
  int get mp => _mp >= 0 ? _mp : 0;
  set mp(int value) {
    if (value < 0) {
      throw Exception('마법사 MP는 0이상이어야 합니다.');
    }

    _mp = value;
  }

  // 이름
  String get name {
    if(_name.length < 3) {
      throw Exception('마법사 이름은 3자 이상이어야 합니다.');
    }

    return _name;
  }

  set name(String value) {
    if(value.length < 3) {
      throw Exception('마법사 이름은 3자 이상이어야 합니다.');
    }

    _name = value;
  }

  // 지팡이
  Wand? get wand {

    if (_wand == null) {
      throw Exception("지팡이는 null이 될 수 없습니다.");
    }

    return _wand;
  }

  set wand(Wand? value) {
    if (value == null) {
      throw Exception("지팡이는 null로 셋팅될 수 없습니다.");
    }

    _wand = value;
  }

  Wizard(this._name, {required int hp, required int mp, required Wand wand}) : _hp = hp, _mp = mp, _wand = wand;

}
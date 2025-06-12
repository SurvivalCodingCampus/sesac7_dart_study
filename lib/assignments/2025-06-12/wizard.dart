import 'package:modu_3_dart_study/assignments/2025-06-11/wand.dart';

// 작성한 Wand 클래스와 Wizard 클래스에 대해, 아래의 규칙에 따라 타당성 검사를 추가하시오.
// 부정한 값이 설정 될 경우에는 “Exception(“에러메세지");” 를 작성하여 프로그램을 중단 시킵니다.
// 마법사나 지팡이의 이름은 null 일 수 없고, 반드시 3문자 이상이어야 한다
// 지팡이의 마력은 0.5 이상 100.0 이하여야 한다.
// 마법사가 생성된 이후에는 지팡이를 null 로 설정할 수 없다.
// 마법사의 MP는 0 이상이어야 한다.
// HP가 음수가 되는 상황에서는 대신 0을 설정 되도록 한다

class Wizard {
  // String _name;
  // int _hp;
  // int _mp;
  // Wand? _wand;
  //
  // Wizard({
  //   required String name,
  //   required int hp,
  //   required int mp,
  //   required Wand wand,
  // })
  //     : _name = name,
  //       _hp = hp,
  //       _mp = mp,
  //       _wand = wand;

  String _name;
  int _hp;
  int _mp;
  Wand? _wand;

  ///Wand는 null허용을 하기 위해 만들었는데, 예외처리할때는 그냥 null체크를 통해 예외 터뜨리는 작업 우겨넣음.(문제를 위한 문제)

  Wizard({required String name, required int mp, required int hp, Wand? wand})
    : _name = name,
      _hp = hp,
      _mp = mp,
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
}

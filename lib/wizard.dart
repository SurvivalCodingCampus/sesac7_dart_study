import 'package:modu_3_dart_study/wand.dart';

class Wizard {
  String _name;
  int _hp;
  int _mp;
  Wand? _wand;

  Wizard(this._name, this._hp, this._mp, this._wand);

  String get name => _name;

  int get hp => _hp;

  int get mp => _mp;

  Wand? get wand => _wand;

  set name(String? value) {
    if (value == null) {
      throw Exception('에러메세지');
    } else if (value.length < 3) {
      throw Exception('에러메세지');
    }
    _name = value;
  }

  set wand(Wand? value) {
    if (value == null) {
      throw Exception('에러메세지');
    }
    _wand = value;
  }

  set mp(int? value) {
    if (value == null) {
      throw Exception('에러메세지');
    } else if (value < 0) {
      throw Exception('에러메세지');
    }
    _mp = value;
  }

  set hp(int? value) {
    if (value == null) {
      throw Exception('에러메세지');
    } else if (value < 0) {
      _hp = 0;
    }
    _hp = value;
  }
}

import 'package:modu_3_dart_study/assignments/2025-06-11/wand.dart';

class Wizard {
  String _name;
  int _hp;
  Wand? _wand;

  Wizard(this._name, this._hp, {Wand? wand}) : _wand = wand;

  String get name => _name;
  int get hp => _hp;
  Wand? get wand => _wand;

  set name(String newName) {
    if (newName.length < 3) {
      throw Exception('Wizard name must be longer than three characters.');
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

  set wand(Wand? newWand) {
    if (newWand == null) {
      throw Exception('Wizard wand cannot be set to null.');
    }

    _wand = newWand;
  }
}

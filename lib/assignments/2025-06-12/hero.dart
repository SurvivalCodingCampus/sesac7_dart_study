import 'package:modu_3_dart_study/assignments/2025-06-12/slime.dart';

class Hero {
  final String name;
  final int _maxHP;
  int _hp;

  Hero(this.name, {required int hp}) : _hp = hp, _maxHP = hp;

  int get hp => _hp;
  int get maxHP => _maxHP;

  set hp(int value) {
    if (value < 0) {
      _hp = 0;
    } else if (value > _maxHP) {
      _hp = _maxHP;
    } else {
      _hp = value;
    }
  }

  void attack(Slime slime) {
    print('$name attacked $slime.');
  }

  void run() {
    print('$name ran.');
  }
}

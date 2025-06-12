import 'package:modu_3_dart_study/assignments/2025-06-12/slime.dart';

class Hero {
  final String name;
  int _hp;

  Hero(this.name, {required int hp}) : _hp = hp;

  int get hp => _hp;

  set hp(int value) {
    if (value < 0) {
      _hp = 0;
    } else {
      _hp = value;
    }
  }

  void attack(Slime slime) {
    print('$name이 $slime을 공격했다.');
  }

  void run() {
    print('$name이 도망쳤다.');
  }
}

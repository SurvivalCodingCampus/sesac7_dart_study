import 'package:modu_3_dart_study/assignments/2025-06-12/slime.dart';

class Hero {
  String name;
  int hp;

  Hero(this.name, this.hp);

  void attack(Slime slime) {
    print('${name}이 ${slime}을 공격했다.');
  }

  void run() {
    print('${name}이 도망쳤다.');
  }
}

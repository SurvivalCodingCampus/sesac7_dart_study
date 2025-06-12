import 'package:modu_3_dart_study/assignments/slime.dart';

class Hero {
  String name;
  int hp;
  int maxHp;

  Hero(this.name, this.hp, this.maxHp);

  void attack(Slime slime) {
    print('${name}이 ${slime}을 공격했다.');
  }
}

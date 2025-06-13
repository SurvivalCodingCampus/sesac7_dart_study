import 'package:modu_3_dart_study/monster/slime.dart';

class Hero {
  String name;
  int hp;
  int heroMaxHp; // heroMaxHp 값을 변수로 두어서 유동적으로 바뀌게 한다.(방어구 장착, 스텟으로 인한 증가를 대비..)

  Hero({required this.name, required this.hp}): heroMaxHp = hp; // 여기서는 this.hp가 아님

  void attack(Slime slime) {
    print('$name이 $slime을 공격했다.');
    slime.hp -= 10;
  }

  void run() {
    print('$name이 도망쳤다.');
  }
}

import 'dart:math';

class Cleric {
  String name;
  int hp = 50;
  final int max_hp = 50;
  int mp = 10;
  final int max_mp = 10;

  Cleric(this.name);

  void selfAid(){
    mp-=5;
    hp = max_hp;
  }

}

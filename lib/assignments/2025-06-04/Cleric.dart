
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

  int pray(int second){
    int beforeMp = mp;
    int heal = second + Random().nextInt(3); //회복량

    if(beforeMp + heal >= max_mp){
      mp = max_mp;
      return max_mp - beforeMp;
    }else{
      mp+=heal;
      return mp - beforeMp;
    }
  }

}

import 'dart:math';

class Cleric {
  String name;

  static final int maxHp = 50;
  static final int maxMp = 10;
  int hp;
  int mp;

  Cleric(this.name, {int? hp, int? mp}) : hp = hp ?? maxHp, mp = mp ?? maxMp;

  // static const int maxHp = 50;
  // static const int maxMp = 10;
  // int hp = 50;
  // int mp = 50;
  //
  // Cleric(this.name, {this.hp = maxHp, this.mp = maxMp});

  void selfAid() {
    print('회복 이전 hp : $hp');
    if (mp < 5) {
      print('mp가 부족합니다.');
      return;
    }
    mp -= 5;
    hp = maxHp;
    print('현재 mp : $mp , 회복 이후 hp : $hp');
  }

  int pray(int second) {
    //이미 최대 mp면 0 리턴.
    if (mp == maxMp) {
      return 0;
    }

    int beforeMp = mp;
    int heal = second + Random().nextInt(3); //회복량

    int actualHeal = (beforeMp + heal > maxMp) ? maxMp - beforeMp : heal;
    mp = beforeMp + actualHeal;
    print('회복 이후 mp : $mp , 회복량 : $actualHeal');
    return actualHeal;
  }
}

void main() {
  Cleric cleric1 = Cleric('아서스', hp: 30, mp: 3);
  Cleric cleric2 = Cleric('아서스2', hp: 35);
  Cleric cleric3 = Cleric('아서스3');
  print(cleric1.name);
  print(cleric1.hp);
  print(cleric1.mp);
  print(cleric2.name);
  print(cleric2.hp);
  print(cleric2.mp);
  print(cleric3.name);
  print(cleric3.hp);
  print(cleric3.mp);
}

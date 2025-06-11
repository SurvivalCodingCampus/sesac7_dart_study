import 'dart:math';

class Cleric {
  String name;
  int hp = 50;
  final int maxHp = 50;
  int mp = 10;
  final int maxMp = 10;

  Cleric(this.name);

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

import 'dart:math';

class Cleric {
  String name;

  int hp = 50;
  int mp = 10;

  static const int maxHP = 50;
  static const int maxMP = 10;

  Cleric(this.name, {this.hp = maxHP, this.mp = maxMP});

  void selfAid() {
    if (mp < 5) {
      print('$name does not have enough MP to cast Self Aid.');
      return;
    }

    mp -= 5;
    hp = maxHP;

    print('$name casts Self Aid! HP restored to $hp.');
    print('hp: $hp, mp: $mp');
  }

  int pray(int praySeconds) {
    //기도시간이 0이면 패스
    if (praySeconds <= 0) {
      print("If praySeconds is 0 then not work");
      return 0;
    }

    int initialMP = mp;

    Random random = Random();
    int randomNumber = random.nextInt(3); //0~2

    //최대 MP보다 클 순 없다.
    mp = min(mp + praySeconds + randomNumber, Cleric.maxMP);

    int recoveredMP = mp - initialMP;

    print("recovered mp is $recoveredMP");

    return recoveredMP;
  }
}

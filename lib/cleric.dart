import 'dart:math';

class Cleric {
  String name;
  int hp = maxHp;
  static const int maxHp = 50;
  int mp = maxMp;
  static const int maxMp = 10;

  Cleric(this.name);

  void selfAid() {
    if (mp >= 5) {
      mp -= 5;
      hp = maxHp;
    } else {
      print('mp 소모 불가능');
    }
  }

  int pray(int time) {
    int healAmount = time + Random().nextInt(2);
    int availableSpace = maxMp - mp;
    int actualHeal = availableSpace > healAmount ? healAmount : availableSpace;

    mp += actualHeal;
    return actualHeal;
  }
}
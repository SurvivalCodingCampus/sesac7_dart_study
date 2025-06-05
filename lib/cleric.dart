import 'dart:math';

class Cleric {
  static int maxHp = 50;
  static int maxMp = 10;

  String name;
  int hp = maxHp;
  int mp = maxMp;

  final selfAidUseMp = 5;

  Cleric(this.name);

  void selfAid() {
    if (mp < selfAidUseMp) {
      print('mp 부족');
      return;
    }
    mp -= selfAidUseMp;
    hp = maxHp;
  }

  int pray(int time) {
    int healAmount = time + Random().nextInt(3);
    int availableSpace = maxMp - mp;
    int actualHeal = availableSpace > healAmount ? healAmount : availableSpace;

    mp += actualHeal;
    return actualHeal;
  }
}
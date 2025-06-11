import 'dart:math';

class Cleric {
  static const int maxHp = 50;
  static const int maxMp = 10;

  String name;
  int hp;
  int mp;

  final _selfAidUseMp = 5;
  final _randomHealRange = 3;

  Cleric(this.name, {this.hp = Cleric.maxHp, this.mp = Cleric.maxMp});

  void selfAid() {
    if (mp < _selfAidUseMp) {
      print('mp 부족');
      return;
    }
    mp -= _selfAidUseMp;
    hp = maxHp;
  }

  int pray(int time) {
    final int healAmount = time + Random().nextInt(_randomHealRange);
    final int availableSpace = maxMp - mp;
    final int actualHeal = availableSpace > healAmount ? healAmount : availableSpace;

    mp += actualHeal;
    return actualHeal;
  }
}

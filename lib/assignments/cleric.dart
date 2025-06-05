import 'dart:math';

class Cleric {
  String name;
  int hp;
  int mp;
  static const int maxHp = 50;
  static const int maxMp = 10;

  Cleric(this.name, {this.hp = maxHp, this.mp = maxMp});

  void selfAid() {
    if (mp >= 5) {
      mp -= 5;
      hp = maxHp;
    } else {
      print('selfAid 사용에 필요한 mp가 부족합니다');
    }
  }

  int pray({required int prayTime}) {
    // 회복할 수 없는 경우
    if (mp == maxMp) return 0;

    int totalHealAmount = 0; // 총 회복량

    for (int i = 0; i <= prayTime; i++) {
      if (mp < maxMp) {
        int healAmount = mp < 9 ? Random().nextInt(2) + 1 : 1;
        totalHealAmount += healAmount;

        mp += healAmount;

        print('mp 회복량 : $healAmount');
        print('현재 mp량 : $mp');
      }
    }

    return totalHealAmount;
  }
}

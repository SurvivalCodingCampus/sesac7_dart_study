import 'dart:math';

class Cleric {
  static const int maxHp = 50;
  static const int maxMp = 10;

  String name;
  int hp;
  int mp;

  Cleric(this.name, {this.hp = maxHp, this.mp = maxMp});

  void selfAid() {
    if (mp >= 5) {
      mp -= 5;
      hp = maxHp;
    }
  }

  int pray(int time) {
    // 기도 시간 유효성 검사 및 MP가 최대가 아닌 경우만 허용
    if (time <= 0 || mp >= maxMp) {
      return 0;
    }
    int previousMp = mp;
    // 회복 보정 0 ~ 2
    mp += time + Random().nextInt(3);
    // maxMp 초과 회복 불가
    if (mp > maxMp) {
      mp = maxMp;
    }
    return mp - previousMp;
  }
}

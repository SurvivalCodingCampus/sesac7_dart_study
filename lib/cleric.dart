import 'dart:math';

class Cleric {
  String name;
  int hp;
  final int maxHp = 50;
  int mp;
  final int maxMp = 10;

  Cleric(this.name, this.hp, this.mp) {
    if (hp <= 0) {
      hp = 1;
    }
    if (hp > maxHp) {
      hp = maxHp;
    }
    if (mp < 0) {
      mp = 0;
    }
    if (mp > maxMp) {
      mp = maxMp;
    }
  }

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

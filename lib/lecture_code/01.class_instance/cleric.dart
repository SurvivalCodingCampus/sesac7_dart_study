import 'dart:math';

class Cleric {
  final String name; // 이름

  static const int maxHp = 50;
  static const int maxMp = 10;

  final int randomLimitNum = 3;
  final int initZero = 0;
  final int mpUsage = 5;

  int hp;
  int mp;

  // 생성자
  Cleric(this.name, {required int hp, required int mp})
      : hp = hp > maxHp ? maxHp : hp,
        mp = mp > maxMp ? maxMp : mp;

  // selfAid 메서드
  void selfAid() {
    mp -= mpUsage;
    mp >= initZero ? hp = maxHp : mp = 0;
  }

  // pray 메소드
  int pray(int praySec) {
    int recoveryMpAmount = mp + praySec + Random().nextInt(randomLimitNum);
    int oldMp = mp;
    mp = (mp + recoveryMpAmount).clamp(0, maxMp);
    return mp - oldMp;
  }
}
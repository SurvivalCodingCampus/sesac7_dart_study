import 'dart:math';

class Cleric {
  String name;
  int hp;
  final int maxHp = 50;
  int mp;
  final int maxMp = 10;

  Cleric(this.name, this.hp, this.mp);

  void selfAid() {
    if (this.mp >= 5) {
      this.mp -= 5;
      this.hp = this.maxHp;
    }
  }

  int pray(int time) {
    // 기도 시간은 최대 초당 1씩 회복 된다는 기준
    // 기도는 mp가 최대가 아닐 경우만 가능
    if (((time > 0) && (time <= this.maxMp)) && this.mp < this.maxMp) {
      int previousMp = this.mp;
      int recoveryMp;

      // 회복 보정 0 ~ 2
      this.mp += time + Random().nextInt(3);

      // maxMp 초과 회복 불가
      if (this.mp > this.maxMp) {
        this.mp = this.maxMp;
      }

      recoveryMp = this.mp - previousMp;

      return recoveryMp;
    } else {
      return 0;
    }
  }
}

import 'dart:math';

class Cleric {
  String name;
  int hp = 50;
  final int maxHp = 50;
  int mp = 10;
  final int maxMp = 10;

  Cleric(this.name);

  void selfAid() {
    if(mp >= 5) {
      mp = mp - 5;
      hp = maxHp;
    } else {
      print("self aid 에는 최소한 5 mp가 필요합니다.");
    }
  }

  int pray(int prayTime) {
    int mpPoint = 0;
    if (prayTime >= 0) {
      mpPoint = prayTime + Random().nextInt(3);
    } else {
      print(" pray 시간은 1초 이상이어야 합니다.");
    }
    int mpPointToBeRecovered = maxMp - mp;
    if(mpPoint > mpPointToBeRecovered) {
      return mpPointToBeRecovered;
    } else {
      return mpPoint;
    }
  }
}
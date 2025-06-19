import 'dart:math';

class Cleric {
  static const int maxHp = 50;
  static const int maxMp = 10;
  static const int selfAidMp = 5;
  static const int didNotPray = 0;
  static const int randomNextInt = 3;

  String name;
  int hp;
  int mp;

  Cleric(
    this.name, {
    this.hp = maxHp,
    this.mp = maxMp,
  });

  void selfAid() {
    if (mp < selfAidMp) {
      print('MP가 부족합니다. 현재 MP: $mp');
      return;
    }

    mp -= selfAidMp;
    hp = maxHp;
    print('$name의 HP가 최대로 회복되었습니다. 현재 HP: $hp, MP: $mp');
  }

  int pray(int seconds) {
    if (seconds == didNotPray) {
      print('pray를 실행하지 않습니다. 현재 MP: $mp');
      return didNotPray;
    }

    if (mp == maxMp) {
      print('MP가 이미 최대입니다. 현재 MP: $mp');
      return didNotPray;
    }

    final weight = Random().nextInt(randomNextInt);
    int restoredMp = weight + seconds;

    if (restoredMp + mp > maxMp) {
      restoredMp = maxMp - mp;
    }

    mp += restoredMp;
    print('$name의 MP가 $restoredMp만큼 회복되었습니다. 현재 MP: $mp');
    return restoredMp;
  }
}

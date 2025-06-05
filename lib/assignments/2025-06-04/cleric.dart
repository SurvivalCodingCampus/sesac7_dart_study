import 'dart:math';

class Cleric {
  static const int maxHp = 50;
  static const int maxMp = 10;

  String name;
  int hp;
  int mp;

  Cleric({required this.name, this.hp = maxHp, this.mp = maxMp});

  void selfAid() {
    if (mp < 5) {
      print('MP가 부족합니다. 현재 MP: $mp');
      return;
    }

    mp -= 5;
    hp = maxHp;
    print('$name의 HP가 최대로 회복되었습니다. 현재 HP: $hp, MP: $mp');
  }

  int pray(int seconds) {
    if (seconds == 0) {
      print('pray를 실행하지 않습니다. 현재 MP: $mp');
      return 0;
    }

    if (mp == maxMp) {
      print('MP가 이미 최대입니다. 현재 MP: $mp');
      return 0;
    }

    final weight = Random().nextInt(3);
    int restoredMp = weight + seconds;

    if (restoredMp + mp > maxMp) {
      restoredMp = maxMp - mp;
    }

    mp += restoredMp;
    print('$name의 MP가 $restoredMp만큼 회복되었습니다. 현재 MP: $mp');
    return restoredMp;
  }
}

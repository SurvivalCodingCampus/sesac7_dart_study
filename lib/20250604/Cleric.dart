import 'dart:math';

class Cleric {
  int hp;
  int mp;
  String name;
  final maxHp = 50;
  final maxMp = 10;

  Cleric(this.name, {this.hp = 50, this.mp = 10});

  void selfAid() {
    if(mp >= 5) {
      mp = mp - 5;
      hp = maxHp;
    } else {
      print('mp가 부족합니다.');
    }
  }

  /// amount 는 기도할 시간(초) 1초 기도 시 1~3, 2초 : 2~4
  /// 반환값 : 실제로 회복된 MP 양
  int pray(int amount) {
    if (amount <= 0) return 0;

    final int possibleMp = maxMp - mp; // 회복가능한 MP
    final int healAmount = Random().nextInt(amount + 1) + amount;
    final int actualHeal = healAmount > possibleMp ? possibleMp : healAmount;

    mp += actualHeal;
    return actualHeal;
  }
}
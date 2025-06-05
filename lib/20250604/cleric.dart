import 'dart:math';

class Cleric {
  int hp;
  int mp;
  String name;

  static const int maxHp = 50;
  static const int maxMp = 10;

  final wasteMP = 5; // hp를 채울 때 사용되는 mp

  Cleric(this.name, {this.hp = Cleric.maxHp, this.mp = Cleric.maxMp}) {
    if(name.isEmpty) {
      throw ArgumentError('이름을 공백으로 사용할 수 없습니다.');
    }
    if(hp > Cleric.maxHp || hp <= 0) {
      throw ArgumentError('HP 초기값 설정이 잘못되었습니다.');
    }
    if(mp > Cleric.maxMp || mp <= 0) {
      throw ArgumentError('MP 초기값 설정이 잘못되었습니다.');
    }
  }

  /// 공격당함
  void attacked({required int damageAmount}) {
    hp -= damageAmount;
  }

  void selfAid() {
    if(mp < wasteMP) {
      return;
    }

    mp = mp - wasteMP;
    hp = maxHp;
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
import 'dart:math' as math;



class Cleric {
  String name;
  int hp = 50;
  final int maxHp = 50;
  int mp = 10;
  final int maxMp = 10;
  final math.Random _random = math.Random();

  Cleric(this.name);

  void selfAid() {
    if (mp < 5) {
      print('$name does not have enough mana (5) to cast self aid.\n');
    }
    else {
      mp = mp - 5;
      hp = maxHp;
      print('$name used self aid, healing itself to max HP.\n');
    }
  }

  int pray(int seconds) {
    if (seconds <= 0) {
      print('$name failed to cast pray.\n');
      return 0;
    }

    final int initialMp = mp;
    final int recoveryAmount = _random.nextInt(3) + seconds;

    mp = math.min(maxMp, mp + recoveryAmount);
    final int actualRecovery = mp - initialMp;

    print('$name used pray, restoring mana by $actualRecovery');

    return actualRecovery;
  }  
}
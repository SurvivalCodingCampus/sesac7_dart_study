import 'dart:math';

var random = Random();

class Cleric {
  String name;
  int hp = 50;
  final int maxHp = 50;
  int mp = 10;
  final int maxMp = 10;

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
    final int manaToGain = random.nextInt(3) + seconds;

    mp = (mp + manaToGain > maxMp)? maxMp : mp + manaToGain; 

    print('$name used pray, restoring mana by ${mp - initialMp}');

    return mp - initialMp;
  }  
}
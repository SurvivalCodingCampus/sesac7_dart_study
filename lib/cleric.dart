import 'dart:math';

class Cleric {
  // String name;
  final int maxHp = 50;
  final int maxMp = 10;
  final int selfAidMp = 5;

  int hp = 50;
  int mp = 10;

  void selfAid() {
    if (mp < selfAidMp) {
      // print('$name does not have enough mana (5) to cast self aid.\n');
      return;
    } else {
      mp = mp - selfAidMp;
      hp = maxHp;
    }

    // print('$name used self aid, healing itself to max HP.\n');
  }
}

void main() {
  final clericJang = Cleric();
  int retval = 0;

  const int testIterations = 10;
  final String name = 'hello';
  final isMarried = true;

  print('');
}

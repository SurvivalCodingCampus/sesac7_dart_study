class Cleric {
  String name;
  int hp = maxHp;
  static const int maxHp = 50;
  int mp = maxMp;
  static const int maxMp = 10;

  Cleric(this.name);

  void selfAid() {
    if (mp >= 5) {
      mp -= 5;
      hp = maxHp;
    } else {
      print('mp 소모 불가능');
    }
  }
}
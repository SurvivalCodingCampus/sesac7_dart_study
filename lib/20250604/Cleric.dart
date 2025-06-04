class Cleric {
  int hp = 50;
  int mp = 10;
  String name;
  final maxHp = 50;
  final maxMp = 10;

  Cleric(this.name, this.hp, this.mp);

  void selfAid() {
    if(mp >= 5) {
      mp = mp - 5;
      hp = maxHp;
    } else {
      print('mp가 부족합니다.');
    }
  }
}
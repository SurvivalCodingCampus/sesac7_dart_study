class Cleric {
  // field
  String name; // 이름
  int hp = 50; // hp
  int mp = 10; // mp
  final int maxHp = 50; // 최대 hp
  final int maxMp = 10; // 최대 mp

  // method
  Cleric(this.name); // 생성자, 성직자 이름 초기화

  void selfAid() {
    if(mp >= 5) { // 소비할 mp가 충분할 때만(5 이상) 마법 사용
      mp -= 5;
      hp = maxHp;
    }
    else {
      print('mp가 충분하지 않습니다!');
    }
  }
}

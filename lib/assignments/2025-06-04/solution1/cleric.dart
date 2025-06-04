class Cleric {
  String name;
  int hp;
  int mp;
  final int maxHp;
  final int maxMp;

  Cleric({
    required this.name,
    this.hp = 50,
    this.mp = 10,
    this.maxHp = 50,
    this.maxMp = 10,
  });

  void selfAid(){
    if(mp >= 5){
      mp -= 5;
      hp = maxHp;
    }else {
      print('selfAid 사용에 필요한 mp가 부족합니다');
    }
  }


}



import 'dart:math';

class Cleric {
  String name;
  int hp = 50;
  int mp = 10;

  static const int maxHp = 50;
  static const int maxMp = 10;

  Cleric(this.name);


  void selfAid() {
    if( mp >= 5 ) {
      mp -= 5;
      hp = maxHp;

      print('$name casts Self Aid! HP restored to $hp.');
    }
    else {
      print('$name does not have enough MP to cast Self Aid.');
    }
    print('hp: $hp, mp: $mp'); 
  }

  int pray(int praySeconds) {

    //기도시간이 0이면 패스
    if( praySeconds <= 0 ) {
      print("If praySeconds is 0 then not work");
      return 0;
    }

    int firstMP = mp;

    Random random = Random();
    int randomNumber = random.nextInt(3); //0~2
    
    //회복된 MP
    int recoveredMP = praySeconds + randomNumber;

    mp += recoveredMP;

    //최대mp보다 회복할 순 없음.
    if( mp > maxMp ) {
      mp = maxMp;
      recoveredMP = mp - firstMP;
      print("mp limit is $maxMp");
    }

    print("mp is increased to $mp");
    print("recovered mp is $recoveredMP");

    return recoveredMP;
  }
}
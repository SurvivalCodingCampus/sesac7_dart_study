import 'dart:async';
import 'dart:math';

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

  int pray ({required int prayTime}){
    // 회복할 수 없는 경우
    if (mp == maxMp) return 0;

    int totalHealAmount = 0; // 총 회복량

    // 회복한 시간
    Timer.periodic(Duration(seconds: 1) , (timer) {
      int healAmount = mp < 9 ? Random().nextInt(1) + 2 : 1;
      totalHealAmount += healAmount;

      mp += healAmount;

      print('mp 회복량 : $healAmount');
      print('현재 mp량 : $mp');

      if(timer.tick >= prayTime || mp >= maxMp){
        timer.cancel();
      }
    }, );

    return totalHealAmount;
  }
}

void main(){
  Cleric cleric = Cleric(name: 'oh');

  cleric.pray(prayTime: 3);
}



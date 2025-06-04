
import 'dart:math';

class Cleric {
  String name;
  int hp = 50;
  final int max_hp = 50;
  int mp = 10;
  final int max_mp = 10;

  Cleric(this.name);


  void selfAid(){
    print('회복 이전 hp : $hp');
    if(mp < 5){
      print('mp가 부족합니다.');
      return;
    }
    mp-=5;
    hp = max_hp;
    print('현재 mp : $mp , 회복 이후 hp : $hp');
  }

  int pray(int second){
    //이미 최대 mp면 0 리턴.
    if(mp == max_mp){
      return 0;
    }

    int beforeMp = mp;
    int heal = second + Random().nextInt(3); //회복량

    int actualHeal = (beforeMp + heal > max_mp) ? max_mp - beforeMp : heal;
    mp = beforeMp + actualHeal;
    print('회복 이후 mp : $mp , 회복량 : $actualHeal');
    return actualHeal;

    //회복하기전 mp와 회복량, 즉 회복 이후의 mp값이 최대 mp보다 크다면,
    //mp = max_mp  이고 max_mp에서 회복 이전 값을 뺀 값을 반환(회복량)
    // if(beforeMp + heal >= max_mp){
    //   mp = max_mp;
    //   print('회복 이후 mp : $mp , 회복량 : ${max_mp - beforeMp}');
    //   return max_mp - beforeMp;
    // }else{
    //   //회복이후의 mp값이 최대 mp값 보다 작다면 ,
    //   //mp+= 회복량 이고 회복이후의 mp에서 회복 이전의 mp를 뺀 값을 반환(회복량)
    //   mp+=heal;
    //   print('회복 이후 mp : $mp , 회복량 : ${mp - beforeMp}');
    //   return mp - beforeMp;
    // }
  }

}



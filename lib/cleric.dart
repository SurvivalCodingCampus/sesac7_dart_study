import 'dart:math';

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

  int pray(int second) {
    int result = 0; // 실질 회복량. 0초 기도를 해도 값이 나올 수 있도록 0으로 초기화.

    if(second > 0) { // 기도 시간이 양수일 때만 실질적인 마법 사용.
      final int mpGen = second + Random().nextInt(3); // mp 회복 전체양(초과분도 포함), 기도 시간 + 0~2 랜덤 정수

      if(mp + mpGen <= 10) { // 10까지는 mpGen 값이 그대로 회복량이 됨.
        mp += mpGen;
        result = mpGen;
      }
      else { // 회복했을 때 10을 넘어갈 경우
        final int temp = mp; // 회복 전 mp 값을 임시로 저장하고,
        mp = maxMp; // mp를 최대치까지 회복한 후,
        result = maxMp - temp; // mp 최대치(10) - 회복 전 mp 값(temp)을 반환.
      }
    }

    return result;
  }
}

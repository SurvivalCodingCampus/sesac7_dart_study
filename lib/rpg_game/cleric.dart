import 'dart:math';

class Cleric {
  // field
  String name; // 이름
  int hp; // hp
  int mp; // mp
  final int prayCorrectionRange = 3; // 기도 마법 회복 보정 범위
  final int selfAidMpCost = 5; // selfAid 마법의 mp 소모량
  static const int maxHp = 50; // 최대 hp
  static const int maxMp = 10; // 최대 mp

  Cleric(
    this.name, {
    this.hp = maxHp,
    this.mp = maxMp,
  }); // 생성자, 성직자 이름 + hp + mp 초기화

  // method
  void selfAid() {
    if (mp < selfAidMpCost) {
      print('mp가 충분하지 않습니다!');
      return;
    } else {
      mp -= selfAidMpCost;
      hp = maxHp;
    }
  }

  int pray(int second) {
    int result = 0; // 실질 회복량. 0초 기도를 해도 값이 나올 수 있도록 0으로 초기화.

    if (second > 0) {
      // 기도 시간이 양수일 때만 실질적인 마법 사용.
      final int mpRecoveryAmount =
          second +
          Random().nextInt(
            prayCorrectionRange,
          ); // mp 회복 전체양(초과분도 포함), 기도 시간 + 0~2 랜덤 정수

      if (mp + mpRecoveryAmount <= maxMp) {
        // 10까지는 mpRecoveryAmount 값이 그대로 회복량이 됨.
        mp += mpRecoveryAmount;
        result = mpRecoveryAmount;
      } else {
        // 회복했을 때 10을 넘어갈 경우
        final int mpBeforeRecovery = mp; // 회복 전 mp 값을 임시로 저장하고,
        mp = maxMp; // mp를 최대치까지 회복한 후,
        result =
            maxMp -
            mpBeforeRecovery; // mp 최대치(10) - 회복 전 mp 값(mpBeforeRecovery)을 반환.
      }
    }

    return result;
  }
}

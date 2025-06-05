import 'dart:math';

class Cleric {
  static const int maxHp = 50;
  static const int maxMp = 10;

  String name;
  int hp = 50;
  int mp = 10;

  Cleric(this.name, {this.hp = maxHp, this.mp = maxMp});

  void selfAid() {
    // self-aid 에 따라 차감되는 mp 양 - 5 mp
    final mpNecessary = 5;

    // 예외처리
    if (mp < mpNecessary) {
      print("self aid 에는 최소한 5 mp가 필요합니다.");
      return;
    }

    // mp를 줄이고 hp를 최대치로
    mp = mp - mpNecessary;
    hp = maxHp;
  }

  int pray(int praySeconds) {
    // 리턴될 mpPointsRecovered 정의 및 계산
    int mpPointsRecovered = 0;

    // 회복되는 +alpha 값의 최대치
    final maxPlusAlphaRecovered = 2;

    if (praySeconds <= 0) {
      print("pray 시간은 1초이상이어야 합니다.");
      return 0;
    }

    mpPointsRecovered =
        praySeconds + Random().nextInt(maxPlusAlphaRecovered + 1);

    // 최대 mpPointsRecovered 정의 및 계산
    int maxMpPointsRecovered = maxMp - mp;

    // maxMpPointsRecovered 제약 체크
    mpPointsRecovered = min(mpPointsRecovered, maxMpPointsRecovered);

    // mp 회복
    mp = mp + mpPointsRecovered;

    // 실제 회복된 mp 값 반환
    return mpPointsRecovered;
  }
}

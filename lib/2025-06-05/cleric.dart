import 'dart:math'; // random 함수 사용을 위한 import

class Cleric {
  // 필드
  String name;
  int hp = 50; // hp, maxHp는 정수로 초기값 50
  int mp = 10; // mp, maxMp는 정수로 초기치 10

  // 각 인스턴스별로 최대 HP와 최대 MP 필드에 대한 정보를 가지고 있다
  // 모든 파일에 공유되는 필드
  static const int maxHp = 50;
  static const int maxMp = 10;
  // Q. 여기서 static final 로 수정시 에러 메세지가 '선택적 parameter의 기본값은 반드시 상수여야 한다' 고 하는 이유가 dart의 type safety 때문인가요?

  Cleric({required this.name, this.hp = Cleric.maxHp, this.mp = Cleric.maxMp}); // 생성자
  
  // 이름과 Hp 만으로 지정하여 인스턴스화 할때 mp는 최대 mp 와 같은 값이 초기화 된다
  
  // 클래스에 selfAid 메소드 추가
  // 이 메소드에는 인수가 없고, 리턴 값도 없다(void)
  // 결과가 없어서 어딘가에 담길수없음

  void selfAid() {
    int usedMp = 5; // 동작시 소모되는 mp 값

    // 예외처리 조건을 나눠보자
    if (mp < usedMp) {
      print('mp가 부족합니다');
      return;
    }
    if (hp >= Cleric.maxHp) {
      print('hp가 max값을 넘을 수 없습니다');
      return;
    } else {
      mp -= usedMp; // mp 소모
      hp = Cleric.maxHp;
      // hp는 최대hp 값으로 변경
    }
  }

  // pray 메소드 추가
  // 인수에 기도할 시간(초)를 지정할 수 있고
  // 리턴값은 실제로 회복된 mp 양
  int pray (int praySec) {
    // mp가 0보다 크고 10보다 작은 범위일때

    // 예외처리를 해보자
    if (praySec <= 0) { // 기도하는 시간이 0초이거나 -일때
      return 0;
    } if (mp >= 10 && mp < 0) { // mp 값이 이미 10이거나 10보다 클때, mp가 마이너스 일때?
      return 0;
    } else { 
      final int randomPoint = Random().nextInt(3); // 랜덤한 포인트 생성(Q.여기서 final 써야하나?)
      final int healScore = praySec + randomPoint; // 실제 기도한 시간에 랜덤 포인트를 더해서 실제 회복되는 mp값(Q.여기서 final 써야하나?)
      
      mp = (mp + healScore).clamp(0, Cleric.maxHp); // mp값은 0 ~ maxHp 사이의 값으로 존재
      
      print('mp는 $mp');
      print('randomPoint는 $randomPoint');
      print('회복된 mp 양은 $healScore');
      
      return healScore; //실제 회복된 mp양
    }
  }
}
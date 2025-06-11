import 'dart:math'; // random 함수 사용을 위한 import

// 클래스(붕어빵 틀)
class Cleric {
  // 필드
  String name;

  int hp = 50; // hp, maxHp는 정수로 초기값 50
  final int maxHp = 50; // maxHp 는 상수 필드로 선언

  int mp = 10; // mp, maxMp는 정수로 초기치 10
  final int maxMp = 10; // maxMp는 상수 필드로 선언

  // final int maxHp = 10;
  // int mp = maxHp;
  // 런타임 상수라서 컴파일 타임 상수에 대입할 수 없다

  Cleric({required this.name, this.hp = 50, this.mp = 10}); // 생성자
  // 생성자와 필드 매칭
  // test code 에서 지정한 값을 사용해 test 를 하기 위해서 생성자와 매칭된 필드값이 필요함

  // 클래스에 selfAid 메소드 추가
  // 이 메소드에는 인수가 없고(인수?), 리턴 값도 없다(void)
  // 결과가 없어서 어딘가에 담길수없음
  void selfAid() {
    if (mp >= 5 && hp < maxHp) {
      mp -= 5; // mp 5 소모
      hp = maxHp;
      // hp는 최대hp 값으로 변경

      // return;
      // 이렇게 작성해도 return 값은 없음
      // 조건마다 return 시켜서 활용한다
    } else {
      print('mp값이 부족합니다');
    }
  }

  // pray 메소드 추가
  // 인수에 기도할 시간(초)를 지정할 수 있고
  // 리턴값은 실제로 회복된 mp 양
  int pray(int praySec) {
    // mp가 0보다 크고 10보다 작은 범위일때
    if (mp < 10 && mp > 0) {
      int randomPoint = Random().nextInt(3); // 0~2 사이 정수 Q.재확인필요
      int healScore = praySec + randomPoint;
      mp = (mp + healScore).clamp(0, maxMp);

      // min() 함수: Returns the lesser of two numbers.

      print('mp는 $mp');
      print('randomPoint는 $randomPoint');
      print('회복된 mp 양은 $healScore');
      return healScore;
    } else {
      print('mp값을 수정할 수 없습니다');
      return 0;
    }
  }
}
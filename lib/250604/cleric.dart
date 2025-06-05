import 'dart:math'; //random 함수 사용시 필요
import 'dart:io'; //사용자 입력 받을시 필요

/*
구현목록
01. 현실세계의 성직자 “클레릭"를 표현하는 클래스 Cleric 를 작성 하시오.
02. 성직자는 용사 처럼 이름과 HP를 가지고 있고, 추가로 마법을 사용하기 위한 MP를 가지고 있다.
03. Cleric 클래스에 “이름", “HP”, “최대 HP”, “MP”, “최대 MP”를 속성으로 추가 하시요.
04. 또한 HP와 최대 HP는 정수로 초기치 50, MP와 최대 MP는 정수로 초기치 10으로 하고,
05. 최대 HP와 최대 MP는 상수 필드로 선언 하시오.
06. 성직자는 “셀프 에이드" 라는 마법을 사용할 수 있고, MP를 5소비하는 것으로 자신의 HP 를 최대 HP 까지 회복할 수 있다.
07. 연습 1 에 선언한 Cleric 클래스에 “selfAid()” 메소드를 추가 하시오. 또한, 이 메소드는 인수가 없고, 리턴 값도 없다.
08. 성직자는 “기도하기" (pray) 라는 행동을 취할 수 있고, 자신의 MP를 회복한다.
09. 회복량은 기도한 시간(초)에 랜덤하게 0 ~ 2포인트의 보정을 한 양이다 (3초 기도하면 회복량은 3 ~ 5 포인트). 단, 최대 MP 보다 더 회복하는 것은 불가능 하다.
10. 연습 2에서 선언한 Cleric 클래스에 “pray()” 메소드를 추가하시오.
11. 이 메소드는 인수에 “기도할 시간(초)"를 지정할 수 있고, 리턴 값은 “실제로 회복된 MP 양" 을 반환한다.
*/

class Cleric {
  // 속성
  final String name; // 이름
  int hp; // HP
  int mp; // MP
  final int maxHp = 50; // 최대 HP, 초기치(50), 상수 선언
  final int maxMp = 10; // 최대 MP, 초기치(10), 상수 선언

  // 생성자
  Cleric(this.name, this.hp, this.mp) {
    hp = maxHp;
    mp = maxMp;
  }

  // selfAid메서드
  // 호출시 mp에서 -5를 더하고 HP를 최대치로 설정
  // mp가 0 또는 이하가 될 경우 소모 문구표시
  void selfAid() {
    if (mp > 0) {
      mp -= 5;
      hp = maxHp;
    } else {
      mp = 0; // 음수로 되지 않도록 0으로 초기화
      print("mp가 전부 소모 되었습니다.");
    }
  }

  // pray 메소드
  int pray(int praySec) {
    //사용자로 입력받은 수와 보정(0~2) 합산
    // mp와 보정 합산되 수를 한산하여 mp 최대범위 확인
    int totalSec = mp + praySec + Random().nextInt(3);
    print(totalSec);
    if (0 <= totalSec || totalSec <= maxMp) {
      //0과 10사이 수면 리턴
      return totalSec;
    } else {
      // 10 이상이면 최대MP 리턴
      mp = maxMp;
      return mp;
    }
  }
}

void main() {
  var cleric = Cleric('성직자', 1, 1);
  // Pray 메서드 호출
  cleric.pray(inputSec());
}

// 기도할 시간 사용자 입력받는 함수
int inputSec() {
  while (true) {
    // 사용자 입력문구 표시
    stdout.write('기도한 시간(초)을 입력해 주세요: ');
    // 사용자 입력 받기
    String? str = stdin.readLineSync()!;
    // null 또는 int형 확인
    int? praySec = int.tryParse(str);
    // 숫자인 경우에만 리턴
    if (praySec != null) {
      // praySec += Random().nextInt(3);
      return praySec;
    }
  }
}

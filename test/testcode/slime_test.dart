import 'package:modu_3_dart_study/lecture_code/01.class_instance/hero.dart';
import 'package:modu_3_dart_study/lecture_code/01.class_instance/slime.dart';
import 'package:test/test.dart';

/*
이 클래스를 이용해, 다음 사양을 따르는 PoisonSlime 클래스를 작성하시오
01. 독 슬라임(PoisonSlime)은, 슬라임 (Slime) 중에서도 특히 “독 공격" 이 되는 것
 - super에 독공격(poisonAttack)사용한다.

02. PoisonSlime 는 아래의 코드로 인스턴스화 되는 클래스임
   PoisonSlime poisonSlime = PoisonSlime(‘A’);
 - 인스턴스화 즉 클래스.

03. PoisonSlime 독 공격 가능 횟수를 저장하는 poisonCount(초기값 5)를 가진다
 - 초기값 설정
 - 캡슐화

04. PoisonSlime attack() 메소드가 호출되면 다음 내용의 공격을 한다
  a. 우선, “보통 슬라임과 같은 공격"을 한다.
   - super클래스 attack()실행

  b. poisonCount가 0이 아니면 다음을 추가로 수행한다
   - poision 조건 검사

  c. 화면에 “추가로, 독 포자를 살포했다!” 를 표시
   - poisonCount가 0이상이면(즉 0과 같거나 작으면 return), print(“추가로, 독 포자를 살포했다!”)

  d. 용사의 HP 의 1/5에 해당하는 포인트를 용사의 HP 로부터 감소시키고, “~포인트의 데미지" 라고 표시
   - Hero HP 1/5감소, 감소량 저장, print(“~포인트의 데미지")
   - Hero set에서??

  e. poisonCount 를 1 감소 시킨다
   - setter를 사용, poisonCount-=1;

*/
void main() {
  Hero hero = Hero('홍길동', 100);
  test('01. 독 슬라임(PoisonSlime)은, 슬라임 (Slime) 중에서도 특히 독 공격 이 되는 Test', () {
    //given(준비)
    PoisonSlime poisonSlime = PoisonSlime("녹색");
    final int oneTimeAttackedHp = 67;

    //when(실행)
    poisonSlime.attack(hero);

    //then(검증)
    //expect(hero.hp < 100, true);
    //print 출력 확인
    expect(hero.hp, oneTimeAttackedHp);
  });

  test('PoisonSlime 는 아래의 코드로 인스턴스화 되는 클래스 Test', () {
    //given(준비)
    PoisonSlime poisonSlime = PoisonSlime("녹색");

    //when(실행)

    //then(검증)
    expect(poisonSlime.suffix, "녹색");
  });

  test('PoisonSlime 독 공격 가능 횟수를 저장하는 poisonCount(초기값 5) Test', () {
    //given(준비)
    PoisonSlime poisonSlime = PoisonSlime("녹색");
    final int poisonInitNum = 5;

    //when(실행)

    //then(검증)
    expect(poisonSlime.poisonCount, poisonInitNum);
  });

  group('PoisonSlime attack() 메소드가 호출시 테스트', () {
    test('a번 보통 슬라임과 같은 공격 문구 표시 Test', () {
      //given(준비)
      PoisonSlime poisonSlime = PoisonSlime("녹색");

      //when(실행)
      poisonSlime.attack(hero);

      //then(검증)
      //print 출력물 확인
    });

    test('b,c번 poisonCount가 0이 아니면 다음을 추가로 수행 여부 및 추가로, 독 포자를 살포했다! 출력 Test', () {
      //given(준비)
      PoisonSlime poisonSlime = PoisonSlime("녹색");
      final endPointPoisonCount = 0;
      final int poisonCountLimitNum = poisonSlime.poisonCount;

      //when(실행)
      for (int i = 0; i < poisonCountLimitNum; i++) {
        poisonSlime.attack(hero);
      }

      //then(검증)
      expect(poisonSlime.poisonCount, endPointPoisonCount);
      // expect(hero.hp, equals(/* 예상 HP 값 */));              // HP도 함께 검증 coderabbit
    });

    test('b,c번 poisonCount가 0이후 비수행 및 독 포자를 살포했다! 비출력 Test', () {
      //given(준비)
      PoisonSlime poisonSlime = PoisonSlime("녹색");
      final endPointPoisonCount = 0;
      final poisonOverCountNum = poisonSlime.poisonCount + 1;

      //when(실행)
      for (int i = 0; i < poisonOverCountNum; i++) {
        poisonSlime.attack(hero);
      }

      //then(검증)
      expect(poisonSlime.poisonCount, endPointPoisonCount);
    });

    test(
      'd번 용사의 HP 의 1/5에 해당하는 포인트를 용사의 HP 로부터 감소시키고, ~포인트의 데미지 라고 표시 Test',
      () {
        //given(준비)
        PoisonSlime poisonSlime = PoisonSlime("녹색");
        final endHpCount = 6;

        //when(실행)
        for (int i = 0; i < endHpCount; i++) {
          poisonSlime.attack(hero);
        }

        //then(검증)
        //출력물 표시
      },
    );

    test('e번 poisonCount 를 1 감소 시킨다 Test', () {
      //given(준비)
      PoisonSlime poisonSlime = PoisonSlime("녹색");
      final int poisonCountLimitNum = poisonSlime.poisonCount;

      //when(실행)
      for (int i = 0; i < poisonCountLimitNum; i++) {
        poisonSlime.attack(hero);
      }

      //then(검증)
      expect(poisonSlime.poisonCount, 0);
    });

    test('e번 poisonCount가 0이 된 후에 1 감소 시도시 return Test', () {
      //given(준비)
      PoisonSlime poisonSlime = PoisonSlime("녹색");
      final poisonOverCountNum = poisonSlime.poisonCount + 1;

      //when(실행)
      for (int i = 0; i < poisonOverCountNum; i++) {
        poisonSlime.attack(hero);
      }

      //then(검증)
      expect(poisonSlime.poisonCount, 0);
    });
  });
}

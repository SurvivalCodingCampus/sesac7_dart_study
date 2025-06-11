import 'package:modu_3_dart_study/250604/cleric.dart';
import 'package:modu_3_dart_study/250604/person.dart';
import 'package:modu_3_dart_study/250604/wizard.dart';
import 'package:test/test.dart';

void main() {
  test('selfAid() 메서드 Test', () {
    //given(준비)
    final cleric = Cleric('성직자', hp: 1, mp: 1);

    //when(실행)
    cleric.selfAid();

    //then(검증)
    //selfAid() 결과 확인
    expect(cleric.hp, 1);
    expect(cleric.mp, 0);
  });

  test('selfAid() 메서드 4번 반복 Test : mp가 0으로 초기화 되는것', () {
    //given(준비)
    final cleric = Cleric('성직자', hp: 1, mp: 1);

    //when(실행)
    for (int i = 0; i < 4; i++) {
      cleric.selfAid();
    }

    //then(검증)
    //selfAid() 결과 확인
    expect(cleric.hp, 1);
    expect(cleric.mp, cleric.initZero);
  });

  test('pray 메서드, mp가 10보다 큰 경우 Test', () {
    //given(준비)
    var cleric = Cleric('성직자', hp: 1, mp: 1);

    //when(실행)
    cleric.mp = cleric.initZero;
    int returnValue = cleric.pray(10);

    //then(검증)
    expect(returnValue > cleric.initZero, true);
    expect(cleric.mp, Cleric.maxMp);
  });

  test('pray 메서드, mp가 10보다 작은 경우 Test', () {
    //given(준비)
    var cleric = Cleric('성직자', hp: 1, mp: 1);

    //when(실행)
    cleric.mp = cleric.initZero;
    int returnValue = cleric.pray(8);

    //then(검증)
    expect(returnValue <= Cleric.maxMp, true);
    expect(returnValue == 8 || returnValue == 9 || returnValue == 10, true);
  });

  test('static 을 통한 공유 필드 선언후 값 Test', () {
    //given(준비)

    //when(실행)

    //then(검증)
    expect(Cleric.maxHp, 50);
    expect(Cleric.maxMp, 10);
  });

  group('생성자 테스트', () {
    final String clericTestName = '아서스';
    test('생성자 인자값 : “아서스", hp: 40, mp: 5', () {
      //given(준비)
      final int testHp = 40;
      final int testMp = 5;

      var cleric = Cleric('아서스', hp: 40, mp: 5);

      //when(실행)

      //then(검증)
      expect(cleric.name, clericTestName);
      expect(cleric.hp, testHp);
      expect(cleric.mp, testMp);
    });

    test('생성자 인자값 : “아서스"', () {
      //given(준비)
      var cleric = Cleric('아서스');

      //when(실행)

      //then(검증)
      expect(cleric.name, clericTestName);
      expect(cleric.hp, Cleric.maxHp);
      expect(cleric.mp, Cleric.maxMp);
    });

    test('생성자 인자값 : “아서스", hp: 40', () {
      //given(준비)
      final int testHp = 35;
      var cleric = Cleric('아서스', hp: testHp);

      //when(실행)

      //then(검증)
      expect(cleric.name, clericTestName);
      expect(cleric.hp, testHp);
      expect(cleric.mp, Cleric.maxMp);
    });
    
    test('생성자 인자값 지정 안 한 경우', () {
      //given(준비)
      // var cleric = Cleric(); 에러발생

      //when(실행)

      //then(검증)
    });
  });

  group('Person class 테스트', () {
    test('Person Class birthYear 리턴값 비교확인 거짓일 경우 Test', () {
      //given(준비)
      final int birthYear = 1982;
      var person = Person(name : '홍길동', birthYear : 1981);

      //when(실행)
      var calAge = person.age;

      //then(검증)
      expect(calAge == DateTime.now().year - birthYear, false);
    });

    test('Person Class birthYear 리턴값 비교확인 참 일경우 Test', () {
      //given(준비)
      final int birthYear = 1982;
      var person = Person(name : '홍길동', birthYear : 1982);

      //when(실행)
      var calAge = person.age;

      //then(검증)
      expect(calAge == DateTime.now().year - birthYear, true);
    });
  });

/*
01. 다음 2개의 클래스 “Wizard (마법사)”, “Wand (지팡이)” 를 작성하시오. 마법사는 지팡이를 들 수 있습니다.
    작성한 Wand 클래스와 Wizard 클래스에 대해, 아래의 규칙에 따라 타당성 검사를 추가하시오.
    부정한 값이 설정 될 경우에는 “Exception(“에러메세지");” 를 작성하여 프로그램을 중단 시킵니다.
   - 마법사나 지팡이의 이름은 null 일 수 없고, 반드시 3문자 이상이어야 한다
   - 지팡이의 마력은 0.5 이상 100.0 이하여야 한다.
   - 마법사가 생성된 이후에는 지팡이를 null 로 설정할 수 없다.
   - 마법사의 MP는 0 이상이어야 한다.
   - HP가 음수가 되는 상황에서는 대신 0을 설정 되도록 한다
*/

  test('마법사나 지팡이의 이름은 null 일 경우, 3문자 이하인 경우 Exception Test', () {
    //given(준비)

    var wand = Wand(name : '홍길동', power : 1.1);
    var wizard = Wizard('홍길동', 1, 1, wand: wand);

    //when(실행)

    //then(검증)
    expect(() => wand.setName = null, throwsException);
    expect(() => wand.setName = '홍길', throwsException);

    expect(() => wizard.setName = null, throwsException);
    expect(() => wizard.setName = '홍길', throwsException);

    expect(() => wand.setName = '홍길동', returnsNormally);
    expect(() => wizard.setName = '홍길동', returnsNormally);
  });

  test('지팡이의 마력은 0.5 이하 100.0 이상인 경우 Exception Test', () {
    //given(준비)
    var wand = Wand(name : '홍길동', power : 1.1);

    //when(실행)

    //then(검증)
    expect(() => wand.setPower = 0.1, throwsException);
    expect(() => wand.setPower = 100.1, throwsException);

    expect(() => wand.setPower = 0.5, returnsNormally);
    expect(() => wand.setPower = 100.0, returnsNormally);
  });

  test('마법사의 MP는 0 이하인 경우  Test', () {
    //given(준비)
    var wand = Wand(name : '홍길동', power : 1.1);

    var wizard = Wizard('홍길동', 1, 1, wand: wand);

    //when(실행)

    //then(검증)
    expect(() => wizard.setMp = -1, throwsException);

    expect(() => wizard.setMp = 1, returnsNormally);
  });

  test('HP가 음수가 되는 상황에서는 대신 0을 설정 되는지 확인 Test', () {
    //given(준비)
    var wand = Wand(name : '홍길동', power : 1.1);

    var wizard = Wizard('홍길동', 1, 1, wand: wand);

    //when(실행)
    wizard.setHp = -1;

    //then(검증)
    expect(wizard.getHp, 0);
  });

  test('마법사가 생성된 이후에는 지팡이를 null 로 설정 불가 Test', () {
    //given(준비)
    var wand = Wand(name : '홍길동', power : 1.1);
    var wizard = Wizard('홍길동', 1, 1, wand: wand);

    //when(실행)

    //then(검증)
    expect(() => wizard.setWand = null, throwsException);
  });

}

import 'package:modu_3_dart_study/250604/cleric.dart';
import 'package:test/test.dart';

void main() {
  test('selfAid() 메서드 Test', () {
    //given(준비)
    final cleric = Cleric('성직자', hp: 1, mp: 1);

    //when(실행)
    cleric.selfAid();

    //then(검증)
    //selfAid() 결과 확인
    expect(cleric.hp, Cleric.maxHp);
    expect(cleric.mp, Cleric.maxMp - cleric.mpUsage);
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
    expect(cleric.hp, Cleric.maxHp);
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
}

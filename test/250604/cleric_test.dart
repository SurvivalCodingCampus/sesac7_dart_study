import 'package:modu_3_dart_study/250604/cleric.dart';
import 'package:modu_3_dart_study/250604/hero.dart';
import 'package:test/test.dart';

void main() {
  test('Cleric class 생성자 Test', () {
    //given(준비)
    final cleric = Cleric('성직자', 1, 1);

    //when(실행)

    //then(검증)
    // 생성자, 초기화 확인
    expect(cleric.name, '성직자');
    expect(cleric.hp, Cleric.maxHp);
    expect(cleric.mp, Cleric.maxMp);
  });

  test('selfAid() 메서드 Test', () {
    //given(준비)
    final cleric = Cleric('성직자', 1, 1);

    //when(실행)
    cleric.selfAid();

    //then(검증)
    //selfAid() 결과 확인
    expect(cleric.hp, Cleric.maxHp);
    expect(cleric.mp, Cleric.maxMp - cleric.mpUsage);
  });

  test('selfAid() 메서드 4번 반복 Test : mp가 0으로 초기화 되는것', () {
    //given(준비)
    final cleric = Cleric('성직자', 1, 1);

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
    var cleric = Cleric('성직자', 1, 1);

    //when(실행)
    cleric.mp = cleric.initZero;
    int returnValue = cleric.pray(10);

    //then(검증)
    //expect(cleric.mp, isNot(10));
    expect(returnValue > cleric.initZero, true);
    expect(cleric.mp, Cleric.maxMp);
  });

  test('pray 메서드, mp가 10보다 작은 경우 Test', () {
    //given(준비)
    var cleric = Cleric('성직자', 1, 1);

    //when(실행)
    cleric.mp = cleric.initZero;
    int returnValue = cleric.pray(8);

    //then(검증)
    expect(returnValue <= Cleric.maxMp, true);
    expect(returnValue == 8 || returnValue == 9 || returnValue == 10 , true);
  });

  test('static을 통한 공유필드 선언후 값 Test', () {
    //given(준비)

    //when(실행)

    //then(검증)
    expect(Cleric.maxHp, 50);
    expect(Cleric.maxMp, 10);

  });
}

import 'package:modu_3_dart_study/250604/cleric.dart';
import 'package:test/test.dart';

void main(){
  test('Cleric class Test',(){
    //given(준비)
    final cleric = Cleric('성직자',1,2); // 인스턴스 생성

    //when(실행)

    //then(검증)
    // 생성자, 초기화 확인
    expect(cleric.name, '성직자');
    expect(cleric.hp, 50);
    expect(cleric.mp, 10);
  });

  test('selfAid() 메서드 Test',(){
    //given(준비)
    final cleric = Cleric('성직자',1,2); // 인스턴스 생성

    //when(실행)
    cleric.selfAid();

    //then(검증)
    //selfAid() 결과 확인
    expect(cleric.hp, 50);
    expect(cleric.mp, 5);
  });

  test('selfAid() 메서드 2번 반복 Test',(){
    //given(준비)
    final cleric = Cleric('성직자',1,2); // 인스턴스 생성
    cleric.hp = 10;

    //when(실행)
    for (int i = 0; i < 2; i++){
      cleric.selfAid();
    }

    //then(검증)
    //selfAid() 결과 확인
    expect(cleric.hp, 50);
    expect(cleric.mp, 0);
  });

  test('selfAid() 메서드 3번 반복 Test',(){
    //given(준비)
    final cleric = Cleric('성직자',1,2); // 인스턴스 생성
    cleric.hp = 10;

    //when(실행)
    for (int i = 0; i < 3; i++){
      cleric.selfAid();
    }

    //then(검증)
    //selfAid() 결과 확인
    expect(cleric.hp, 50);
    expect(cleric.mp, 0);
  });

  test('pray 메서드, mp가 10보다 작은 경우 Test',(){
    //given(준비)
    var cleric = Cleric('성직자', 1, 1);

    //when(실행)
    cleric.mp = 0;
    cleric.pray(10);

    //then(검증)
    //expect(cleric.mp, isNot(10));
    expect(cleric.mp < 10, true);

  });

  test('pray 메서드, mp가 10보다 큰 경우 Test',(){
    //given(준비)
    var cleric = Cleric('성직자', 1, 1);

    //when(실행)
    cleric.mp = 10;
    cleric.pray(1);

    //then(검증)
    expect(cleric.mp, 10);
  });
}
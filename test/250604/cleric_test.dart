import 'package:modu_3_dart_study/250604/cleric.dart';
import 'package:test/test.dart';

void main(){
  test('Cleric class Test',(){
    //given(준비)
    final cleric = Cleric('용사',1,2); // 인스턴스 생성

    //when(실행)

    //then(검증)
    // 생성자, 초기화 확인
    expect(cleric.name, '용사');
    expect(cleric.hp, 50);
    expect(cleric.mp, 10);
  });

  test('selfAid() 메서드 Test',(){
    //given(준비)
    final cleric = Cleric('용사',1,2); // 인스턴스 생성

    //when(실행)
    cleric.selfAid();

    //then(검증)
    //selfAid() 결과 확인
    expect(cleric.hp, 50);
    expect(cleric.mp, 5);
  });

  test('selfAid() 메서드 2번 반복 Test',(){
    //given(준비)
    final cleric = Cleric('용사',1,2); // 인스턴스 생성

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
    final cleric = Cleric('용사',1,2); // 인스턴스 생성

    //when(실행)
    for (int i = 0; i < 3; i++){
      cleric.selfAid();
    }

    //then(검증)
    //selfAid() 결과 확인
    expect(cleric.hp, 50);
    expect(cleric.mp, 0);
  });

}
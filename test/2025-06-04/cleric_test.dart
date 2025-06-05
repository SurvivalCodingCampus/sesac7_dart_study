// 테스트 코드를 사용하기 위해 test 패키지를 사용함
import 'package:test/test.dart';
import 'package:modu_3_dart_study/2025-06-04/cleric.dart';

void main(){
  test('hp가 50을 넘을 수 없고 mp가 5이하 일땐 실행되지 않는다',(){
    // given(준비)
    final cleric1 = Cleric(name: '성직자1', hp: 10, mp: 10);

    // when(1차 실행)
    cleric1.selfAid();
    // then(검증)
    expect(cleric1.hp, equals(50));
    expect(cleric1.mp, equals(5));
    
    // when(2차 실행)
    cleric1.selfAid();
    // then(검증)
    expect(cleric1.hp, equals(50));
    expect(cleric1.mp, equals(5)); 

    // Q. expect는 어떤 값까지를 보여주는가? expect 활용법?
  });

  test('mp가 5보다 작을때 실행되지 않는다',(){
    // given(준비)
    final cleric2 = Cleric(name: '성직자2', hp: 10, mp: 3);

    // when(실행)
    cleric2.selfAid();
    // then(검증)
    expect(cleric2.hp, equals(10));
    expect(cleric2.mp, equals(3));
  });

  test('Hp가 50이상 커지지 않는다',(){
    // given(준비)
    final cleric2 = Cleric(name: '성직자2', hp: 40, mp: 5);

    // when(실행)
    cleric2.selfAid();
    // then(검증)
    expect(cleric2.hp, equals(50));
    expect(cleric2.mp, equals(0));
  });

  test('기도하기',(){
    // given(준비)
    final cleric3 = Cleric(name: '성직자3', hp: 10, mp: 3);
    final beforeMp = cleric3.mp; // 실행전 mp
    
    // when(실행)
    final healScore = cleric3.pray(3); // 실제 회복된 량
    final afterMp = cleric3.mp;

    // then(검증)
    expect(afterMp, equals(beforeMp+healScore));
  });
}
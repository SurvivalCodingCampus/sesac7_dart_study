// 테스트 코드를 사용하기 위해 test 패키지를 사용함
import 'package:test/test.dart';
import 'package:modu_3_dart_study/2025-06-04/cleric.dart';

// test를 group 으로 묶어서 case 관리하기
void main(){
  test('hp가 50을 넘을 수 없고 mp가 5이하 일땐 실행되지 않는다',(){
    // given(준비)
    final cleric1 = Cleric(name: '성직자1', hp: 10, mp: 10);

    // when(1차 실행)
    cleric1.selfAid();

    // 계속 사용하는 값을 정의하고 의미를 확인하기 위해 명시해준다
    // 나중에 코드가 긴 경우 하나의 값만 변경해서 모든 테스트 케이스에 적용할 수 있다
    // 나중에 누가 봐도 이 코드를 이해하고 고칠 수 있게 의미가 있는 값을 상수화 한다
    // final maxHp = 50;
    // expect(cleric1.hp, maxHp);

    // (magic number?)의미있는 숫자인 경우
    // final in selfAidMp = 5;

    // then(검증)
    // 어떤 상황인지를 주석으로 추가 설명한다
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

  // 여러번 반복해서 확인해봐야함 for 활용
  // 경계값을 체크하고 경계값 밖 큰 값, 작은값을 확인하고 경계안의 값을 확인해서 모든 케이스를 확인했다고 확인한다
  
  test('기도하기',(){
    // given(준비)
    final cleric3 = Cleric(name: '성직자3', hp: 10, mp: 3);
    final beforeMp = cleric3.mp; // 실행전 mp
    
    // when(실행)
    final healScore = cleric3.pray(3); // 실제 회복된 량
    // pray 에 1부터 10까지의 숫자를 넣어서 확인해보는 것 해보기?
    final afterMp = cleric3.mp;

    // then(검증)
    expect(afterMp, equals(beforeMp+healScore));
  });
}


import 'package:modu_3_dart_study/cleric.dart';
import 'package:test/test.dart';

void main() {
  test('Cleric class - selfAid() lowers mp by 5 and reset hp to max hp ', (){
    // given(준비)
    final cleric = Cleric('Song');

    // when (실행)
    cleric.selfAid();

    // then (검증)
    expect(cleric.mp, equals(5));
    expect(cleric.hp, equals(50));

    // when (실행) - hp 가 최대값 이하인 30 일때
    cleric.hp = 30;
    cleric.selfAid();


    // then (검증)
    expect(cleric.mp, equals(0));
    expect(cleric.hp, equals(50));

    // when (실행)
    cleric.selfAid();

    // then (검증)
    expect(cleric.mp, equals(0));
  });

  test('Cleric class - pray() increases mp by the amount of pray seconds + random value up to 2, '
      'with the constraints of max mp value', (){
    // given(준비)
    final cleric = Cleric('Song');

    // when (실행)
    cleric.pray(2);

    // then (검증)
    expect(cleric.mp, equals(10));

    // when (실행) mp가 허용 최대치인 10 이하 일때 회복값이 더해진 값이 최대치를 넘기는 경우
    cleric.mp = 8;
    cleric.pray(3);

    // then (검증)
    expect(cleric.mp, equals(10));

    // when (실행) mp가 허용 최대치인 10 이하 일때 회복값이 더해진 값이 최대치를 넘기는 않는 경우
    cleric.mp = 2;
    int mpCovered = cleric.pray(3);

    // then (검증)
    expect(cleric.mp, equals(2 + mpCovered));

  });


}
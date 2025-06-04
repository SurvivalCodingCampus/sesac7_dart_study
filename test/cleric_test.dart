import 'package:modu_3_dart_study/cleric.dart';
import 'package:test/test.dart';

void main() {
  test('Cleric class - selfAid test', (){
    // given(준비)
    final cleric = Cleric('Song');

    // when (실행)
    cleric.selfAid();

    // then (검증)
    expect(cleric.mp, equals(5));


    // when (실행) - hp 가 최대값이하인 30
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

  test('Cleric class - pray test', (){
    // given(준비)
    final cleric = Cleric('Song');

    // when (실행)
    cleric.pray(2);

    // then (검증)
    expect(cleric.mp, equals(10));

    // when (실행)
    cleric.mp = 8;
    cleric.pray(3);

    // then (검증)
    expect(cleric.mp, equals(10));

    // when (실행)
    cleric.mp = 2;
    int mpCovered = cleric.pray(3);

    // then (검증)
    expect(cleric.mp, equals(2 + mpCovered));

  });


}
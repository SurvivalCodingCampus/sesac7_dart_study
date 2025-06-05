import 'package:modu_3_dart_study/cleric.dart';
import 'package:test/test.dart';

void main() {
  group('Cleric class -', () {
    test(
      'Given Cleric 클래스 when 인스턴스 생성 전이라도 then 최대 hp 와 최대 mp 값이 각각 50, 10 이어야',
      () {
        // given(준비)
        // when (실행)
        // then (검증)
        expect(Cleric.maxHp, 50);
        expect(Cleric.maxMp, 10);
      },
    );

    test(
      'Given Cleric 클래스 when 생성자에 name, hp, mp 지정 then 지정된 값으로 인스턴스 생성되어야',
      () {
        // given(준비)
        final clericArthur = Cleric("Arthur", hp: 40, mp: 5);
        // when (실행)
        // then (검증)
        expect(clericArthur.name, 'Arthur');
        expect(clericArthur.hp, 40);
        expect(clericArthur.mp, 5);
      },
    );

    test(
      'Given Cleric 클래스 when 생성자에 name, hp, 지정 then name과 hp는 지정된 값으로, mp는 최대값인 인스턴스 생성되어야',
      () {
        // given(준비)
        final clericArthur = Cleric("Arthur", hp: 35);
        // when (실행)
        // then (검증)
        expect(clericArthur.name, 'Arthur');
        expect(clericArthur.hp, 35);
        expect(clericArthur.mp, Cleric.maxMp);
      },
    );

    test(
      'Given Cleric 클래스 when 생성자에 name 만 지정 then name은 지정된 값으로, hp와 mp는 최대값인 인스턴스 생성되어야',
      () {
        // given(준비)
        final clericArthur = Cleric("Arthur");
        // when (실행)
        // then (검증)
        expect(clericArthur.name, 'Arthur');
        expect(clericArthur.hp, Cleric.maxHp);
        expect(clericArthur.mp, Cleric.maxMp);
      },
    );

    // test('Given Cleric 클래스 when 생성자에 name 을 지정하지 않으면 then 인스턴스 생성되지 않아야', () {
    //   // given(준비)
    //   final cleric = Cleric();
    //   // when (실행)
    //   // then (검증)
    // });

    test(
      'Cleric class - selfAid() lowers mp by 5 and resets hp to max hp ',
      () {
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
      },
    );

    test(
      'Cleric class - pray() increases mp by the amount of pray seconds + random value up to 2, '
      'with the constraints of max mp value',
      () {
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
      },
    );
  });
}

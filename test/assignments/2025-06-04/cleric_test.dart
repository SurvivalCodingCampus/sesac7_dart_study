import 'package:modu_3_dart_study/assignments/2025-06-04/cleric.dart';
import 'package:test/test.dart';

void main() {
  const List<int> randomWeight = [0, 1, 2];

  group('selfAid', () {
    test(
      'When Create a Cleric and use selfAid, Cleric has 50 hp and 5 mp.',
      () {
        // given
        final cleric = Cleric(name: 'name');

        // when
        cleric.selfAid();

        // then
        expect(cleric.hp, Cleric.maxHp);
        expect(cleric.mp, 5);
      },
    );

    test(
      'When Cleric has 6 mp and uses selfAid, Cleric has 50 hp and 1 mp.',
      () {
        // given
        final cleric = Cleric(name: 'name', mp: 6);

        // when
        cleric.selfAid();

        // then
        expect(cleric.hp, Cleric.maxHp);
        expect(cleric.mp, 1);
      },
    );

    test(
      'When Cleric has 5 mp and uses selfAid, Cleric has 50 hp and 0 mp.',
      () {
        // given
        final cleric = Cleric(name: 'name', mp: 5);

        // when
        cleric.selfAid();

        // then
        expect(cleric.hp, Cleric.maxHp);
        expect(cleric.mp, 0);
      },
    );

    test('When Cleric has 4 mp and uses selfAid, its fail.', () {
      // given
      final cleric = Cleric(name: 'name', mp: 4);

      // when
      cleric.selfAid();

      // then
      expect(cleric.hp, Cleric.maxHp);
      expect(cleric.mp, 4);
    });

    test(
      'When Cleric has 10 hp and uses selfAid, Cleric has 50 hp and 5 mp.',
      () {
        // given
        final cleric = Cleric(name: 'name', hp: 10);

        // when
        cleric.selfAid();

        // then
        expect(cleric.hp, Cleric.maxHp);
        expect(cleric.mp, 5);
      },
    );
  });

  group('pray', () {
    test('When Cleric pray for 0 seconds and it returns 0.', () {
      // given
      final cleric = Cleric(name: 'name');

      // when
      final result = cleric.pray(0);

      // then
      expect(result, 0);
    });

    test(
      'When Cleric has max mp, pray for 1 seconds and it returns 0. And Cleric has max mp.',
      () {
        // given
        final cleric = Cleric(name: 'name');

        // when
        final result = cleric.pray(1);

        // then
        expect(result, 0);
        expect(cleric.mp, Cleric.maxMp);
      },
    );

    test(
      'When Cleric has 5 mp, pray for 1 seconds and it returns 1~3. And Cleric has 6~8 mp.',
      () {
        // given
        final initialMp = 5;
        final praySeconds = 1;
        final cleric = Cleric(name: 'name', mp: initialMp);

        // when
        final result = cleric.pray(praySeconds);

        // then
        expect(
          randomWeight.map((weight) => weight + praySeconds).contains(result),
          isTrue,
        );
        expect(
          randomWeight
              .map((weight) => weight + initialMp + praySeconds)
              .contains(cleric.mp),
          isTrue,
        );
      },
    );

    test(
      'When Cleric has 0 mp, pray for 1 seconds and it returns 1~3. And Cleric has 1~3 mp.',
      () {
        // given
        final initialMp = 0;
        final praySeconds = 1;
        final cleric = Cleric(name: 'name', mp: initialMp);

        // when
        final result = cleric.pray(praySeconds);

        // then
        expect(
          randomWeight.map((weight) => weight + praySeconds).contains(result),
          isTrue,
        );
        expect(
          randomWeight
              .map((weight) => weight + initialMp + praySeconds)
              .contains(cleric.mp),
          isTrue,
        );
      },
    );

    test(
      'When Cleric has 9 mp, pray for 1 seconds and it returns 1. And Cleric has max mp.',
      () {
        // given
        final cleric = Cleric(name: 'name', mp: 9);

        // when
        final result = cleric.pray(1);

        // then
        expect(result, 1);
        expect(cleric.mp, Cleric.maxMp);
      },
    );
  });
}

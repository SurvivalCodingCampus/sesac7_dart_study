import 'package:modu_3_dart_study/assignments/cleric.dart';
import 'package:test/test.dart';

void main() {
  const List<int> randomWeight = [0, 1, 2];
  const String name = 'name';

  group('constructor', () {
    test('When create a Cleric with name, hp and mp are max.', () {
      // given
      // when
      final cleric = Cleric(name);

      // then
      expect(cleric.name, name);
      expect(cleric.hp, Cleric.maxHp);
      expect(cleric.mp, Cleric.maxMp);
    });

    test(
      'When create a Cleric with name and hp, name and hp are given value, mp are max.',
      () {
        // given
        final givenHp = 10;

        // when
        final cleric = Cleric(name, hp: givenHp);

        // then
        expect(cleric.name, name);
        expect(cleric.hp, givenHp);
        expect(cleric.mp, Cleric.maxMp);
      },
    );

    test(
      'When create a Cleric with name, hp, mp, then name, hp, mp are given value.',
      () {
        // given
        final givenHp = 10;
        final givenMp = 5;

        // when
        final cleric = Cleric(name, hp: givenHp, mp: givenMp);

        // then
        expect(cleric.name, name);
        expect(cleric.hp, givenHp);
        expect(cleric.mp, givenMp);
      },
    );
  });

  group('selfAid', () {
    test(
      'When create a Cleric and use selfAid, Cleric has 50 hp and 5 mp.',
      () {
        // given
        final cleric = Cleric(name);

        // when
        cleric.selfAid();

        // then
        expect(cleric.hp, Cleric.maxHp);
        expect(cleric.mp, Cleric.selfAidMp);
      },
    );

    test(
      'When Cleric has 6 mp and uses selfAid, Cleric has 50 hp and 1 mp.',
      () {
        // given
        final selfAidEdge = Cleric.selfAidMp + 1;
        final expectedMp = selfAidEdge - Cleric.selfAidMp;
        final cleric = Cleric(name, mp: selfAidEdge);

        // when
        cleric.selfAid();

        // then
        expect(cleric.hp, Cleric.maxHp);
        expect(cleric.mp, expectedMp);
      },
    );

    test(
      'When Cleric has 5 mp and uses selfAid, Cleric has 50 hp and 0 mp.',
      () {
        // given
        final expectedMp = Cleric.selfAidMp - Cleric.selfAidMp;
        final cleric = Cleric(name, mp: Cleric.selfAidMp);

        // when
        cleric.selfAid();

        // then
        expect(cleric.hp, Cleric.maxHp);
        expect(cleric.mp, expectedMp);
      },
    );

    test('When Cleric has 4 mp and uses selfAid, its fail.', () {
      // given
      final selfAidEdge = Cleric.selfAidMp - 1;
      final cleric = Cleric(name, mp: selfAidEdge);

      // when
      cleric.selfAid();

      // then
      expect(cleric.hp, Cleric.maxHp);
      expect(cleric.mp, selfAidEdge);
    });

    test(
      'When Cleric has 10 hp and uses selfAid, Cleric has 50 hp and 5 mp.',
      () {
        // given
        final lowHp = 10;
        final expectedMp = Cleric.maxMp - Cleric.selfAidMp;
        final cleric = Cleric(name, hp: lowHp);

        // when
        cleric.selfAid();

        // then
        expect(cleric.hp, Cleric.maxHp);
        expect(cleric.mp, expectedMp);
      },
    );
  });

  group('pray', () {
    test('When Cleric pray for 0 seconds and it returns 0.', () {
      // given
      final cleric = Cleric(name);

      // when
      final result = cleric.pray(Cleric.didNotPray);

      // then
      expect(result, Cleric.didNotPray);
    });

    test(
      'When Cleric has max mp, pray for 1 seconds and it returns 0. And Cleric has max mp.',
      () {
        // given
        final prayEdge = Cleric.didNotPray + 1;
        final expectedPrayResult = 0;
        final cleric = Cleric(name);

        // when
        final result = cleric.pray(prayEdge);

        // then
        expect(result, expectedPrayResult);
        expect(cleric.mp, Cleric.maxMp);
      },
    );

    test(
      'When Cleric has 5 mp, pray for 1 seconds and it returns 1~3. And Cleric has 6~8 mp.',
      () {
        // given
        final initialMp = 5;
        final prayEdge = Cleric.didNotPray + 1;
        final cleric = Cleric(name, mp: initialMp);

        // when
        final result = cleric.pray(prayEdge);

        // then
        expect(
          randomWeight.map((weight) => weight + prayEdge).contains(result),
          isTrue,
        );
        expect(
          randomWeight
              .map((weight) => weight + initialMp + prayEdge)
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
        final prayEdge = Cleric.didNotPray + 1;
        final cleric = Cleric(name, mp: initialMp);

        // when
        final result = cleric.pray(prayEdge);

        // then
        expect(
          randomWeight.map((weight) => weight + prayEdge).contains(result),
          isTrue,
        );
        expect(
          randomWeight
              .map((weight) => weight + initialMp + prayEdge)
              .contains(cleric.mp),
          isTrue,
        );
      },
    );

    test(
      'When Cleric has 9 mp, pray for 1 seconds and it returns 1. And Cleric has max mp.',
      () {
        // given
        final prayEdge = Cleric.didNotPray + 1;
        final cleric = Cleric(name, mp: 9);

        // when
        final result = cleric.pray(prayEdge);

        // then
        expect(result, prayEdge);
        expect(cleric.mp, Cleric.maxMp);
      },
    );
  });
}

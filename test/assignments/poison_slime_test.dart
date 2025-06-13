import 'package:modu_3_dart_study/assignments/hero.dart';
import 'package:modu_3_dart_study/assignments/poison_slime.dart';
import 'package:modu_3_dart_study/assignments/slime.dart';
import 'package:test/test.dart';

void main() {
  const String defaultSuffix = 'A';
  const int defaultPoisonCount = 1;
  const String defaultName = 'Hero';

  group('constructor', () {
    test(
      'When create slime with suffix, suffix is given value, hp is maxHp, poison count is 5.',
      () {
        // given
        // when
        final slime = PoisonSlime(defaultSuffix);

        // then
        expect(slime.suffix, defaultSuffix);
        expect(slime.hp, Slime.maxHp);
        expect(slime.poisonCount, PoisonSlime.maxPoisonCount);
      },
    );

    test(
      'When create slime with suffix, poison count, suffix and poison count are given value, hp is maxHp.',
      () {
        // given
        // when
        final slime = PoisonSlime(
          defaultSuffix,
          poisonCount: defaultPoisonCount,
        );

        // then
        expect(slime.suffix, defaultSuffix);
        expect(slime.hp, Slime.maxHp);
        expect(slime.poisonCount, defaultPoisonCount);
      },
    );
  });

  group('attack', () {
    //
    test('If poisonCount is 0 or less, hero\'s HP is reduced by 10.', () {
      // given
      final slime = PoisonSlime(
        defaultSuffix,
        poisonCount: PoisonSlime.minPoisonCount,
      );
      final hero = Hero(defaultName);
      final expectedHp = Hero.maxHp - Slime.damage;

      // when
      slime.attack(hero);

      // then
      expect(hero.hp, expectedHp);
    });

    test(
      'If poisonCount is 1, hero\'s HP is reduced by 20 and poisonCount becomes 0.',
      () {
        // given
        final slime = PoisonSlime(
          defaultSuffix,
          poisonCount: defaultPoisonCount,
        );
        final hero = Hero(defaultName);
        final expectedHp = 30;
        final expectedPoisonCount = 0;

        // when
        slime.attack(hero);

        // then
        expect(hero.hp, expectedHp);
        expect(slime.poisonCount, expectedPoisonCount);
      },
    );
  });
}

import 'package:modu_3_dart_study/assignments/hero.dart';
import 'package:modu_3_dart_study/assignments/slime.dart';
import 'package:test/test.dart';

void main() {
  const String defaultSuffix = 'A';
  const String defaultName = 'Hero';
  const int defaultHp = 40;

  group('constructor', () {
    test(
      'When create slime with suffix, suffix is given value, hp is maxHp.',
      () {
        // given
        // when
        final slime = Slime(defaultSuffix);

        // then
        expect(slime.suffix, defaultSuffix);
        expect(slime.hp, Slime.maxHp);
      },
    );

    test(
      'When create slime with suffix and hp, suffix and hp are given value.',
      () {
        // given
        // when
        final slime = Slime(defaultSuffix, hp: defaultHp);

        // then
        expect(slime.suffix, defaultSuffix);
        expect(slime.hp, defaultHp);
      },
    );
  });

  group('attack', () {
    test('Slime attacks the hero, the hero\'s HP is reduced by 10.', () {
      // given
      final hero = Hero(defaultName);
      final slime = Slime(defaultSuffix);
      final expectedHp = Hero.maxHp - Slime.damage;

      // when
      slime.attack(hero);

      // then
      expect(hero.hp, expectedHp);
    });
  });
}

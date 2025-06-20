import 'package:modu_3_dart_study/assignments/game/hero.dart';
import 'package:test/test.dart';

void main() {
  const String defaultName = 'Hero';
  const int defaultHp = 40;

  group('constructor', () {
    test('When create hero with name, name is given value, hp is maxHp.', () {
      // given
      // when
      final hero = Hero(defaultName);

      // then
      expect(hero.name, defaultName);
      expect(hero.hp, Hero.maxHp);
    });

    test('When create hero with name and hp, name and hp are given value.', () {
      // given
      // when
      final hero = Hero(defaultName, hp: defaultHp);

      // then
      expect(hero.name, defaultName);
      expect(hero.hp, defaultHp);
    });
  });

  group('decreaseHp', () {
    test('Hero has 50 HP and minus 50, HP becomes 0.', () {
      // given
      final hero = Hero(defaultName);
      final zeroHp = 0;

      // when
      hero.decreaseHp(Hero.maxHp);

      // then
      expect(hero.hp, zeroHp);
    });

    test('Hero has 50 HP and minus 51, HP becomes 0.', () {
      // given
      final hero = Hero(defaultName);
      final zeroHp = 0;
      final overMaxHp = Hero.maxHp + 1;

      // when
      hero.decreaseHp(overMaxHp);

      // then
      expect(hero.hp, zeroHp);
    });

    test('Hero has 0 HP and minus 1, it throws exception.', () {
      // given
      final zeroHp = 0;
      final hero = Hero(defaultName, hp: zeroHp);
      final damage = 1;

      // when
      // then
      expect(() => hero.decreaseHp(damage), throwsException);
    });
  });

  group('increaseHp', () {
    // max + 1, max - 1 + 2, 0 + max
    test('Hero has 50 HP and plus 1, it throws exception.', () {
      // given
      final hero = Hero(defaultName);
      final heal = 1;

      // when
      // then
      expect(() => hero.increaseHp(heal), throwsException);
    });

    test('Hero has 49 HP and plus 2, HP becomes 50.', () {
      // given
      final givenHp = Hero.maxHp - 1;
      final hero = Hero(defaultName, hp: givenHp);
      final heal = 2;

      // when
      hero.increaseHp(heal);

      // then
      expect(hero.hp, Hero.maxHp);
    });

    test('Hero has 0 HP and plus 50, HP becomes 50.', () {
      // given
      final hero = Hero(defaultName, hp: Hero.minHp);

      // when
      hero.increaseHp(Hero.maxHp);

      // then
      expect(hero.hp, Hero.maxHp);
    });
  });
}

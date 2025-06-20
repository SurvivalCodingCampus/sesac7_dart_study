import 'package:modu_3_dart_study/assignments/game/hero.dart';
import 'package:modu_3_dart_study/assignments/game/wand.dart';
import 'package:modu_3_dart_study/assignments/game/wizard.dart';
import 'package:test/test.dart';

void main() {
  const String defaultName = 'Wizard';
  const String heroName = 'Hero';
  const int defaultHp = 100;
  const int defaultMp = 10;

  late Wizard wizard;

  setUp(() {
    wizard = Wizard(defaultName, hp: defaultHp, mp: defaultMp);
  });

  group('constructor', () {
    test('When create a wizard, name, hp are given value.', () {
      // given
      // when
      final wizard = Wizard(defaultName, hp: defaultHp);

      // then
      expect(wizard.name, defaultName);
      expect(wizard.hp, defaultHp);
      expect(wizard.mp, Wizard.maxMp);
      expect(wizard.wand, null);
    });

    test('When create a wizard, name, hp, mp are given value.', () {
      // given
      // when
      final wizard = Wizard(defaultName, hp: defaultHp, mp: defaultMp);

      // then
      expect(wizard.name, defaultName);
      expect(wizard.hp, defaultHp);
      expect(wizard.mp, defaultMp);
      expect(wizard.wand, null);
    });

    test('When create a wizard, name, hp, mp, wand are given value.', () {
      // given
      final wandName = 'wand';
      final wandPower = 10.0;
      final wand = Wand(wandName, power: wandPower);
      // when
      final wizard = Wizard(
        defaultName,
        hp: defaultHp,
        mp: defaultMp,
        wand: wand,
      );

      // then
      expect(wizard.name, defaultName);
      expect(wizard.hp, defaultHp);
      expect(wizard.mp, defaultMp);
      expect(wizard.wand, wand);
    });
  });

  group('name', () {
    test('Put null to a name, it throws an exception.', () {
      // given

      // when
      // then
      expect(() => wizard.name = null, throwsException);
    });

    test('Put 2 characters to a name, it throws an exception.', () {
      // given
      final twoLengthName = 'ab';

      // when
      // then
      expect(() => wizard.name = twoLengthName, throwsException);
    });

    test('Put 3 characters to a name, name is given value.', () {
      // given
      final threeLengthName = 'abc';

      // when
      wizard.name = threeLengthName;

      // then
      expect(wizard.name, threeLengthName);
    });
  });

  group('hp', () {
    test('Put a number less than minHp into HP, HP will be minHp.', () {
      // given
      final negativeNumber = Wizard.minHp - 1;

      // when
      wizard.hp = negativeNumber;

      // then
      expect(wizard.hp, Wizard.minHp);
    });

    test('Put minHp into HP, HP will be minHp.', () {
      // given
      // when
      wizard.hp = Wizard.minHp;

      // then
      expect(wizard.hp, Wizard.minHp);
    });
  });

  group('mp', () {
    test('Put a number less than minMp into MP, it throws exception.', () {
      // given
      final lessThanMinMp = Wizard.minMp - 1;

      // when
      // then
      expect(() => wizard.mp = lessThanMinMp, throwsException);
    });

    test('Put minMp into MP, MP is given value.', () {
      // given

      // when
      wizard.mp = Wizard.minMp;

      // then
      expect(wizard.mp, Wizard.minMp);
    });
  });

  group('wand', () {
    test('Put null to a wand, it throws an exception.', () {
      // given
      final wandName = 'wand';
      final wandPower = 10.0;
      final wand = Wand(wandName, power: wandPower);
      final wizard = Wizard(
        defaultName,
        hp: defaultHp,
        mp: defaultMp,
        wand: wand,
      );

      // when
      // then
      expect(() => wizard.wand = null, throwsException);
    });

    test('Put wand to a wand, wand is given value.', () {
      // given
      final wandName = 'wand';
      final wandPower = 10.0;
      final wand = Wand(wandName, power: wandPower);

      // when
      wizard.wand = wand;

      // then
      expect(wizard.wand, wand);
    });
  });

  group('heal', () {
    test('If MP is less than 10, the hero\'s HP remains the same.', () {
      // given
      final lessThanHealCost = Wizard.healCost - 1;
      final expectedHp = 10;
      final wizard = Wizard(defaultName, hp: defaultHp, mp: lessThanHealCost);
      final hero = Hero(heroName, hp: expectedHp);

      // when
      wizard.heal(hero);

      // then
      expect(wizard.mp, lessThanHealCost);
      expect(hero.hp, expectedHp);
    });

    test(
      'If MP is greater than 10, the hero\'s HP is increased by 20 and the wizard\'s MP is decreased by 10.',
      () {
        // given
        final greaterThanHealCost = Wizard.healCost;
        final expectedMp = 0;
        final initialHp = 10;
        final expectedHp = initialHp + Wizard.healAmount;
        final wizard = Wizard(
          defaultName,
          hp: defaultHp,
          mp: greaterThanHealCost,
        );
        final hero = Hero(heroName, hp: initialHp);

        // when
        wizard.heal(hero);

        // then
        expect(wizard.mp, expectedMp);
        expect(hero.hp, expectedHp);
      },
    );
  });
}

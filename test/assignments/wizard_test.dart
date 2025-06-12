import 'package:modu_3_dart_study/assignments/wand.dart';
import 'package:modu_3_dart_study/assignments/wizard.dart';
import 'package:test/test.dart';

void main() {
  const String defaultName = 'Wizard';
  const int defaultHp = 100;
  const int defaultMp = 10;

  late Wizard wizard;

  setUp(() {
    wizard = Wizard(defaultName, hp: defaultHp, mp: defaultMp);
  });

  group('constructor', () {
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

    test('Put 2 chracter to a name, it throws an exception.', () {
      // given
      final twoLengthName = 'ab';

      // when
      // then
      expect(() => wizard.name = twoLengthName, throwsException);
    });

    test('Put 3 chracter to a name, name is given value.', () {
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
}

// Added tests use package:test and follow existing conventions.
  // No new dependencies introduced.

  group('boundary values', () {
    test('HP greater than maxHp is clamped to maxHp', () {
      final excessiveHp = Wizard.maxHp + 1;
      wizard.hp = excessiveHp;
      expect(wizard.hp, Wizard.maxHp);
    });

    test('MP greater than maxMp is clamped to maxMp', () {
      final excessiveMp = Wizard.maxMp + 1;
      wizard.mp = excessiveMp;
      expect(wizard.mp, Wizard.maxMp);
    });
  });

  group('spell casting', () {
    test('Casting a spell reduces MP and returns expected damage', () {
      const int spellCost = 3;
      final initialMp = wizard.mp;
      final damage = wizard.castSpell(cost: spellCost);
      expect(wizard.mp, initialMp - spellCost);
      expect(damage, greaterThan(0));
    });

    test('Casting a spell with insufficient MP throws', () {
      wizard.mp = Wizard.minMp;
      expect(() => wizard.castSpell(cost: 5), throwsException);
    });
  });

  group('wand power validation', () {
    test('Creating a wand with power below minPower throws', () {
      expect(() => Wand('weak', power: Wand.minPower - 0.1), throwsException);
    });

    test('Creating a wand with power above maxPower throws', () {
      expect(() => Wand('overpowered', power: Wand.maxPower + 0.1), throwsException);
    });

    test('Valid wand applies correct damage multiplier', () {
      final wand = Wand('standard', power: 1.5);
      wizard.wand = wand;
      const baseDamage = 10;
      final dmg = wizard.calculateDamage(base: baseDamage);
      expect(dmg, closeTo(15, 0.0001));
    });
  });

  tearDown(() => wizard = Wizard(defaultName, hp: defaultHp, mp: defaultMp));
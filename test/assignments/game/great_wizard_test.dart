import 'package:modu_3_dart_study/assignments/game/great_wizard.dart';
import 'package:modu_3_dart_study/assignments/game/hero.dart';
import 'package:test/test.dart';

void main() {
  const String defaultName = 'Wizard';
  const String heroName = 'Hero';
  const int defaultHp = 100;
  const int defaultMp = 10;

  group('constructor', () {
    test('When create a GreatWizard, name, hp are given value.', () {
      // given
      // when
      final wizard = GreatWizard(defaultName, hp: defaultHp);

      // then
      expect(wizard.name, defaultName);
      expect(wizard.hp, defaultHp);
      expect(wizard.mp, GreatWizard.maxMp);
      expect(wizard.wand, null);
    });

    test('When create a GreatWizard, name, hp, mp are given value.', () {
      // given
      // when
      final wizard = GreatWizard(defaultName, hp: defaultHp, mp: defaultMp);

      // then
      expect(wizard.name, defaultName);
      expect(wizard.hp, defaultHp);
      expect(wizard.mp, defaultMp);
      expect(wizard.wand, null);
    });
  });

  group('heal', () {
    test('If MP is less than 5, the hero\'s HP remains the same.', () {
      // given
      final lessThanHealCost = GreatWizard.healCost - 1;
      final expectedHp = 10;
      final wizard = GreatWizard(
        defaultName,
        hp: defaultHp,
        mp: lessThanHealCost,
      );
      final hero = Hero(heroName, hp: expectedHp);

      // when
      wizard.heal(hero);

      // then
      expect(wizard.mp, lessThanHealCost);
      expect(hero.hp, expectedHp);
    });

    test(
      'If MP is greater than 5, the hero\'s HP is increased by 25 and the wizard\'s MP is decreased by 5.',
      () {
        // given
        final greaterThanHealCost = GreatWizard.healCost;
        final expectedMp = 0;
        final initialHp = 10;
        final expectedHp = initialHp + GreatWizard.healAmount;
        final wizard = GreatWizard(
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

  group('superHeal', () {
    test('If MP is less than 50, the hero\'s HP remains the same.', () {
      // given
      final lessThanHealCost = GreatWizard.healCost - 1;
      final expectedHp = 10;
      final wizard = GreatWizard(
        defaultName,
        hp: defaultHp,
        mp: lessThanHealCost,
      );
      final hero = Hero(heroName, hp: expectedHp);

      // when
      wizard.superHeal(hero);

      // then
      expect(wizard.mp, lessThanHealCost);
      expect(hero.hp, expectedHp);
    });

    test(
      'If MP is greater than 50, the hero\'s HP is increased by maxHp and the wizard\'s MP is decreased by 50.',
      () {
        // given
        final greaterThanHealCost = GreatWizard.superHealCost;
        final expectedMp = 0;
        final initialHp = 10;
        final wizard = GreatWizard(
          defaultName,
          hp: defaultHp,
          mp: greaterThanHealCost,
        );
        final hero = Hero(heroName, hp: initialHp);

        // when
        wizard.superHeal(hero);

        // then
        expect(wizard.mp, expectedMp);
        expect(hero.hp, Hero.maxHp);
      },
    );
  });
}

import 'package:test/test.dart';
import 'package:modu_3_dart_study/assignments/2025-06-12/hero.dart';
import 'package:modu_3_dart_study/assignments/2025-06-12/wizard.dart';

void main() {
  group('GROUP : Constructor tests for Wizard\n', () {
    test('Wizard instance', () {
      //given
      Wizard wizard = Wizard('하인즈', hp: 100);
      //when
      //then
      expect(wizard.name, '하인즈');
      expect(wizard.hp, 100);
      //wizard has default mp of 100.
      expect(wizard.mp, 100);
      //wizard has default wand null
      expect(wizard.wand, null);
      //wizard has healamount 20
      expect(wizard.healAmount, 20);
      //wizard has healmanacost 10
      expect(wizard.healManaCost, 10);

      //when
      // setting wizard MP to negative integer should change it to zero
      wizard.mp = -5;
      //then
      expect(wizard.mp, 0);
    });
  });

  group('GROUP : Heal method test for Hero and Wizard\n', () {
    test('Hero and Wizard_heal method test : basic case', () {
      //given
      Hero hero = Hero('초보자', hp: 100);
      Wizard wizard = Wizard('하인즈', hp: 100);
      hero.hp = 70;
      //when
      wizard.heal(hero);
      //then
      // 70(set HP of hero) + 20(basic heal amount) = 90
      expect(hero.hp, 90);
      // 100(default MP of wizard) - 10(basic heal mana cost) = 90
      expect(wizard.mp, 90);
    });
    test('Hero and Wizard_heal method test : overheal case', () {
      //given
      Hero hero = Hero('초보자', hp: 100);
      Wizard wizard = Wizard('하인즈', hp: 100);
      hero.hp = 90;
      //when
      wizard.heal(hero);
      //then
      // 90(set HP of hero) + 20(basic heal amount) = 110 but revolve back to _maxHP value which is set to 100 at this point
      expect(hero.hp, 100);
      // 100(default MP of wizard) - 10(basic heal mana cost) = 90
      expect(wizard.mp, 90);
    });
    test('Hero and Wizard_heal method test : low mana case ', () {
      //given
      Hero hero = Hero('초보자', hp: 100);
      Wizard wizard = Wizard('하인즈', hp: 100);
      // set wizard MP to less than 10, which is the manacost of heal.
      wizard.mp = 9;
      //when
      wizard.heal(hero);
      //then
      // hero HP unchanged from base value of 100.
      expect(hero.hp, 100);
      // wizard mp unchanged from set value of 9. (Because the casting failed due to low mana)
      expect(wizard.mp, 9);
    });
  });
  group('GROUP : Constructor tests for GreatWizard\n', () {
    test('GreatWizard instance', () {
      //given
      GreatWizard wizard = GreatWizard('볼드모트', hp: 100);
      //when
      //then
      expect(wizard.name, '볼드모트');
      expect(wizard.hp, 100);
      // GreatWizard has default mp of 150.
      expect(wizard.mp, 150);
      // GreatWizard has default wand null
      expect(wizard.wand, null);
      // GreatWizard has healamount 25
      expect(wizard.healAmount, 25);
      // GreatWizard has healmanacost 5
      expect(wizard.healManaCost, 5);
      // GreatWizard has superHealManaCost 50
      expect(wizard.superHealManaCost, 50);
    });
  });
  group('GROUP : Heal method test for Hero and GreatWizard\n', () {
    test('Hero and GreatWizard_heal method test : basic case', () {
      //given
      Hero hero = Hero('초보자', hp: 100);
      GreatWizard wizard = GreatWizard('볼드모트', hp: 100);
      hero.hp = 70;
      //when
      wizard.heal(hero);
      //then
      // 70(set HP of hero) + 25(basic heal amount of great wizard) = 95
      expect(hero.hp, 95);
      // 150(default MP of greatwizard) - 5(basic heal mana cost of great wizard) = 145
      expect(wizard.mp, 145);
    });
    test('Hero and GreatWizard_heal method test : overheal case', () {
      //given
      Hero hero = Hero('초보자', hp: 100);
      GreatWizard wizard = GreatWizard('볼드모트', hp: 100);
      hero.hp = 90;
      //when
      wizard.heal(hero);
      //then
      // 90(set HP of hero) + 25(basic heal amount of greatwizard) = 115 but revolve back to _maxHP value which is set to 100 at this point
      expect(hero.hp, 100);
      // 150(default MP of greatwizard) - 5(basic heal mana cost of greatwizard) = 145
      expect(wizard.mp, 145);
    });
    test('Hero and Wizard_heal method test : low mana case ', () {
      //given
      Hero hero = Hero('초보자', hp: 100);
      GreatWizard wizard = GreatWizard('볼드모트', hp: 100);
      // set greatwizard MP to less than 5, which is the manacost of heal.
      wizard.mp = 4;
      //when
      wizard.heal(hero);
      //then
      // hero HP unchanged from base value of 100.
      expect(hero.hp, 100);
      // greatwizard mp unchanged from set value of 9. (Because the casting failed due to low mana)
      expect(wizard.mp, 4);
    });
  });
  group('GROUP : SuperHeal method test for Hero and GreatWizard\n', () {
    test('Hero and GreatWizard_superHeal method test : basic case', () {
      //given
      Hero hero = Hero('초보자', hp: 100);
      GreatWizard wizard = GreatWizard('볼드모트', hp: 100);
      hero.hp = 70;
      //when
      wizard.superHeal(hero);
      //then
      // hero hp set to maxHP(100)
      expect(hero.hp, 100);
      // 150(default MP of greatwizard) - 50(superheal mana cost of greatwizard) = 100
      expect(wizard.mp, 100);
    });
    test('Hero and Wizard_superHeal method test : low mana case ', () {
      //given
      Hero hero = Hero('초보자', hp: 100);
      GreatWizard wizard = GreatWizard('볼드모트', hp: 100);
      // set greatwizard MP to less than 5, which is the manacost of heal.
      wizard.mp = 49;
      //when
      wizard.superHeal(hero);
      //then
      // hero HP unchanged from base value of 100.
      expect(hero.hp, 100);
      // greatwizard mp unchanged from set value of 49. (Because the casting failed due to low mana)
      expect(wizard.mp, 49);
    });
  });
}

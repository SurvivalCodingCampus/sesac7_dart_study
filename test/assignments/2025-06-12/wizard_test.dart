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
      // Wizard has default mp 100.
      expect(wizard.mp, 100);
      // Wizard has default wand null
      expect(wizard.wand, null);
      // Wizard has healAmount 20
      expect(wizard.healAmount, 20);
      // Wizard has healManaCost 10
      expect(wizard.healManaCost, 10);

      //when
      // setting Wizard mp to negative integer should change it to zero
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
      // 70(set hp of Hero) + 20(healAmount of Wizard) = 90
      expect(hero.hp, 90);
      // 100(default mp of Wizard) - 10(healManaCost of Wizard) = 90
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
      // 90(set hp of Hero) + 20(healAmount of Wizard) = 110 but revolve back to _maxHP of Hero which is set to 100 at this point
      expect(hero.hp, 100);
      // 100(default mp of Wizard) - 10(healManaCost of Wizard) = 90
      expect(wizard.mp, 90);
    });
    test('Hero and Wizard_heal method test : low mana case ', () {
      //given
      Hero hero = Hero('초보자', hp: 100);
      Wizard wizard = Wizard('하인즈', hp: 100);
      // set Wizard mp to less than 10(healManaCost of Wizard)
      wizard.mp = 9;
      //when
      wizard.heal(hero);
      //then
      // Hero hp unchanged from base value of 100.
      expect(hero.hp, 100);
      // Wizard mp unchanged from set value of 9. (Because the casting failed due to low mp)
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
      // GreatWizard has default mp 150.
      expect(wizard.mp, 150);
      // GreatWizard has default wand null
      expect(wizard.wand, null);
      // GreatWizard has healAmount 25
      expect(wizard.healAmount, 25);
      // GreatWizard has healManaCost 5
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
      // 70(set hp of Hero) + 25(healAmount of GreatWizard) = 95
      expect(hero.hp, 95);
      // 150(default mp of GreatWizard) - 5(healManaCost of GreatWizard) = 145
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
      // 90(set hp of Hero) + 25(healAmount of GreatWizard) = 115 but revolve back to _maxHP of Hero which is set to 100 at this point
      expect(hero.hp, 100);
      // 150(default mp of GreatWizard) - 5(healManaCost of GreatWizard) = 145
      expect(wizard.mp, 145);
    });
    test('Hero and Wizard_heal method test : low mana case ', () {
      //given
      Hero hero = Hero('초보자', hp: 100);
      GreatWizard wizard = GreatWizard('볼드모트', hp: 100);
      // set GreatWizard mp to less than 5(healManaCost of GreatWizard)
      wizard.mp = 4;
      //when
      wizard.heal(hero);
      //then
      // Hero hp unchanged from base value of 100.
      expect(hero.hp, 100);
      // GreatWizard mp unchanged from set value of 9. (Because the casting failed due to low mp)
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
      // 150(default mp of GreatWizard) - 50(superHealManaCost of GreatWizard) = 100
      expect(wizard.mp, 100);
    });
    test('Hero and Wizard_superHeal method test : low mana case ', () {
      //given
      Hero hero = Hero('초보자', hp: 100);
      GreatWizard wizard = GreatWizard('볼드모트', hp: 100);
      // set GreatWizard mp to less than 50(superHealManaCost of GreatWizard)
      wizard.mp = 49;
      //when
      wizard.superHeal(hero);
      //then
      // Hero hp unchanged from base value of 100.
      expect(hero.hp, 100);
      // GreatWizard mp unchanged from set value of 49. (Because the casting failed due to low mp)
      expect(wizard.mp, 49);
    });
  });
}

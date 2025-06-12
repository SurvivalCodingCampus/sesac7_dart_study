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

  group('GROUP : Method test for Hero and Wizard\n', () {
    test('Hero and Wizard_heal method test : basic case', () {
      //given
      Hero hero = Hero('초보자', hp: 100);
      Wizard wizard = Wizard('하인즈', hp: 100);
      //when
      wizard.heal(hero);
      //then
      // 100(base HP of hero) + 20(basic heal amount) = 120
      expect(hero.hp, 120);
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
}

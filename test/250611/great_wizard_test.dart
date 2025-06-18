import 'package:modu_3_dart_study/250604/hero.dart';
import 'package:modu_3_dart_study/250604/slime.dart';
import 'package:modu_3_dart_study/250611/great_wizard.dart';
import 'package:modu_3_dart_study/250611/wand.dart';
import 'package:test/test.dart';

void main() {
  group('GreatWizard', () {
    test('heal테스트', () {
      Hero hero = Hero('hero', 100);
      Wand wand = Wand(name: 'wand', power: 50);
      GreatWizard greatWizard = GreatWizard('gwizard', 100, wand);

      int initialHeroHP = hero.hp;
      int intialGreatWizardMP = greatWizard.mp;

      //hero의 hp, 힐하면 +25
      //greatWizard의 mp는 힐하면 -5
      greatWizard.heal(hero);
      expect(hero.hp, equals(initialHeroHP + 25));
      expect(greatWizard.mp, equals(intialGreatWizardMP - 5));
    });

    test('superHeal테스트 - MP150에서 시작', () {
      Hero hero = Hero('hero', 100);
      Wand wand = Wand(name: 'wand', power: 50);
      GreatWizard greatWizard = GreatWizard('gwizard', 100, wand);
      Slime slime = Slime('A');

      int intialGreatWizardMP = greatWizard.mp;

      //hero의 hp, 슈퍼힐하면 max
      //greatWizard의 mp는 슈퍼힐하면 -50
      slime.attack(hero);
      slime.attack(hero);

      greatWizard.superHeal(hero);
      expect(hero.hp, equals(hero.maxHP));
      expect(greatWizard.mp, equals(intialGreatWizardMP - 50));
    });

    test('superHeal테스트 - MP50에서 시작', () {
      Hero hero = Hero('hero', 100);
      Wand wand = Wand(name: 'wand', power: 50);
      GreatWizard greatWizard = GreatWizard('gwizard', 100, wand, 50);
      Slime slime = Slime('A');

      //hero의 hp, 슈퍼힐하면 max
      //greatWizard의 mp는 슈퍼힐하면 -50
      slime.attack(hero);
      slime.attack(hero);

      greatWizard.superHeal(hero);
      expect(hero.hp, equals(hero.maxHP));
      expect(greatWizard.mp, equals(0));
    });

    test('superHeal테스트 - MP0에서 시작', () {
      Hero hero = Hero('hero', 100);
      Wand wand = Wand(name: 'wand', power: 50);
      GreatWizard greatWizard = GreatWizard('gwizard', 100, wand, 0);
      Slime slime = Slime('A');

      //hero의 hp, 슈퍼힐하면 max
      //greatWizard의 mp는 슈퍼힐하면 -50
      int initialHeroHP = hero.hp;

      slime.attack(hero); //90
      slime.attack(hero); //80

      greatWizard.superHeal(hero);
      expect(hero.hp, equals(initialHeroHP - Slime.attackDemage * 2));
      expect(greatWizard.mp, equals(0));
    });
  });
}

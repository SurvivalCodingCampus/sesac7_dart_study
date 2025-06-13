import 'package:modu_3_dart_study/250604/hero.dart';
import 'package:modu_3_dart_study/250611/wand.dart';
import 'package:modu_3_dart_study/250611/wizard.dart';
import 'package:test/test.dart';

void main() {
  group('Wizard\n', () {
    test('heal 테스트 - hp를 20회복시키고, mp를 10소모', () {
      Wand wand = Wand(name: 'wand', power: 50);
      Wizard wizard = Wizard('wizard', 100, wand);
      Hero hero = Hero('hero', 100);

      int initialWizardMP = wizard.mp;
      int initialHeroHP = hero.hp;

      do {
        wizard.heal(hero);

        //hero.hp는 100이었으므로 120
        //wizard.mp는 100이었으므로 90
        initialWizardMP -= 10;
        initialHeroHP += 20;

        expect(hero.hp, equals(initialHeroHP));
        expect(wizard.mp, equals(initialWizardMP));
      } while (wizard.mp > 0);
    });

    test('heal 테스트 - hp를 20회복시키고, mp를 10소모', () {
      Wand wand = Wand(name: 'wand', power: 50);
      Wizard wizard = Wizard('wizard', 0, wand, 0);
      Hero hero = Hero('hero', 10);

      wizard.heal(hero);

      //wizard.mp는 0이었으므로 heal실패
      //hero.hp는 10이었으므로, 그대로 10

      expect(hero.hp, equals(10));
      expect(wizard.mp, equals(0));
    });
  });
}

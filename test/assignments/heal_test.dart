import 'package:modu_3_dart_study/assignments/great_wizard.dart';
import 'package:modu_3_dart_study/assignments/hero.dart';
import 'package:modu_3_dart_study/assignments/wand.dart';
import 'package:modu_3_dart_study/assignments/wizard.dart';
import 'package:test/test.dart';

void main() {
  group('heal test', () {
    test('heal 사용시 hp 20 회복되고 mp는 10 줄어드는 테스트', () {
      final wand = Wand('wand1', 0.5);
      final wizard = Wizard('wizard1', 100, wand: wand);
      final hero = Hero('hero1', 50, 100);

      wizard.heal(hero);

      // 70 출력 테스트
      expect(hero.hp, 70);
      // 90 출력 테스트
      expect(wizard.mp, 90);
    });

    test('mp 부족할 때 heal 못쓰는 테스트', () {
      final wand = Wand('wand1', 0.5);
      // mp 부족하게 설정
      final wizard = Wizard('wizard1', 100, mp: 9, wand: wand);
      final hero = Hero('hero1', 50, 100);

      wizard.heal(hero);

      // 회복 안 됨
      expect(hero.hp, 50);
      // 힐 안 됨
      expect(wizard.mp, 9);
    });
  });

  group('GreatWizard test', () {
    test('mp가 충분하면 hero hp 25 회복 후 mp 감소 테스트', () {
      final wand = Wand('wand1', 0.8);
      final hero = Hero('hero1', 50, 100);
      final greatWizard = GreatWizard('wizard1', 100, wand: wand);

      greatWizard.heal(hero);

      // hp 75 테스트
      expect(hero.hp, 75);

      // hp 145 테스트
      expect(greatWizard.mp, 145);
    });

    test('mp가 5보다 부족하면 heal 못쓰는 테스트', () {
      final wand = Wand('wand2', 0.8);
      final hero = Hero('hero2', 50, 100);
      final greatWizard = GreatWizard('wizard2', 100, wand: wand);
      greatWizard.mp = 3;

      greatWizard.heal(hero);

      expect(hero.hp, 50);
      expect(greatWizard.mp, 3);
    });

    test('mp가 충분하면 hero hp 최대로 올리는 테스트', () {
      final wand = Wand('wand3', 0.8);
      final hero = Hero('hero3', 30, 100);
      final greatWizard = GreatWizard('wizard3', 100, wand: wand);

      greatWizard.superHeal(hero);

      // maxHp
      expect(hero.hp, 100);

      // mp 100 남은지 테스트
      expect(greatWizard.mp, 100);
    });

    test('mp가 부족하면 super heal 못쓰는 테스트', () {
      final wand = Wand('wand4', 0.8);
      final hero = Hero('hero4', 30, 100);
      final greatWizard = GreatWizard('wizard4', 100, wand: wand);
      greatWizard.mp = 20;

      greatWizard.superHeal(hero);

      expect(hero.hp, 30);
      expect(greatWizard.mp, 20);
    });
  });
}

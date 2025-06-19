import 'package:modu_3_dart_study/game_jrpg/hero.dart';
import 'package:modu_3_dart_study/game_jrpg/wand.dart';
import 'package:modu_3_dart_study/game_jrpg/wizard.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('Wizard 클래스 타당성 검사 테스트', () {
    final String testName = '';
    final int initialHp = 0;
    final int minMp = 0;
    final int lessMinMp = -1;
    final int minHp = 0;
    final int negativeHp = -1;
    final int nonNegativeHp = 100;
    final int wizardHp = 100;

    final wizard = Wizard(name: testName, hp: initialHp);

    test('Wizard 이름이 3글자 이상인 경우와 그렇지 않은 경우', () {
      final String threeLettersName = 'abc';
      final String lessThreeLettersName = 'ab';

      expect(() => wizard.name = threeLettersName, returnsNormally);
      expect(() => wizard.name = lessThreeLettersName, throwsException);
    });

    test('Wizard 이름이 null인 경우', () {
      final String? nullName = null;

      expect(() => wizard.name = nullName, throwsException);
    });

    test('Wizard가 생성된 이후에 Wand에 null이 들어오는 경우와 아닌 경우', () {
      final Wand? nullWand = null;
      final Wand wand = Wand(name: '지팡이', power: 1.0);

      expect(() => wizard.wand = nullWand, throwsException);
      expect(() => wizard.wand = wand, returnsNormally);
    });

    test('Wizard mp가 0 이상인 경우와 그렇지 않은 경우', () {
      expect(() => wizard.mp = minMp, returnsNormally);
      expect(() => wizard.mp = lessMinMp, throwsException);
    });

    test('Wizard hp가 음수인 경우와 그렇지 않은 경우', () {
      final wizardForTestHp = Wizard(name: testName, hp: initialHp);

      wizardForTestHp.hp = negativeHp;

      expect(() => wizard.hp = nonNegativeHp, returnsNormally);
      expect(wizardForTestHp.hp == minHp, equals(true));
    });

    group('Wizard heal() 테스트', () {
      final int useMp = 10;
      final int healHp = 20;
      final int healCount = 11;

      test('초기 mp heal() 테스트', () {
        int defaultMp = 100;
        int heroHp = 100;
        final hero = Hero(name: testName, hp: heroHp);
        final defaultMpWizard = Wizard(name: testName, hp: wizardHp);

        expect(defaultMpWizard.mp == defaultMp, equals(true));
        expect(hero.hp == heroHp, equals(true));

        for (int i = 0; i < healCount; i++) {
          defaultMpWizard.heal(hero);

          // heal할 mp가 있을 때
          if (defaultMp >= useMp) {
            defaultMp -= useMp;
            heroHp += healHp;

            expect(defaultMpWizard.mp == defaultMp, equals(true));
            expect(hero.hp == heroHp, equals(true));
          }

          expect(defaultMpWizard.mp == defaultMp, equals(true));
          expect(hero.hp == heroHp, equals(true));
        }
      });

      test('부족한 mp heal() 테스트', () {
        final int lessMp = 9;
        final int heroHp = 100;

        final hero = Hero(name: testName, hp: heroHp);
        final lessMpWizard = Wizard(name: testName, hp: wizardHp, mp: lessMp);

        expect(lessMpWizard.mp == lessMp, equals(true));
        expect(hero.hp == heroHp, equals(true));

        for (int i = 0; i < healCount; i++) {
          lessMpWizard.heal(hero);

          expect(lessMpWizard.mp == lessMp, equals(true));
          expect(hero.hp == heroHp, equals(true));
        }
      });

      test('충분한 mp heal() 테스트', () {
        int enoughMp = 500;
        int heroHp = 100;
        final hero = Hero(name: testName, hp: heroHp);
        final enoughMpWizard = Wizard(
          name: testName,
          hp: wizardHp,
          mp: enoughMp,
        );

        expect(enoughMpWizard.mp == enoughMp, equals(true));
        expect(hero.hp == heroHp, equals(true));

        for (int i = 0; i < healCount; i++) {
          enoughMpWizard.heal(hero);

          // heal할 mp가 있을 때
          if (enoughMp >= useMp) {
            enoughMp -= useMp;
            heroHp += healHp;

            expect(enoughMpWizard.mp == enoughMp, equals(true));
            expect(hero.hp == heroHp, equals(true));
          }

          expect(enoughMpWizard.mp == enoughMp, equals(true));
          expect(hero.hp == heroHp, equals(true));
        }
      });
    });
  });
}

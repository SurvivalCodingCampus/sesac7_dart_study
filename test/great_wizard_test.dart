import 'package:modu_3_dart_study/great_wizard.dart';
import 'package:modu_3_dart_study/hero.dart';
import 'package:modu_3_dart_study/wizard.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('Wizard 클래스를 상속받은 GreatWizard 클래스 테스트', () {
    final String testName = '대마법사';
    final int testHp = 100;
    final int defaultMp = 100;
    final int healCount = 40;
    final int defaultGreatMp = 150;

    test('상속받은 mp 기본값 변경 체크', () {
      final wizard = Wizard(name: testName, hp: testHp);
      final greatWizard = GreatWizard(name: testName, hp: testHp);

      expect(wizard.mp, equals(defaultMp));
      expect(greatWizard.mp != wizard.mp, equals(true));
      expect(greatWizard.mp, equals(defaultGreatMp));
    });

    group('GreatWizard heal() 테스트', () {
      final int useMp = 10;
      final int healHp = 20;

      test('초기 mp heal() 테스트', () {
        int defaultMp = defaultGreatMp;
        int heroHp = 100;
        final hero = Hero(name: testName, hp: testHp);
        final defaultMpGreatWizard = GreatWizard(name: testName, hp: testHp);

        expect(defaultMpGreatWizard.mp == defaultMp, equals(true));
        expect(hero.hp == heroHp, equals(true));

        for (int i = 0; i < healCount; i++) {
          defaultMpGreatWizard.heal(hero);

          // heal할 mp가 있을 때
          if (defaultMp >= useMp) {
            defaultMp -= useMp;
            heroHp += healHp;

            expect(defaultMpGreatWizard.mp == defaultMp, equals(true));
            expect(hero.hp == heroHp, equals(true));
          }

          expect(defaultMpGreatWizard.mp == defaultMp, equals(true));
          expect(hero.hp == heroHp, equals(true));
        }
      });

      test('부족한 mp heal() 테스트', () {
        final int lessMp = 4;
        final int heroHp = 100;

        final hero = Hero(name: testName, hp: testHp);
        final lessMpGreatWizard = GreatWizard(
          name: testName,
          hp: testHp,
          mp: lessMp,
        );

        expect(lessMpGreatWizard.mp == lessMp, equals(true));
        expect(hero.hp == heroHp, equals(true));

        for (int i = 0; i < healCount; i++) {
          lessMpGreatWizard.heal(hero);

          expect(lessMpGreatWizard.mp == lessMp, equals(true));
          expect(hero.hp == heroHp, equals(true));
        }
      });

      test('충분한 mp heal() 테스트', () {
        int enoughMp = 750;
        int heroHp = 100;
        final hero = Hero(name: testName, hp: testHp);
        final enoughMpWizard = GreatWizard(
          name: testName,
          hp: testHp,
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

    group('GreatWizard superHeal() 테스트', () {
      final int useMp = 50;
      final int heroNotFullHp = 50;

      test('초기 mp superHeal() 테스트', () {
        int defaultMp = defaultGreatMp;
        int heroCurrentHp = heroNotFullHp;
        final hero = Hero(name: testName, hp: testHp);
        final defaultMpGreatWizard = GreatWizard(name: testName, hp: testHp);

        hero.hp = heroCurrentHp;

        expect(defaultMpGreatWizard.mp == defaultMp, equals(true));
        expect(hero.hp == heroCurrentHp, equals(true));

        defaultMpGreatWizard.superHeal(hero);

        // heal할 mp가 있을 때
        if (defaultMp >= useMp) {
          defaultMp -= useMp;
          heroCurrentHp = hero.maxHp;

          expect(defaultMpGreatWizard.mp == defaultMp, equals(true));
          expect(hero.hp == hero.maxHp, equals(true));
        }

        expect(defaultMpGreatWizard.mp == defaultMp, equals(true));
        expect(hero.hp == heroCurrentHp, equals(true));
      });

      test('부족한 mp superHeal() 테스트', () {
        final int lessMp = 4;
        final int heroCurrentHp = heroNotFullHp;

        final hero = Hero(name: testName, hp: testHp);
        final lessMpGreatWizard = GreatWizard(
          name: testName,
          hp: testHp,
          mp: lessMp,
        );

        hero.hp = heroCurrentHp;

        expect(lessMpGreatWizard.mp == lessMp, equals(true));
        expect(hero.hp == heroCurrentHp, equals(true));

        lessMpGreatWizard.heal(hero);

        expect(lessMpGreatWizard.mp == lessMp, equals(true));
        expect(hero.hp == heroCurrentHp, equals(true));
        expect(hero.maxHp == heroCurrentHp, equals(false));
      });

      test('충분한 mp superHeal() 테스트', () {
        int enoughMp = 500;
        int heroCurrentHp = heroNotFullHp;
        final hero = Hero(name: testName, hp: testHp);
        final enoughMpWizard = GreatWizard(
          name: testName,
          hp: testHp,
          mp: enoughMp,
        );

        hero.hp = heroCurrentHp;

        expect(enoughMpWizard.mp == enoughMp, equals(true));
        expect(hero.hp == heroCurrentHp, equals(true));

        enoughMpWizard.superHeal(hero);

        // heal할 mp가 있을 때
        if (enoughMp >= useMp) {
          enoughMp -= useMp;
          heroCurrentHp = hero.maxHp;

          expect(enoughMpWizard.mp == enoughMp, equals(true));
          expect(hero.maxHp == heroCurrentHp, equals(true));
          expect(hero.hp == heroCurrentHp, equals(true));

          expect(enoughMpWizard.mp == enoughMp, equals(true));
          expect(hero.hp == heroCurrentHp, equals(true));
        }
      });
    });
  });
}

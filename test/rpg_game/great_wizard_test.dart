import 'package:modu_3_dart_study/rpg_game/great_wizard.dart';
import 'package:modu_3_dart_study/rpg_game/hero.dart';
import 'package:modu_3_dart_study/rpg_game/wand.dart';
import 'package:test/test.dart';

void main() {
  group('GreatWizard test', () {
    test('생성자 테스트: mp 초기값이 150으로 초기화되는지?', () {
      // given
      final int testHp = 50;
      final double testPower = 5.0;

      // when & then
      for (int i = 0; i < 10; i++) {
        final Wand testWand = Wand(name: '견습 지팡이', power: testPower + i);
        final GreatWizard wizard = GreatWizard(
          name: '이학민',
          hp: testHp + i,
          wand: testWand,
        );

        expect(wizard.name, equals('이학민'));
        expect(wizard.hp, equals(testHp + i));
        expect(wizard.mp, equals(GreatWizard.greatWizMpInit)); // 150
        expect(wizard.wand, equals(testWand));
      }
    });

    test('Wizard 클래스를 상속받아 사용 중인 것이 맞는지? (Wizard 클래스의 속성에 접근 가능한지?) ', () {
      // given
      final int testHp = 50;
      final double testPower = 5.0;
      final int testInputHp = 30;
      final int testInputMp = 100;
      final String testInputName = '카리나';
      final Wand testWand = Wand(name: '견습 지팡이', power: testPower);
      final GreatWizard wizard = GreatWizard(
        name: '이학민',
        hp: testHp,
        wand: testWand,
      );

      // when & then
      // 상속 받았기 때문에 GreatWizard 인스턴스도 Wizard 클래스의 프로퍼티 사용 가능.
      expect(() => wizard.hp = testInputHp, returnsNormally);
      expect(wizard.hp, equals(testInputHp));
      expect(() => wizard.mp = testInputMp, returnsNormally);
      expect(wizard.mp, equals(testInputMp));
      expect(() => wizard.name = testInputName, returnsNormally);
      expect(wizard.name, equals(testInputName));
    });

    test('재정의된 heal이 제대로 작동하는지? (hero hp 25 회복, 본인 mp 5 소모)', () {
      // given
      final int testHp = 50;
      final double testPower = 5.0;
      final int testDamage = 50;
      final Wand testWand = Wand(name: '견습 지팡이', power: testPower);
      final GreatWizard wizard = GreatWizard(
        name: '이학민',
        hp: testHp,
        wand: testWand,
      );
      final Hero hero = Hero(name: '카리나', hp: testHp);

      // when
      hero.hp -= testDamage;

      // then
      // hero의 hp를 0으로 설정했을 때, 정해진 회복량만큼 잘 회복되는지? mp 소모는 잘 하는지?
      expect(() => wizard.heal(hero), returnsNormally);
      expect(hero.hp, equals(GreatWizard.greatWizHealHpIncrease));
      expect(
        wizard.mp,
        equals(GreatWizard.greatWizMpInit - GreatWizard.greatWizHealMpCost),
      );
    });

    test('재정의된 heal을 시전할 때 회복량이 hp 최대치를 넘어갈 시 hp를 최대치로 잘 보정하는지?', () {
      // given
      final int testHp = 50;
      final double testPower = 5.0;
      final int testDamage1 = 25; // 피해 수치 == 회복량일 경우
      final int testDamage2 = 10; // 회복량이 hp 최대치를 넘어갈 경우
      final int testDamage3 = 0; // 풀피인 경우
      final Wand testWand = Wand(name: '견습 지팡이', power: testPower);
      final GreatWizard wizard = GreatWizard(
        name: '이학민',
        hp: testHp,
        wand: testWand,
      );
      final Hero hero = Hero(name: '카리나', hp: testHp);

      // when & then
      // 케이스 1번: 피해 수치 == 회복량일 경우
      // 케이스 2번: 회복량이 hp 최대치를 넘어갈 경우
      // 케이스 3번: 풀피인 경우
      for (int i = 0; i < 3; i++) {
        final int damage;
        if (i == 0) {
          damage = testDamage1;
        } else if (i == 1) {
          damage = testDamage2;
        } else {
          damage = testDamage3;
        }

        hero.hp -= damage;
        expect(() => wizard.heal(hero), returnsNormally); // 힐이 정상 사용되는지
        expect(hero.hp, equals(testHp)); // hp 잔여량이 hp 최대치를 넘어가진 않는지
        expect(
          wizard.mp,
          equals(GreatWizard.greatWizMpInit - GreatWizard.greatWizHealMpCost),
        ); // 의도된 mp 소모량만큼만 소모됐는지
        hero.hp = testHp;
        wizard.mp = GreatWizard.greatWizMpInit;
      }
    });

    test('superHeal이 제대로 작동하는지? (hero hp 전부 회복, 본인 mp 50 소모)', () {
      // given
      final int testHp = 50;
      final double testPower = 5.0;
      final int testDamage1 = 50; // hp가 0인 경우
      final int testDamage2 = 25; // 50%인 경우
      final int testDamage3 = 0; // 풀피인 경우
      final Wand testWand = Wand(name: '견습 지팡이', power: testPower);
      final GreatWizard wizard = GreatWizard(
        name: '이학민',
        hp: testHp,
        wand: testWand,
      );
      final Hero hero = Hero(name: '카리나', hp: testHp);

      // when & then
      // 케이스 1번: hp가 0인 경우
      // 케이스 2번: 50%인 경우
      // 케이스 3번: 풀피인 경우
      for (int i = 0; i < 3; i++) {
        final int damage;
        if (i == 0) {
          damage = testDamage1;
        } else if (i == 1) {
          damage = testDamage2;
        } else {
          damage = testDamage3;
        }

        hero.hp -= damage;
        expect(() => wizard.superHeal(hero), returnsNormally); // 슈퍼 힐이 정상 사용되는지
        expect(hero.hp, equals(testHp)); // hp를 최대치까지 회복 시켜주는지
        expect(
          wizard.mp,
          equals(
            GreatWizard.greatWizMpInit - GreatWizard.greatWizSuperHealMpCost,
          ),
        ); // 의도된 mp 소모량만큼만 소모됐는지
        hero.hp = testHp;
        wizard.mp = GreatWizard.greatWizMpInit;
      }
    });

    test('mp가 부족할 때는 superHeal을 사용할 수 없다', () {
      // given
      final int testHp = 50;
      final double testPower = 5.0;
      final int testDamage = 50;
      final Wand testWand = Wand(name: '견습 지팡이', power: testPower);
      final GreatWizard wizard = GreatWizard(
        name: '이학민',
        hp: testHp,
        wand: testWand,
      );
      final Hero hero = Hero(name: '카리나', hp: testHp);

      // mp 경계값 생성
      final int cannotSuperHealStandard1 = 49;
      final int cannotSuperHealStandard2 = 50;
      final int cannotSuperHealStandard3 = 51;

      // when & then
      // mp를 음수로 설정할 경우 Exception 발생
      // mp가 49인 경우(모자란 경우) 먼저 실시
      int mpOfWizard =
          cannotSuperHealStandard1; // mpOfWizard는 wizard의 현재 mp 잔여량

      wizard.mp = mpOfWizard;
      hero.hp -= testDamage;
      wizard.superHeal(hero);

      expect(
        hero.hp == hero.hpMax,
        false,
      ); // 슈퍼 힐이 사용됐다면 최대치까지 회복됐을 것이므로 true일 것이고, 아니라면 false일 것임.
      expect(
        wizard.mp == mpOfWizard,
        true,
      ); // 슈퍼 힐이 사용됐다면 mp가 소비됐을 것이므로 값이 달라서 false일 것이고, 아니라면 true일 것임.

      wizard.mp = GreatWizard.greatWizMpInit;
      hero.hp = hero.hpMax;

      // 사용 가능한 mp 범위의 경우
      for (int i = 0; i < 2; i++) {
        if (i == 0) {
          mpOfWizard = cannotSuperHealStandard2;
        } else {
          mpOfWizard = cannotSuperHealStandard3;
        }

        wizard.mp = mpOfWizard;
        hero.hp -= testDamage;
        wizard.superHeal(hero);

        expect(
          hero.hp == hero.hpMax,
          true,
        ); // 슈퍼 힐이 사용됐다면 최대치까지 회복됐을 것이므로 true일 것이고, 아니라면 false일 것임.
        expect(
          wizard.mp == mpOfWizard,
          false,
        ); // 슈퍼 힐이 사용됐다면 mp가 소비됐을 것이므로 값이 달라서 false일 것이고, 아니라면 true일 것임.

        wizard.mp = GreatWizard.greatWizMpInit;
        hero.hp = hero.hpMax;
      }
    });
  });
}

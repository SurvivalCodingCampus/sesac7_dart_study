import 'package:modu_3_dart_study/hero.dart';
import 'package:modu_3_dart_study/wand.dart';
import 'package:modu_3_dart_study/wizard.dart';
import 'package:test/test.dart';

void main() {
  group('wizard test', () {
    test('생성자 테스트, ', () {
      // given
      final int testHp = 50;
      final double testPower = 5.0;

      // when & then
      for (int i = 0; i < 10; i++) {
        final Wand testWand = Wand(name: '견습 지팡이', power: testPower + i);
        final Wizard wizard = Wizard(
          name: '이학민',
          hp: testHp + i,
          wand: testWand,
        );

        expect(wizard.name, equals('이학민'));
        expect(wizard.hp, equals(testHp + i));
        expect(wizard.mp, equals(Wizard.mpInit)); // 100
        expect(wizard.wand, equals(testWand));
      }
    });

    test('마법사의 이름이 너무 짧게(3문자 미만) 설정되었을 경우', () {
      // given
      final String testName1 = '홍';
      final String testName2 = '길동';
      final int testHp = 50;
      final double testPower = 5.0;
      final Wand testWand = Wand(name: '견습 지팡이', power: testPower);
      final Wizard wizard1 = Wizard(name: '이학민', hp: testHp, wand: testWand);
      final Wizard wizard2 = Wizard(name: '카리나', hp: testHp, wand: testWand);

      // when & then
      expect(() => wizard1.name = testName1, throwsException);
      expect(() => wizard2.name = testName2, throwsException);
    });

    test('마법사가 생성된 후 지팡이 정보를 null로 설정했을 때', () {
      // given
      final int testHp = 50;
      final double testPower = 5.0;
      final Wand testWand1 = Wand(name: '견습 지팡이1', power: testPower);
      final Wand testWand2 = Wand(name: '견습 지팡이2', power: testPower);
      Wizard wizard = Wizard(name: '이학민', hp: testHp, wand: testWand1);

      // when & then
      expect(() => wizard.wand = null, throwsException);
      expect(
        () => wizard = Wizard(name: '이학민', hp: testHp, wand: testWand2),
        returnsNormally,
      );
      expect(() => wizard.wand = null, throwsException);
    });

    test('마법사의 MP가 음수로 설정되었을 경우', () {
      // given
      final int testHp = 50;
      final double testPower = 5.0;
      final Wand testWand = Wand(name: '견습 지팡이', power: testPower);
      final Wizard wizard = Wizard(name: '이학민', hp: testHp, wand: testWand);

      // 정수 경계값 설정
      final int testWrongMp1 = 1;
      final int testWrongMp2 = 0;
      final int testWrongMp3 = -1;

      // when & then
      expect(() => wizard.mp = testWrongMp1, returnsNormally);
      expect(() => wizard.mp = testWrongMp2, returnsNormally);
      expect(() => wizard.mp = testWrongMp3, throwsException);
    });

    test('마법사의 HP가 음수로 설정될 경우', () {
      // given
      final int testHp = 50;
      final double testPower = 5.0;
      final Wand testWand = Wand(name: '견습 지팡이', power: testPower);
      final Wizard wizard1 = Wizard(name: '이학민', hp: testHp, wand: testWand);

      // 정수 경계값 설정
      final int testWrongHp1 = 1;
      final int zeroHp = 0;
      final int testWrongHp2 = -1;

      // when & then
      wizard1.hp = testWrongHp1;
      expect(wizard1.hp, equals(testWrongHp1));
      expect(() => wizard1.hp = testWrongHp1, returnsNormally);

      wizard1.hp = zeroHp;
      expect(wizard1.hp, equals(zeroHp));
      expect(() => wizard1.hp = zeroHp, returnsNormally);

      wizard1.hp = testWrongHp2;
      expect(wizard1.hp, equals(zeroHp)); // hp 음수로 설정 시 0으로 보정
      expect(
        () => wizard1.hp = testWrongHp2,
        returnsNormally,
      ); // 0으로 보정된다고 해서 예외 처리가 되진 않음
    });

    test('힐 시전 시 hero의 hp를 20 정상적으로 회복시키고 본인의 mp를 10 정상적으로 소모하는지?', () {
      // given
      final int testHp = 50;
      final double testPower = 5.0;
      final int testDamage = 50;
      final Wand testWand = Wand(name: '견습 지팡이', power: testPower);
      final Wizard wizard = Wizard(name: '이학민', hp: testHp, wand: testWand);
      final Hero hero = Hero(name: '카리나', hp: testHp);

      // when
      hero.hp -= testDamage;

      // then
      // hero의 hp를 0으로 설정했을 때, 정해진 회복량만큼 잘 회복되는지? mp 소모는 잘 하는지?
      expect(() => wizard.heal(hero), returnsNormally); // 힐이 정상 작동하는지
      expect(hero.hp, equals(Wizard.healHpIncrease)); // 의도된 회복량만큼 회복하는지
      expect(
        wizard.mp,
        equals(Wizard.mpInit - Wizard.healMpCost), // 의도된 mp 소모량만큼 소모하는지
      );
    });

    test('heal을 시전할 때 회복량이 hp 최대치를 넘어갈 시 hp를 최대치로 잘 보정하는지?', () {
      // given
      final int testHp = 50;
      final double testPower = 5.0;
      final int testDamage1 = 20; // 피해 수치 == 회복량일 경우
      final int testDamage2 = 10; // 회복량이 hp 최대치를 넘어갈 경우
      final int testDamage3 = 0; // 풀피인 경우
      final Wand testWand = Wand(name: '견습 지팡이', power: testPower);
      final Wizard wizard = Wizard(name: '이학민', hp: testHp, wand: testWand);
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
          equals(Wizard.mpInit - Wizard.healMpCost),
        ); // 의도된 mp 소모량만큼만 소모됐는지
        hero.hp = testHp;
        wizard.mp = Wizard.mpInit;
      }
    });

    test('mp가 부족할 때는 heal을 사용할 수 없다', () {
      // given
      final int testHp = 50;
      final double testPower = 5.0;
      final int testDamage = 50;
      final Wand testWand = Wand(name: '견습 지팡이', power: testPower);
      final Wizard wizard = Wizard(
        name: '이학민',
        hp: testHp,
        wand: testWand,
      );
      final Hero hero = Hero(name: '카리나', hp: testHp);

      // mp 경계값 생성
      final int cannotSuperHealStandard1 = 9;
      final int cannotSuperHealStandard2 = 10;
      final int cannotSuperHealStandard3 = 11;

      // when & then
      // mp를 음수로 설정할 경우 Exception 발생
      // mp가 9인 경우(모자란 경우) 먼저 실시
      int mpOfWizard = cannotSuperHealStandard1; // mpOfWizard는 wizard의 현재 mp 잔여량

      wizard.mp = mpOfWizard;
      hero.hp -= testDamage;
      wizard.heal(hero);

      expect(hero.hp == hero.hpMax, false); // 힐이 사용됐다면 회복량(20)만큼 회복됐을 것이므로 true일 것이고, 아니라면 false일 것임.
      expect(wizard.mp == mpOfWizard, true); // 힐이 사용됐다면 mp가 소비됐을 것이므로 값이 달라서 false일 것이고, 아니라면 true일 것임.

      wizard.mp = Wizard.mpInit;
      hero.hp = hero.hpMax;

      // 힐을 사용 가능한 mp 범위의 경우
      for(int i = 0; i < 2; i++) {
        if (i == 0) {
          mpOfWizard = cannotSuperHealStandard2;
        } else {
          mpOfWizard = cannotSuperHealStandard3;
        }

        wizard.mp = mpOfWizard;
        hero.hp -= testDamage;
        wizard.heal(hero);

        expect(hero.hp == Wizard.healHpIncrease, true); // 힐이 사용됐다면 회복량(20)만큼 회복됐을 것이므로 true일 것이고, 아니라면 false일 것임.
        expect(wizard.mp == mpOfWizard, false); // 힐이 사용됐다면 mp가 소비됐을 것이므로 값이 달라서 false일 것이고, 아니라면 true일 것임.

        wizard.mp = Wizard.mpInit;
        hero.hp = hero.hpMax;
      }
    });
  });
}
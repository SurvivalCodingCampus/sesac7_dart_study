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
        final Wizard wizard = Wizard(name: '이학민', hp: testHp + i, wand: testWand);

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
      expect(() => wizard = Wizard(name: '이학민', hp: testHp, wand: testWand2), returnsNormally);
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
      expect(() => wizard1.hp = testWrongHp2, returnsNormally); // 0으로 보정된다고 해서 예외 처리가 되진 않음
    });

    test('힐 시전 시 hero의 hp를 20 정상적으로 회복시키고 본인의 mp를 10 정상적으로 소모하는지?', () {
      // given
      final int baseHp = 0;
      final int testHp = 50;
      final int testHeroHp = 50;
      final int testDamage1 = 50;
      final int testDamage2 = 40;
      final int testDamage3 = 30;
      final int testDamage4 = 20;
      final double testPower = 5.0;
      final Wand testWand = Wand(name: '견습 지팡이', power: testPower);
      final Wizard wizard = Wizard(name: '이학민', hp: testHp, wand: testWand);
      final Hero hero = Hero(name: '카리나', hp: testHeroHp);

      // when & then
      hero.hp -= testDamage1;
      expect(() => wizard.heal(hero), returnsNormally);
      expect(hero.hp, equals(baseHp + Wizard.healHpIncrease));

    });
  });
}

/*
* 1. mp 초기값이 100으로 잘 초기화되는지?
* 2. 힐 시전 시 hero의 hp를 20 정상적으로 회복시키고 본인의 mp를 10 정상적으로 소모하는지?
*   - hp 회복량이 hp 최대치를 넘어갈 시 최대치로 보정될 수 있어야 함.
* 3. 힐 시전 시 마나가 없으면 "마나가 부족합니다"가 출력되는지?
*   -
* 4. 힐 성공 시 "힐을 시전했습니다. 대상 HP: ${hero.hp}"가 출력되는지?
* 5.
*
*
* */

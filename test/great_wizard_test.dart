import 'dart:math';

import 'package:modu_3_dart_study/asset/wand.dart';
import 'package:modu_3_dart_study/character/great_wizard.dart';
import 'package:modu_3_dart_study/character/hero.dart';
import 'package:modu_3_dart_study/character/wizard.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('GreatWizardTest', () {
    test('GreatWizard 클래스 생성자 테스트', () {
      final String testGreatWizardName = 'GreatWizard';
      final int testGreatWizardHp = 50;
      final String testWandName = 'GreatWand';
      final double testWandPower = 50.0;
      final Wand testGreatWizardWand = Wand(name: testWandName, power: testWandPower);
      final GreatWizard greatWizard = GreatWizard(name: testGreatWizardName, hp: testGreatWizardHp, wand: testGreatWizardWand);

      expect(testGreatWizardName, equals(greatWizard.wizardName));
      expect(testGreatWizardHp, equals(greatWizard.wizardHp));
      expect(testGreatWizardWand, equals(greatWizard.wand));
    });
    test('GreatWizard 클래스 Super 클래스 wizardMp 프로퍼티에 greatWizardMpDefault 값 반영 테스트', () {
      final String testGreatWizardName = 'GreatWizard';
      final int testGreatWizardHp = 50;
      final GreatWizard greatWizard = GreatWizard(name: testGreatWizardName, hp: testGreatWizardHp);

      expect(greatWizard.wizardMp, equals(GreatWizard.greatWizardDefaultMp));
    });
    test('GreatWizard 클래스 Mp 기본값 Wizard 클래스 Mp 기본값과 다른지 테스트', () {
      final String testGreatWizardName = 'GreatWizard';
      final int testGreatWizardHp = 50;
      final GreatWizard greatWizard = GreatWizard(name: testGreatWizardName, hp: testGreatWizardHp);
      final String testWizardName = 'Wizard';
      final int testWizardHp = 50;
      final Wizard wizard = Wizard(name: testWizardName, hp: testWizardHp);

      expect(greatWizard.wizardMp != wizard.wizardMp, equals(true));
    });
    group('GreatWizard 클래스 상속 테스트', () {
      test('GreatWizard 클래스 super 클래스 이름 최소 범위 미만 테스트', () {
        final String testGreatWizardName = 'GreatWizard';
        final int testGreatWizardHp = 50;
        final StringBuffer buffer = StringBuffer();
        final GreatWizard greatWizard = GreatWizard(name: testGreatWizardName, hp: testGreatWizardHp);
        String rangeOutGreatWizardName;

        for (int i = 1; i < greatWizard.wizardNameLimit; i++) {
          buffer.write('a');
        }

        rangeOutGreatWizardName = buffer.toString();

        expect(() => greatWizard.wizardName = rangeOutGreatWizardName, throwsException);
      });
      test('GreatWizard 클래스 super 클래스 이름 최소 범위 이상 테스트', () {
        final String testGreatWizardName = 'GreatWizard';
        final int testGreatWizardHp = 50;
        final StringBuffer buffer = StringBuffer();
        final GreatWizard greatWizard = GreatWizard(name: testGreatWizardName, hp: testGreatWizardHp);

        String minimumRangeGreatWizardName;

        for (int i = 1; i <= greatWizard.wizardNameLimit; i++) {
          buffer.write('a');
        }

        minimumRangeGreatWizardName = buffer.toString();

        expect(() => greatWizard.wizardName = minimumRangeGreatWizardName, returnsNormally);
      });
      test('GreatWizard 클래스 인스턴스 생성 후 super 클래스 wand 프로퍼티 null 삽입 불가능 테스트', () {
        final String testGreatWizardName = 'GreatWizard';
        final int testGreatWizardHp = 50;
        final String testGreatWizardWandName = 'Wand';
        final double testGreatWizardWandPower = 50.0;
        final Wand testGreatWizardWand = Wand(name: testGreatWizardWandName, power: testGreatWizardWandPower);
        final GreatWizard greatWizard = GreatWizard(name: testGreatWizardName, hp: testGreatWizardHp, wand: testGreatWizardWand);

        expect(() => greatWizard.wand = null, throwsException);
      });
      test('GreatWizard 클래스 super 클래스 wand 인자 null로 인스턴스 생성 후 wand 프로퍼티 삽입 적용 테스트', () {
        final String testGreatWizardName = 'GreatWizard';
        final int testGreatWizardHp = 50;
        final String testGreatWizardWandName = 'Wand';
        final double testGreatWizardWandPower = 50.0;
        final Wand testGreatWizardWand = Wand(name: testGreatWizardWandName, power: testGreatWizardWandPower);
        final GreatWizard greatWizard = GreatWizard(name: testGreatWizardName, hp: testGreatWizardHp, wand: testGreatWizardWand);

        expect(greatWizard.wand, isNotNull);
      });
      test('GreatWizard 클래스 super 클래스 mp Setter 0 미만인 경우 throw 테스트', () {
        final String testGreatWizardName = 'GreatWizard';
        final int testGreatWizardHp = 50;
        final GreatWizard greatWizard = GreatWizard(name: testGreatWizardName, hp: testGreatWizardHp);

        expect(() => greatWizard.wizardMp = -1, throwsException);
      });
      test('GreatWizard 클래스 super 클래스 hp Setter 음수인 경우 0 적용 테스트', () {
        final String testGreatWizardName = 'GreatWizard';
        final int testGreatWizardHp = 50;
        final GreatWizard greatWizard = GreatWizard(name: testGreatWizardName, hp: testGreatWizardHp);

        greatWizard.wizardHp = -1;

        expect(greatWizard.wizardHp, equals(0));
      });
      test('GreatWizard 클래스 super 클래스 heal 메서드 재정의 hp 회복량 검증 테스트', () {
        final String testGreatWizardName = 'GreatWizard';
        final int testGreatWizardHp = 50;
        final GreatWizard greatWizard = GreatWizard(name: testGreatWizardName, hp: testGreatWizardHp);
        final String testHeroName = '영웅';
        final int testHeroHp = 100;
        final Hero hero = Hero(name: testHeroName, hp: testHeroHp);
        final damage = 30;

        hero.hp -= damage;
        greatWizard.heal(hero);

        expect(hero.heroMaxHp - damage + greatWizard.greatWizardHealHp, equals(hero.hp));
      });
      test('GreatWizard 클래스 super 클래스 heal 메서드 재정의 mp 소모 테스트', () {
        final String testGreatWizardName = 'GreatWizard';
        final int testGreatWizardHp = 50;
        final GreatWizard greatWizard = GreatWizard(name: testGreatWizardName, hp: testGreatWizardHp);
        final String testHeroName = '영웅';
        final int testHeroHp = 100;
        final Hero hero = Hero(name: testHeroName, hp: testHeroHp);

        greatWizard.heal(hero);

        expect(GreatWizard.greatWizardDefaultMp - greatWizard.greatWizardHealMpCost, equals(greatWizard.wizardMp));
      });
      test('GreatWizard 클래스 super 클래스 heal 메서드 재정의 mp 부족 테스트', () {
        final String testGreatWizardName = 'GreatWizard';
        final int testGreatWizardHp = 50;
        final GreatWizard greatWizard = GreatWizard(name: testGreatWizardName, hp: testGreatWizardHp);
        final String testHeroName = '영웅';
        final int testHeroHp = 100;
        final Hero hero = Hero(name: testHeroName, hp: testHeroHp);
        final damage = 30;

        greatWizard.wizardMp = Random().nextInt(greatWizard.greatWizardHealMpCost);
        hero.hp -= damage;

        greatWizard.heal(hero);

        expect(hero.hp, equals(hero.heroMaxHp - damage));
      });
    });
    test('GreatWizard 클래스 superHeal 메서드 hp 회복량 검증 테스트', () {
      final String testGreatWizardName = 'GreatWizard';
      final int testGreatWizardHp = 50;
      final GreatWizard greatWizard = GreatWizard(name: testGreatWizardName, hp: testGreatWizardHp);
      final String testHeroName = '영웅';
      final int testHeroHp = 100;
      final Hero hero = Hero(name: testHeroName, hp: testHeroHp);
      final damage = 30;

      hero.hp -= damage;
      greatWizard.superHeal(hero);

      expect(hero.hp, equals(hero.heroMaxHp));
    });
    test('GreatWizard 클래스 superHeal 메서드 mp 소모 테스트', () {
      final String testGreatWizardName = 'GreatWizard';
      final int testGreatWizardHp = 50;
      final GreatWizard greatWizard = GreatWizard(name: testGreatWizardName, hp: testGreatWizardHp);
      final String testHeroName = '영웅';
      final int testHeroHp = 100;
      final Hero hero = Hero(name: testHeroName, hp: testHeroHp);

      greatWizard.superHeal(hero);

      expect(GreatWizard.greatWizardDefaultMp - greatWizard.greatWizardSuperHealMpCost, equals(greatWizard.wizardMp));
    });
    test('GreatWizard 클래스 superHeal 메서드 mp 부족 테스트', () {
      final String testGreatWizardName = 'GreatWizard';
      final int testGreatWizardHp = 50;
      final GreatWizard greatWizard = GreatWizard(name: testGreatWizardName, hp: testGreatWizardHp);
      final String testHeroName = '영웅';
      final int testHeroHp = 100;
      final Hero hero = Hero(name: testHeroName, hp: testHeroHp);
      final damage = 30;

      greatWizard.wizardMp = Random().nextInt(greatWizard.greatWizardSuperHealMpCost);
      hero.hp -= damage;

      greatWizard.superHeal(hero);

      expect(hero.hp, isNot(hero.heroMaxHp));
    });
  });
}
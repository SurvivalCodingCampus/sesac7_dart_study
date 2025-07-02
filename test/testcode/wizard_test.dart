import 'package:modu_3_dart_study/lecture_code/01.class_instance/hero.dart';
import 'package:modu_3_dart_study/lecture_code/01.class_instance/wizard.dart';
import 'package:test/test.dart';

void main() {
  final initZero = 0;
  test('mp: Int (초기값 100) Test', () {
    //given(준비)
    Wand wand = Wand(name: "지팡이", power: 1);
    Wizard wizard = Wizard(name: "홍길동", hp: 1, wand: wand);
    final int initMp = 100;

    //when(실행)

    //then(검증)
    expect(wizard.mp, initMp);
  });

  test(
    'heal(Hero hero) : hp를 20 회복시키고 자신의 mp를 10 소모 확인 및 힐을 시전했습니다. 대상 HP: hero.hp 출력 확인Test',
    () {
      //given(준비)
      Hero hero = Hero('홍길동', 80);
      Wand wand = Wand(name: "지팡이", power: 1);
      Wizard wizard = Wizard(name: "홍길동", hp: 1, wand: wand);
      final int limitHp = 100;
      wizard.mp = 100;
      //when(실행)
      wizard.heal(hero);

      //then(검증)
      expect(hero.hp, limitHp);
      expect(wizard.mp, 90);
    },
  );

  test('mp가 부족하면 마나가 부족합니다 출력 확인 Test', () {
    //given(준비)
    Hero hero = Hero('홍길동', 80);
    Wand wand = Wand(name: "지팡이", power: 1);
    Wizard wizard = Wizard(name: "홍길동", hp: 1, wand: wand);
    wizard.mp = initZero;

    //when(실행)
    wizard.heal(hero);

    //then(검증)
    expect(wizard.mp < 10, true);
  });

  test('mp가 부족하면 마나가 부족합니다 출력 확인 Test', () {
    //given(준비)
    final irrecoverableMpLimit = 9;

    Hero hero = Hero('홍길동', 80);
    Wand wand = Wand(name: "지팡이", power: 1);
    Wizard wizard = Wizard(name: "홍길동", hp: 1, wand: wand);
    wizard.mp = irrecoverableMpLimit;

    //when(실행)
    wizard.heal(hero);

    //then(검증)
    expect(wizard.mp <= irrecoverableMpLimit, true);
  });

  test('mp가 150으로 증가 확인 Test', () {
    //given(준비)
    Wand wand = Wand(name: "지팡이", power: 1);
    Wizard wizard = GreatWizard(name: "홍길동", hp: 1, wand: wand);

    //when(실행)

    //then(검증)
    expect(wizard.mp, wizard.useGreatWizardMaxMp);
  });

  test('void heal(Hero hero) 재정의 :  hp를 25 회복시키고 자신의 mp를 5 소모 확인 Test', () {
    //given(준비)
    Hero hero = Hero('홍길동', 0);
    Wand wand = Wand(name: "지팡이", power: 1);
    final wizard = GreatWizard(name: "홍길동", hp: 1, wand: wand);
    final int onetimeSpendMp = 145;

    //when(실행)
    wizard.heal(hero);

    //then(검증)
    expect(wizard.mp, onetimeSpendMp);
    expect(hero.hp, wizard.recoverHeroHpValue);
  });

  test(
    'void superHeal(Hero hero) : hp를 전부 회복시키고 자신의 mp를 50 소모 확인 Test 및 출력 확인',
    () {
      //given(준비)
      Hero hero = Hero('홍길동', 0);
      Wand wand = Wand(name: "지팡이", power: 1);
      final wizard = GreatWizard(name: "홍길동", hp: 1, wand: wand);
      final int resultMp =
          wizard.useGreatWizardMaxMp - wizard.useGreatWizardMpValue;

      //when(실행)
      wizard.superHeal(hero);

      //then(검증)
      expect(wizard.mp, resultMp);
      expect(hero.hp, 100);
    },
  );

  test('mp가 부족하면 마나가 부족합니다 출력 Test', () {
    //given(준비)
    Hero hero = Hero('홍길동', 0);
    // Wand wand = Wand(name: "지팡이", power: 1);
    final wizard = GreatWizard(name: "홍길동", hp: 1, wand: null);
    wizard.mp = 4;

    //when(실행)
    wizard.heal(hero);

    //then(검증)
  });

  test('superHeal 호출시 마나가 부족합니다 출력 Test', () {
    //given(준비)
    Hero hero = Hero('홍길동', 0);
    // Wand wand = Wand(name: "지팡이", power: 1);
    final wizard = GreatWizard(name: "홍길동", hp: 1, wand: null);
    wizard.mp = 49;

    //when(실행)
    wizard.superHeal(hero);

    //then(검증)
  });
}

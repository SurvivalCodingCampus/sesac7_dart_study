import 'package:modu_3_dart_study/250604/hero.dart';
import 'package:modu_3_dart_study/250604/wizard.dart';
import 'package:test/test.dart';

void main(){
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

  test('heal(Hero hero) : hp를 20 회복시키고 자신의 mp를 10 소모 확인 및 힐을 시전했습니다. 대상 HP: hero.hp 출력 확인Test', () {
    //given(준비)
    Hero hero = Hero('홍길동', 80);
    Wand wand = Wand(name: "지팡이", power: 1);
    Wizard wizard = Wizard(name: "홍길동", hp: 1, wand: wand);
    final int initMp = 100;
    final int limitHp = 100;

    //when(실행)
    wizard.heal(hero);

    //then(검증)
    expect(hero.hp, limitHp);
    expect(wizard.mp, 90);
  });

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
}
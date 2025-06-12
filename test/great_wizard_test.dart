import 'package:modu_3_dart_study/great_wizard.dart';
import 'package:modu_3_dart_study/hero.dart';
import 'package:test/test.dart';

void main() {
  test('Given GreatWizard class when 인스턴스 생성되면 then mp가 150이어야', () {
    // given(준비)
    GreatWizard greatWizard = GreatWizard(name: 'greateWizard', hp: 100);
    // when (실행)
    // then (검증)
    expect(greatWizard.mp, 150);
    expect(greatWizard.hp, 100);
  });

  test('Given GreatWizard 클래스 and Hero 클래스 when heal method 호출하면 '
      'then Hero의 HP를 80에서 25 증가시키고, Wizard의 mp는 5만큼 감소', () {
    // given(준비)
    GreatWizard greatWizard = GreatWizard(name: 'greatWizard', hp: 100);
    Hero heroA = Hero(name: 'heroA', hp: 80);
    // when (실행)
    greatWizard.heal(heroA);
    // then (검증)
    expect(heroA.hp, 80 + 25);
    expect(greatWizard.mp, 150 - 5);
  });

  test('Given GreatWizard 클래스 and Hero 클래스 when superHeal method 호출하면 '
      'then Hero의 HP를 80에서 maxHp로 회복시키고, Wizard의 mp는 50만큼 감소', () {
    // given(준비)
    GreatWizard greatWizard = GreatWizard(name: 'greatWizard', hp: 100);
    Hero heroA = Hero(name: 'heroA', hp: 80);
    // when (실행)
    greatWizard.superHeal(heroA);
    // then (검증)
    expect(heroA.hp, heroA.maxHp);
    expect(greatWizard.mp, 150 - 50);
  });
}

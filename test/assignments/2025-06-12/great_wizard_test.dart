import 'package:modu_3_dart_study/assignments/2025-06-12/great_wizard.dart';
import 'package:modu_3_dart_study/hero.dart';
import 'package:test/test.dart';

void main() {
  group('GreatWizard 테스트', () {
    final int fixHp = 30;
    final int healHp = 25;
    final int initializeMp = 150;
    final int healMpConsumption = 5;
    final int superHealMpConsumption = 50;

    test('GreatWizard 생성자 테스트', () {
      GreatWizard greatWizard = GreatWizard(name: '염경엽', hp: fixHp);

      expect(greatWizard.name, '염경엽');
      expect(greatWizard.hp, fixHp);
      expect(greatWizard.mp, initializeMp);
    });

    test('GreatWizard heal 정상 테스트', () {
      GreatWizard greatWizard = GreatWizard(name: '염경엽', hp: fixHp);
      Hero hero = Hero(name: '이호준', hp: fixHp);

      ///hero의 hp를 25회복 시키고, greatWizard의 mp는 5소모.
      greatWizard.heal(hero);

      expect(hero.hp, fixHp + healHp);
      expect(greatWizard.mp, initializeMp - healMpConsumption);
    });

    test('GreatWizard SuperHeal 정상 테스트', () {
      GreatWizard greatWizard = GreatWizard(name: '염경엽', hp: fixHp);
      Hero hero = Hero(name: '이호준', hp: fixHp);

      ///hero의 hp를 1로 줄여둔 상태에서 superHeal을 통해 maxHp로 돌아가는지 확인.
      hero.hp = 1;

      ///hero의 hp를 전부 회복 시키고, greatWizard의 mp는 50소모.
      greatWizard.superHeal(hero);

      expect(hero.hp, hero.maxHp);
      expect(greatWizard.mp, initializeMp - superHealMpConsumption);
    });

    test('heal 예외처리 테스트 ', () {
      GreatWizard greatWizard = GreatWizard(name: '염경엽', hp: fixHp);
      Hero hero = Hero(name: '이호준', hp: fixHp);

      greatWizard.mp = 4;
      expect(() => greatWizard.heal(hero), throwsException);
    });

    test('superHeal 예외처리 테스트', () {
      GreatWizard greatWizard = GreatWizard(name: '염경엽', hp: fixHp);
      Hero hero = Hero(name: '이호준', hp: fixHp);

      greatWizard.mp = 49;
      expect(() => greatWizard.superHeal(hero), throwsException);
    });
  });
}

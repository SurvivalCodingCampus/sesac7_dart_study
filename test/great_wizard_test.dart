import 'package:modu_3_dart_study/hero.dart';
import 'package:test/test.dart';
// import 'package:modu_3_dart_study/wizard.dart';
import 'package:modu_3_dart_study/great_wizard.dart';

void main() {
  test('greatwizard의 생성자 확인', () {
    final greatWizard01 = GreatWizard(name: '위대한마법사01');
    expect(greatWizard01.mp, 150);
  });

  group('great wizard heal 메소드 확인', () {
    test('heal 메소드 실행시 hp 25로 회복 자신의 mp는 5 소모', () {
      final greatWizard02 = GreatWizard(name: '위대한마법사02');
      final greatHealedHero02 = Hero(name: '위대한 영웅02');

      greatWizard02.heal(greatHealedHero02);

      expect(greatHealedHero02.hp, 25);
      expect(greatWizard02.mp, GreatWizard.defaultMP - 5);
    });

    test('superHeal 메소드 반복실행시 ', () {
      final greatWizard03 = GreatWizard(name: '위대한마법사03');
      final hero3 = Hero(name: '위대한 영웅03');

      // for(int i=0; i<5; i++) {
      //   greatWizard03.superHeal(greatHealedHero03);
      // }

      // expect(greatWizard03.mp, 0);
      greatWizard03.superHeal(hero3);
      greatWizard03.superHeal(hero3);
      greatWizard03.superHeal(hero3);

      expect(greatWizard03.mp, 0);
      expect(() => greatWizard03.superHeal(hero3), throwsException);
    });

    test('superHeal 메소드 실행시 hero 의 hp가 최대로 증가', () {
      final greatWizard04 = GreatWizard(name: '위대한마법사04');
      final greatHealedHero04 = Hero(name: '위대한 영웅04');

      greatWizard04.superHeal(greatHealedHero04);

      expect(greatHealedHero04.hp, Hero.defaultHp);
    });
  });
}

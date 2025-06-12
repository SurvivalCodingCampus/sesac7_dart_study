import 'package:modu_3_dart_study/assignments/hero.dart';
import 'package:modu_3_dart_study/assignments/wand.dart';
import 'package:modu_3_dart_study/assignments/wizard.dart';
import 'package:test/test.dart';

void main() {
  group('heal test', () {
    test('heal 사용시 hp 20 회복되고 mp는 10 줄어드는 테스트', () {
      final wand = Wand('wand1', 0.5);
      final wizard = Wizard('wizard1', 100, wand: wand);
      final hero = Hero('hero1', 50, 100);

      wizard.heal(hero);

      // 70 출력 테스트
      expect(hero.hp, 70);
      // 90 출력 테스트
      expect(wizard.mp, 90);
    });

    test('mp 부족할 때 heal 못쓰는 테스트', () {
      final wand = Wand('wand1', 0.5);
      // mp 부족하게 설정
      final wizard = Wizard('wizard1', 100, mp: 9, wand: wand);
      final hero = Hero('hero1', 50, 100);

      wizard.heal(hero);

      // 회복 안 됨
      expect(hero.hp, 50);
      // 힐 안 됨
      expect(wizard.mp, 9);
    });
  });
}

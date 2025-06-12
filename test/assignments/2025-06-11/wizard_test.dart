import 'package:modu_3_dart_study/assignments/2025-06-11/wand.dart';
import 'package:modu_3_dart_study/assignments/2025-06-11/wizard.dart';
import 'package:test/test.dart';

void main() {
  group('wizard 테스트', () {
    final double fixPower = 10.0;
    final wand = Wand('지팡이', fixPower);

    test('생성자 테스트', () {
      final wizard = Wizard(name: '임찬규', hp: 30, mp: 10, wand: wand);

      expect(wizard.name, '임찬규');
      expect(wizard.hp, 30);
      expect(wizard.mp, 10);
      expect(wizard.wand?.name, '지팡이');
      expect(wizard.wand?.power, fixPower);
    });

    test('description', () {
      final wizard = Wizard(name: '임찬규', mp: 10, hp: 20);
      expect(() => wizard.mp -= 20, throwsException);
    });

    test('이름 길이 setter 예외 처리', () {
      final wand = Wand('지팡이', fixPower);
      final wizard = Wizard(name: '임찬규', hp: 30, mp: 10, wand: wand);

      expect(() => wizard.name = '임', throwsException);
    });

    test('mp 음수 예외 처리', () {
      final wand = Wand('지팡이', fixPower);
      final wizard = Wizard(name: '임찬규', hp: 30, mp: 10, wand: wand);

      expect(() => wizard.mp = -1, throwsException);
    });

    test('hp 음수시 0 처리', () {
      final wand = Wand('지팡이', fixPower);
      final wizard = Wizard(name: '임찬규', hp: 10, mp: 10, wand: wand);
      wizard.hp -= 20;
      expect(wizard.hp, 0);
    });
  });
}

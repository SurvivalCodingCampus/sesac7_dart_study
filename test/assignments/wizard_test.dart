import 'package:modu_3_dart_study/wand.dart';
import 'package:modu_3_dart_study/wizard.dart';
import 'package:test/test.dart';

void main() {
  group('wand test', () {
    test('wand 생성', () {
      final wand = Wand('wand1', 10.0);

      expect(wand.name, equals('wand1'));
      expect(wand.power, equals(10.0));
    });

    test('wand 생성 불가 ( 이름이 짧은 경우 )', () {
      expect(() => Wand('wa', 5.0), throwsException);
    });

    test('wand 생성 불가 ( 마력 범위 벗어난 경우 )', () {
      expect(() => Wand('wand2', 0.1), throwsException);
      expect(() => Wand('wand2', 999.0), throwsException);
    });

    test('wand 이름 변경 ( setter 테스트 )', () {
      final wand = Wand('wand3', 5.0);
      expect(() => wand.name = 'wn', throwsException); // 완드 생성 불가

      wand.name = 'wand4';
      expect(wand.name, 'wand4');
    });

    test('wand 마력 변경 ( setter 테스트 )', () {
      final wand = Wand('wand5', 5.0);

      expect(() => wand.power = 0.1, throwsException);
      expect(() => wand.power = 999.0, throwsException);

      wand.power = 50.0;
      expect(wand.power, equals(50.0));
    });
  });

  group('wizard 생성', () {
    test('wizard 생성', () {
      final wand = Wand('wand1', 8.0);
      final wizard = Wizard('wizard1', 20, 5, wand);

      expect(wizard.name, 'wizard1');
      expect(wizard.hp, 20);
      expect(wizard.mp, 5);
    });

    test('wizard 생성 불가 ( 이름이 짧은 경우 )', () {
      final wand = Wand('wand2', 9.0);
      expect(() => Wizard('wi', 10, 3, wand), throwsException);
    });

    test('wizard 생성 불가 ( mp가 0보다 작은 경우 )', () {
      final wand = Wand('wand3', 9.0);
      expect(() => Wizard('wizard3', 10, -1, wand), throwsException);
    });

    test('wizard hp 설정 ( hp가 0보다 작은 경우 )', () {
      final wand = Wand('wand4', 6.0);
      final wizard = Wizard('wizard4', -5, 3, wand);

      expect(wizard.hp, equals(0));
    });

    test('wizard 생성 불가 ( wand가 null인 경우 )', () {
      final wand = Wand('wand5', 7.0);
      final wizard = Wizard('wizard5', 10, 5, wand);

      expect(() => wizard.wand = null, throwsException);
    });
  });
}

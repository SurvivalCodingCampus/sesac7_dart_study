import 'package:modu_3_dart_study/assignments/wand.dart';
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
}

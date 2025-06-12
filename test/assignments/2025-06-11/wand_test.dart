import 'package:modu_3_dart_study/assignments/2025-06-11/wand.dart';
import 'package:test/test.dart';

void main() {
  group('wand 테스트', () {
    final double fixPower = 10.0;
    test('생성자 테스트', () {
      final wand = Wand('영겁의 지팡이', fixPower);
      expect(wand.name, '영겁의 지팡이');
      expect(wand.power == fixPower, true);
    });

    test('이름 길이 예외 처리 테스트', () {
      expect(() => Wand('wa', fixPower), throwsException);
    });

    test('마력 범위 예외 처리 테스트', () {
      expect(() => Wand('지팡이1', 0.4), throwsException);
      expect(() => Wand('지팡이2', 101.0), throwsA(isA<Exception>()));
    });

    test('setter 이름 테스트', () {
      final wand = Wand('지팡이', fixPower);

      ///이름 길이 예외 처리
      expect(() => wand.name = '지', throwsException); // 완드 생성 불가

      wand.name = '바꾼 지팡이';
      expect(wand.name, '바꾼 지팡이');
    });

    test('setter 마력 테스트', () {
      final wand = Wand('wand5', fixPower);

      ///마력 범위 예외 처리
      expect(() => wand.power = 0.49, throwsException);
      expect(() => wand.power = 100.1, throwsException);

      wand.power = 99.0;
      expect(wand.power, equals(99.0));
    });
  });
}

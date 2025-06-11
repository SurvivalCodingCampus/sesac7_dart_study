import 'package:modu_3_dart_study/wand.dart';
import 'package:test/test.dart';

void main() {
  group('wand test', () {
    test('생성자 테스트', () {
      // given
      final double testPower1 = 10.0;
      final double testPower2 = testPower1 * 2;
      final double testPower3 = testPower1 * 5;

      final Wand wand1 = Wand('이학민', testPower1);
      final Wand wand2 = Wand('카리나', testPower2);
      final Wand wand3 = Wand('홍길동', testPower3);

      // when & then
      expect(wand1.name, equals('이학민'));
      expect(wand1.power, equals(testPower1));

      expect(wand2.name, equals('카리나'));
      expect(wand2.power, equals(testPower2));

      expect(wand3.name, equals('홍길동'));
      expect(wand3.power, equals(testPower3));
    });

    test('지팡이의 이름이 너무 짧게(3문자 미만) 설정되었을 경우', () {
      // given
      final double testPower1 = 10.0;
      final double testPower2 = 20.0;
      final String testName1 = '홍';
      final String testName2 = '길동';
      final Wand wand1 = Wand('이학민', testPower1);
      final Wand wand2 = Wand('카리나', testPower2);

      // when & then
      expect(() => wand1.name = testName1, throwsException);
      expect(() => wand2.name = testName2, throwsException);
    });

    test('지팡이의 마력이 비정상 범위(0.5 미만 혹은 100.0 초과)로 설정되었을 경우', () {
      // given
      final double testPower1 = -10.0;
      final double testPower2 = 200.0;
      final Wand wand1 = Wand('이학민', testPower1);
      final Wand wand2 = Wand('카리나', testPower2);

      // when & then
      expect(() => wand1.power = testPower1, throwsException);
      expect(() => wand2.power = testPower2, throwsException);
    });
  });
}

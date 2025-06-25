import 'package:modu_3_dart_study/assignments/exception.dart';
import 'package:test/test.dart';

void main() {
  group('parseStringToInt 함수 테스트', () {
    test('numString을 int로 변경', () {
      expect(parseStringToInt(numString: '1000'), 1000);
      expect(parseStringToInt(numString: '10000'), 10000);
    });

    test('double type은 변경 불가하고 0 반환', () {
      expect(parseStringToInt(numString: '1.2'), 0);
      expect(parseStringToInt(numString: '1.5'), 0);
    });
  });
}

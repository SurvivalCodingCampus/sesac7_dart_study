import 'package:modu_3_dart_study/asset/computer.dart';
import 'package:test/test.dart';

void main() {
  group('Computer Test', () {
    test('생성자 테스트', () {
      // given
      final String testName = '갤럭시북 4 pro';
      final int testPrice = 2000000;
      final String testColor = '그라파이트';
      final double testWeight = 1.5;
      final String testMakerName = 'Samsung';
      final Computer computer = Computer(
        name: testName,
        price: testPrice,
        color: testColor,
        weight: testWeight,
        makerName: testMakerName,
      );

      // when & then
      expect(computer.name, equals(testName));
      expect(computer.price, equals(testPrice));
      expect(computer.color, equals(testColor));
      expect(computer.weight, equals(testWeight));
      expect(computer.makerName, equals(testMakerName));
    });

    test('getter/setter 정상 작동 여부 테스트', () {
      // given
      final String testName1 = '갤럭시북 4 pro';
      final String testName2 = '맥북 pro';
      final int testPrice1 = 2000000;
      final int testPrice2 = 3000000;
      final String testColor1 = '그라파이트';
      final String testColor2 = '화이트';
      final double testWeight1 = 1.5;
      final double testWeight2 = 2.0;
      final String testMakerName = 'Samsung';
      final Computer computer = Computer(
        name: testName1,
        price: testPrice1,
        color: testColor1,
        weight: testWeight1,
        makerName: testMakerName,
      );

      // when & then
      // 값을 대입할 때 예외 없이 정상 작동하는지(setter),
      // 의도한 값이 그대로 들어갔는지(getter) 확인
      expect(() => computer.name = testName2, returnsNormally);
      expect(computer.name, equals(testName2));

      expect(() => computer.price = testPrice2, returnsNormally);
      expect(computer.price, equals(testPrice2));

      expect(() => computer.color = testColor2, returnsNormally);
      expect(computer.color, equals(testColor2));

      expect(() => computer.weight = testWeight2, returnsNormally);
      expect(computer.weight, equals(testWeight2));
    });

    test('컴퓨터 무게는 0보다 커야 한다(형태가 있는 것이라면 무게가 있어야 한다)', () {
      // given
      final String testName = '갤럭시북 4 pro';
      final int testPrice = 2000000;
      final String testColor = '그라파이트';
      final double testWeightInit = 10.0;
      final String testMakerName = 'Samsung';

      // 무게 경계값 설정
      final double testWeight1 = 0.001;
      final double testWeight2 = 0;
      final double testWeight3 = -0.001;

      final Computer computer = Computer(
        name: testName,
        price: testPrice,
        color: testColor,
        weight: testWeightInit,
        makerName: testMakerName,
      );

      // when & then
      // 무게가 조금이라도 존재하면(0보다 조금이라도 크면) 정상 실행
      expect(() => computer.weight = testWeight1, returnsNormally);
      expect(computer.weight, equals(testWeight1));

      // 무게가 0 이하면 예외 처리
      expect(() => computer.weight = testWeight2, throwsException);
      expect(() => computer.weight = testWeight3, throwsException);
    });
  });
}

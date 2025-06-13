import 'package:modu_3_dart_study/computer.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('Book 클래스 테스트', () {
    final String testName = '';
    final int testPrice = 0;
    final String testColor = '';
    final String testMakerName = '';
    final double testWeight = 0.0;
    final computer = Computer(
      name: testName,
      price: testPrice,
      color: testColor,
      makerName: testMakerName,
      weight: testWeight,
    );

    test('weight의 getter, setter 테스트', () {
      final double getWeight = computer.weight;
      final double setWeight = 1.0;

      expect(computer.weight == getWeight, equals(true));

      computer.weight = setWeight;

      expect(computer.weight == getWeight, equals(false));
      expect(computer.weight == setWeight, equals(true));
    });
  });
}

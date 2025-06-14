import 'package:modu_3_dart_study/assignments/2025-06-13/computer.dart';
import 'package:test/test.dart';

void main() {
  final computerName = 'MacBook Air';
  final computerPrice = 2200000;
  final computerColor = 'black';
  final computerWeight = 500.0;
  final makerName = 'Apple';
  final changeComputerWeight = 400.0;

  group('Computer 테스트', () {
    test('Computer 생성자 테스트', () {
      Computer computer = Computer(
        name: 'MacBook Air',
        price: 2200000,
        color: 'black',
        weight: 500.0,
        makerName: 'Apple',
      );
      expect(computer.name, computerName);
      expect(computer.price, computerPrice);
      expect(computer.color, computerColor);
      expect(computer.weight, computerWeight);
      expect(computer.makerName, makerName);
    });
    test('Computer setter 테스트', () {
      Computer computer = Computer(
        name: 'MacBook Air',
        price: 2200000,
        color: 'black',
        weight: 500.0,
        makerName: 'Apple',
      );
      computer.weight = 400.0;
      expect(computer.weight, changeComputerWeight);
    });
  });
}

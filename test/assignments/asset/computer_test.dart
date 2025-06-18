import 'package:modu_3_dart_study/assignments/asset/computer.dart';
import 'package:modu_3_dart_study/assignments/asset/thing.dart';
import 'package:test/test.dart';

void main() {
  const String name = 'Computer';
  const int price = 1000000;
  const String color = 'Black';
  const String makerName = 'Apple';
  const double weight = 1000;

  late Computer computer;

  setUp(() {
    computer = Computer(
      name,
      price: price,
      color: color,
      makerName: makerName,
      weight: weight,
    );
  });

  group('constructor', () {
    test(
      'When a Computer is created with name, price, color, makerName, and weight, it contains the given values.',
      () {
        // given
        // when

        // then
        expect(computer.name, name);
        expect(computer.price, price);
        expect(computer.color, color);
        expect(computer.makerName, makerName);
        expect(computer.weight, weight);
      },
    );
  });

  group('weight', () {
    test('Throws an exception if the weight is less than Thing.minWeight.', () {
      // given
      final lessThanZero = Thing.minWeight - 1;

      // when
      // then
      expect(() => computer.weight = lessThanZero, throwsException);
    });

    test(
      'If the weight is greater than Thing.minWeight, it has that value.',
      () {
        // given
        final moreThanZero = Thing.minWeight + 1;

        // when
        computer.weight = moreThanZero;

        // then
        expect(computer.weight, moreThanZero);
      },
    );
  });
}

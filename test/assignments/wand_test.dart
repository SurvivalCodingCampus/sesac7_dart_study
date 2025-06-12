import 'package:modu_3_dart_study/assignments/wand.dart';
import 'package:test/test.dart';

void main() {
  const String name = '지팡이';
  const double defaultPower = 10;

  group('constructor', () {
    test('When create a wand, the name and power are given value.', () {
      // given
      // when
      final wand = Wand(name, power: defaultPower);

      // then
      expect(wand.name, name);
      expect(wand.power, defaultPower);
    });
  });

  group('name', () {
    test('Attempting to set null to a name throws an exception.', () {
      // given
      final wand = Wand(name, power: defaultPower);

      // when
      // then
      expect(() => wand.name = null, throwsException);
    });

    test('Attempting to set 2 characters to a name throws an exception.', () {
      // given
      final twoLengthName = 'ab';
      final wand = Wand(name, power: defaultPower);

      // when
      // then
      expect(() => wand.name = twoLengthName, throwsException);
    });

    test('Attempting to set 3 characters to a name, name is given value.', () {
      // given
      final threeLengthName = 'abc';
      final wand = Wand(name, power: defaultPower);

      // when
      wand.name = threeLengthName;

      // then
      expect(wand.name, threeLengthName);
    });
  });

  group('power', () {
    test('Attempting to set 0.4 to the power, it throws an exception.', () {
      // given
      final lessThanMinPower = Wand.minPower - 0.1;
      final wand = Wand(name, power: defaultPower);

      // when
      // then
      expect(() => wand.power = lessThanMinPower, throwsException);
    });

    test('Attempting to set 0.5 to the power, it is given value.', () {
      // given
      final wand = Wand(name, power: defaultPower);

      // when
      wand.power = Wand.minPower;

      // then
      expect(wand.power, Wand.minPower);
    });

    test('Attempting to set 100 to the power, it is given value.', () {
      // given
      final wand = Wand(name, power: defaultPower);

      // when
      wand.power = Wand.maxPower;

      // then
      expect(wand.power, Wand.maxPower);
    });

    test('Attempting to set 100.1 to the power, it throws an exception.', () {
      // given
      final moreThanMaxPower = Wand.maxPower + 0.1;
      final wand = Wand(name, power: defaultPower);

      // when
      // then
      expect(() => wand.power = moreThanMaxPower, throwsException);
    });
  });
}

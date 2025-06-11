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

    test('Attempting to set 2 to a name throws an exception.', () {
      // given
      final twoLengthName = 'ab';
      final wand = Wand(name, power: defaultPower);

      // when
      // then
      expect(() => wand.name = twoLengthName, throwsException);
    });

    test('Attempting to set 3 to a name, name is given value.', () {
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

// -----------------------------------------------
  // Documentation for wand.dart
  // - Static constants: minPower, maxPower defined as compile-time constants for valid power range.
  // - Constructor signature: Wand(String name, {double power})
  //   * Validates name != null, name.length >= 3
  //   * Validates minPower <= power <= maxPower
  //   * Throws ArgumentError on invalid inputs
  // - Getter & setter behavior:
  //   * name setter enforces same constraints, throws ArgumentError
  //   * power setter enforces bounds, throws ArgumentError
  // - Exception types: ArgumentError used for all validation failures
  // -----------------------------------------------

  group('constructor validation', () {
    test('Null name throws ArgumentError', () {
      expect(() => Wand(null, power: defaultPower), throwsArgumentError);
    });
    test('Power below min throws ArgumentError', () {
      final tooLow = Wand.minPower - 0.01;
      expect(() => Wand(name, power: tooLow), throwsArgumentError);
    });
    test('Power above max throws ArgumentError', () {
      final tooHigh = Wand.maxPower + 0.01;
      expect(() => Wand(name, power: tooHigh), throwsArgumentError);
    });
    test('Power equal to min & max accepted', () {
      expect(() => Wand(name, power: Wand.minPower), returnsNormally);
      expect(() => Wand(name, power: Wand.maxPower), returnsNormally);
    });
  });

  group('name setter validation', () {
    late Wand wand;
    setUp(() {
      wand = Wand(name, power: defaultPower);
    });
    test('Null name throws ArgumentError', () {
      expect(() => wand.name = null, throwsArgumentError);
    });
    test('Too short name (<3 chars) throws ArgumentError', () {
      expect(() => wand.name = 'ab', throwsArgumentError);
    });
    test('Boundary name length (=3) accepted', () {
      wand.name = 'abc';
      expect(wand.name, 'abc');
    });
    test('Valid name reassignment persists', () {
      const validName = 'MagicWand';
      wand.name = validName;
      expect(wand.name, validName);
    });
  });

  group('power setter validation', () {
    late Wand wand;
    setUp(() {
      wand = Wand(name, power: defaultPower);
    });
    test('Power below min throws ArgumentError', () {
      final tooLow = Wand.minPower - 0.1;
      expect(() => wand.power = tooLow, throwsArgumentError);
    });
    test('Power at min accepted', () {
      wand.power = Wand.minPower;
      expect(wand.power, Wand.minPower);
    });
    test('Power at max accepted', () {
      wand.power = Wand.maxPower;
      expect(wand.power, Wand.maxPower);
    });
    test('Power above max throws ArgumentError', () {
      final tooHigh = Wand.maxPower + 0.1;
      expect(() => wand.power = tooHigh, throwsArgumentError);
    });
  });

  test('constants are immutable', () {
    final minBefore = Wand.minPower;
    final maxBefore = Wand.maxPower;
    // Constants cannot be reassigned at runtime
    expect(Wand.minPower, minBefore);
    expect(Wand.maxPower, maxBefore);
  });
import 'dart:math';

import 'package:modu_3_dart_study/wand.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('Wand 클래스 타당성 검사 테스트', () {
    final String initialName = '';
    final double initialPower = 0.0;
    final String threeLettersName = 'abc';
    final String lessThreeLettersName = 'ab';
    final String? nullName = null;
    final double minPower = 0.5;
    final double maxPower = 100.0;
    final double lessMinPower = 0.4;
    final double overMaxPower = 100.1;
    final double inRangeRandomPower =
        minPower + Random().nextDouble() * (maxPower - minPower);

    final wand = Wand(name: initialName, power: initialPower);

    test('Wand 이름이 3글자 이상인 경우와 그렇지 않은 경우', () {
      expect(() => wand.name = threeLettersName, returnsNormally);
      expect(() => wand.name = lessThreeLettersName, throwsException);

      // Wand 이름이 null인 경우
      expect(() => wand.name = nullName, throwsException);

      // Wand 파워가 0.5 이상 100.0 이하인 경우와 그렇지 않은 경우
      expect(() => wand.power = inRangeRandomPower, returnsNormally);
      expect(() => wand.power = lessMinPower, throwsException);
      expect(() => wand.power = overMaxPower, throwsException);
    });

    test('Wand 이름이 null인 경우', () {
      expect(() => wand.name = nullName, throwsException);
    });

    test('Wand 파워가 0.5 이상 100.0 이하인 경우와 그렇지 않은 경우', () {
      expect(() => wand.power = inRangeRandomPower, returnsNormally);
      expect(() => wand.power = lessMinPower, throwsException);
      expect(() => wand.power = overMaxPower, throwsException);
    });
  });
}

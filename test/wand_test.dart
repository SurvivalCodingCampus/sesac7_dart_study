import 'dart:math';

import 'package:modu_3_dart_study/wand.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('WandTest', () {
    test('Wand 클래스 생성자 테스트', () {
      final String testWandName = 'Wand';
      final double testWandPower = 50.0;

      Wand wand = Wand(name: testWandName, power: testWandPower);

      expect(testWandName == wand.wandName, equals(true));
      expect(testWandPower == wand.wandPower, equals(true));
    });
    test('Wand 클래스 이름 최소 범위 미만 테스트', () {
      final String testWandName = 'Wand';
      final double testWandPower = 50.0;
      final StringBuffer buffer = StringBuffer();
      String rangeOutWandName;

      Wand wand = Wand(name: testWandName, power: testWandPower);

      for (int i = 1; i < wand.wandNameLimit; i++) {
        buffer.write('a');
      }

      rangeOutWandName = buffer.toString();

      expect(() => wand.wandName = rangeOutWandName, throwsException);
    });
    test('Wand 클래스 이름 최소 범위 이상 테스트', () {
      final String testWandName = 'Wand';
      final double testWandPower = 50.0;
      final StringBuffer buffer = StringBuffer();

      String minimumRangeWandName;

      Wand wand = Wand(name: testWandName, power: testWandPower);

      for (int i = 1; i <= wand.wandNameLimit; i++) {
        buffer.write('a');
      }

      minimumRangeWandName = buffer.toString();

      expect(() => wand.wandName = minimumRangeWandName, returnsNormally);
    });
    test('Wand 클래스 마력 최소 범위 미만 테스트', () {
      final String testWandName = 'Wand';
      final double testWandPower = 50.0;

      Wand wand = Wand(name: testWandName, power: testWandPower);

      expect(() => wand.wandPower = wand.wandPowerMinValue - 0.1, throwsException);
    });
    test('Wand 클래스 마력 최대 범위 이상 테스트', () {
      final String testWandName = 'Wand';
      final double testWandPower = 50.0;

      Wand wand = Wand(name: testWandName, power: testWandPower);

      expect(() => wand.wandPower = wand.wandPowerMaxValue, returnsNormally);
    });
    test('Wand 클래스 마력 최대 범위 초과 테스트', () {
      final String testWandName = 'Wand';
      final double testWandPower = 50.0;

      Wand wand = Wand(name: testWandName, power: testWandPower);

      expect(() => wand.wandPower = wand.wandPowerMaxValue + 0.1, throwsException);
    });
  });
}
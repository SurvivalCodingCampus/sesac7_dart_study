import 'dart:math';

import 'package:modu_3_dart_study/cleric.dart';
import 'package:test/test.dart';

void main() {
  test('Cleric Test', () {
    // given(준비)
    final cleric = Cleric("클레릭");

    // when(실행)
    cleric.pray(Random().nextInt(15));

    // then(검증)
    expect(cleric.mp <= 10, equals(true));
  });
}
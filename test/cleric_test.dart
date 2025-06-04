import 'package:modu_3_dart_study/cleric.dart';
import 'package:test/test.dart';

void main() {
  test('Test Cleric', () {
    // given
    Cleric cleric = Cleric('이학민');

    // when

    // then
    expect(cleric.name, equals('이학민'));
  });
}
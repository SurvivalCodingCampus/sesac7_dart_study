import 'package:test/test.dart';
import 'package:modu_3_dart_study/assignments/2025-06-04/cleric.dart';

void main() {

  group('Question 1', () {
    test('Cleric Test', () {
      // given (준비)
      final clericJang = Cleric('Jang');

      // when (실행)

      // then (검증)
      expect(clericJang.hp, equals(50));
      expect(clericJang.maxHp, equals(50));
      expect(clericJang.mp, equals(10));
      expect(clericJang.maxMp, equals(10));
    });
  });
  
}
import 'package:test/test.dart';
import 'package:modu_3_dart_study/assignments/2025-06-04/cleric.dart';

void main() {
  group('Question 2 : Cleric constructor', () {
    test('Cleric("아서스", hp: 40, mp: 5) instance', () {
      // given (준비)
      final arthas = Cleric("아서스", hp: 40, mp: 5);

      // when (실행)

      // then (검증)
      expect(arthas.name, equals("아서스"));
      expect(arthas.hp, equals(40));
      expect(arthas.mp, equals(5));
    });
    test('Cleric("아서스", hp: 35) instance', () {
      // given (준비)
      final arthas = Cleric("아서스", hp: 35);

      // when (실행)

      // then (검증)
      expect(arthas.name, equals("아서스"));
      expect(arthas.hp, equals(35));
      expect(arthas.mp, equals(Cleric.maxMp));
    });
    test('Cleric("아서스") instance', () {
      // given (준비)
      final arthas = Cleric("아서스");

      // when (실행)

      // then (검증)
      expect(arthas.name, equals("아서스"));
      expect(arthas.hp, equals(Cleric.maxHp));
      expect(arthas.mp, equals(Cleric.maxMp));
    });
    test('Cleric("아서스", mp: 5) instance', () {
      // given (준비)
      final arthas = Cleric("아서스", mp: 5);

      // when (실행)

      // then (검증)
      expect(arthas.name, equals("아서스"));
      expect(arthas.hp, equals(Cleric.maxHp));
      expect(arthas.mp, equals(5));
    });
  });
}

import 'package:modu_3_dart_study/assignments/cleric.dart';
import 'package:test/test.dart';

void main() {
  group('클레릭 테스트', () {
    test('cleric 생성', () {
      final cleric1 = Cleric('cleric1', hp: 10, mp: 5);
      final cleric2 = Cleric('cleric2', hp: 20, mp: 5);
      final cleric3 = Cleric('cleric3', hp: 40, mp: 5);

      expect(cleric1.name, equals('cleric1'));
      expect(cleric2.name, equals('cleric2'));
      expect(cleric3.name, equals('cleric3'));
      expect(Cleric.maxHp, equals(50));
    });
  });
}

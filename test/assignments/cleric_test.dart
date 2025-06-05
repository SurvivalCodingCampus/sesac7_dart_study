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

  group('아서스 테스트', () {
    test('아서스 생성', () {
      final arthas1 = Cleric('아서스1', hp: 40, mp: 5);
      final arthas2 = Cleric('아서스2', hp: 35);
      final arthas3 = Cleric('아서스3');
      
      //Cleric maxHP, maxMP
      expect(Cleric.maxHp, equals(50));
      expect(Cleric.maxMp, equals(10));

      //아서스1
      expect(arthas1.name, equals('아서스1'));
      expect(arthas1.hp, equals(40));
      expect(arthas1.mp, equals(5));

      //아서스2
      expect(arthas2.name, equals('아서스2'));
      expect(arthas2.hp, equals(35));
      expect(arthas2.mp, equals(10));

      //아서스3
      expect(arthas3.name, equals('아서스3'));
      expect(arthas3.hp, equals(50));
      expect(arthas3.mp, equals(10));
    });
  });
}

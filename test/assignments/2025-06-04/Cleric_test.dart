import 'package:modu_3_dart_study/assignments/2025-06-04/Cleric.dart';
import 'package:test/test.dart';

void main() {
  group('Cleric Test', () {
    test('생성자 테스트(초기상태 확인)', () {
      Cleric cleric = Cleric('성직자');
      expect(cleric.name, '성직자');
      expect(cleric.hp, 50);
      expect(cleric.maxHp, 50);
      expect(cleric.mp, 10);
      expect(cleric.maxMp, 10);
    });

    test('selfAid 테스트', () {
      Cleric cleric = Cleric('성직자');
      cleric.hp = 30;
      cleric.selfAid();
      expect(cleric.mp, 5);
      expect(cleric.mp, equals(5));

      cleric.hp = 0;
      cleric.selfAid();
      expect(cleric.mp, 0);
      expect(cleric.mp == 0, true);
    });

    test('pray 테스트', () {
      Cleric cleric = Cleric('성직자');
      cleric.mp = 0;
      cleric.pray(3);
      expect(cleric.mp <= 5, true);

      cleric.pray(1);
      expect(cleric.mp <= 8, true);
    });
  });
}

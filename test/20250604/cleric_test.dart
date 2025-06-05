
import 'package:modu_3_dart_study/20250604/Cleric.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('Cleric 클래스 테스트', () {
    test('selfAid 메서드 - MP가 충분할 때', () {
      // given
      Cleric cleric = Cleric('성기사');
      cleric.hp = 30; // HP 손상

      // when
      cleric.selfAid();

      // then
      expect(cleric.hp, equals(50));
      expect(cleric.mp, equals(5));
      });

    test('selfAid 메서드 - MP가 부족할 때', () {
      // given
      Cleric cleric = Cleric('성기사');
      cleric.mp = 3; // MP 부족 상태
      cleric.hp = 30;

      // when
      cleric.selfAid();

      // then
      expect(cleric.hp, equals(30)); // HP 변화 없음
      expect(cleric.mp, equals(3)); // MP 변화 없음
    });

    test('pray 메서드 - 정상 범위 회복', () {
      // given
      Cleric cleric = Cleric('성기사');
      cleric.mp = 5;

      // when
      List<int> recoveredValues = [];
      for (int i = 0; i < 10; i++) {
        Cleric testCleric = Cleric('테스트');
        testCleric.mp = 5;
        int recovered = testCleric.pray(2);
        recoveredValues.add(recovered);
      }

      // then
      for (int recovered in recoveredValues) {
        expect(recovered, inInclusiveRange(2, 4));
      }
    });

    test('생성자 테스트', () {
      // when
      Cleric cleric = Cleric('성기사');

      // then
      expect(cleric.name, equals('성기사'));
      expect(cleric.hp, equals(50));
      expect(cleric.mp, equals(10));
      });
  });
}

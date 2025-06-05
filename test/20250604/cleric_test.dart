
import 'package:modu_3_dart_study/20250604/cleric.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {

  group('Cleric 클래스 테스트', () {
    test('selfAid 메서드 - MP가 충분할 때', () {
      // given
      Cleric cleric = Cleric('성기사');
      cleric.attacked(damageAmount: 20);

      // when
      cleric.selfAid();

      // then
      expect(cleric.hp, equals(50));
      expect(cleric.mp, equals(5));
    });

    test('selfAid 메서드 - MP가 부족할 때', () {
      // given
      Cleric cleric = Cleric('성기사', hp: 30);
      cleric.mp = 3; // MP 부족 상태

      // when
      cleric.selfAid();

      // then
      expect(cleric.hp, equals(30)); // HP 변화 없음
      expect(cleric.mp, equals(3)); // MP 변화 없음
    });

    test('pray 메서드 - 정상 범위 회복', () {
      // given
      Cleric cleric = Cleric('성기사', mp: 5);

      // when
      List<int> recoveredValues = [];

      // i는 기도 시간의 변화값
      // 1 -> 1~3, 2 -> 2~4 ... 10 -> 10~12
      // 따라서 inInclusiveRange(0, 12)로 체크
      for (int i = 1; i < 10; i++) {
        Cleric testCleric = Cleric('테스트');
        int recovered = testCleric.pray(i);
        recoveredValues.add(recovered);
      }

      // then
      for (int recovered in recoveredValues) {
        // 0까지 포함한 이유는 원래 마나가 꽉차있어서 더이상 채울수없을때.
        expect(recovered, inInclusiveRange(0, 12));
      }
    });

    test('생성자 테스트', () {
      // when
      Cleric cleric1 = Cleric('성기사');
      Cleric cleric2 = Cleric('아서스', hp: 40, mp: 5);
      Cleric cleric3 = Cleric('아서스', hp: 35);
      Cleric cleric4 = Cleric('손오공', mp: 7);

      // then
      expect(cleric1.name, equals('성기사'));
      expect(cleric1.hp, equals(50));
      expect(cleric1.mp, equals(10));

      expect(cleric2.hp, equals(40));
      expect(cleric3.hp, equals(35));

      expect(cleric4.name, equals('손오공'));
      expect(cleric4.hp, equals(50));
      expect(cleric4.mp, equals(7));

      expect(() => Cleric('외계인', mp: -1), throwsA(isA<ArgumentError>()));
      expect(() => Cleric('화성인', hp: 600), throwsA(isA<ArgumentError>()));
      expect(() => Cleric('데빌', hp: 100000, mp: 1000000), throwsA(isA<ArgumentError>()));
      expect(() => Cleric(''), throwsA(isA<ArgumentError>()));
    });
  });
}

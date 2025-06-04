import 'package:modu_3_dart_study/cleric.dart';
import 'package:test/test.dart';

void main() {
  group('Cleric Test', () {
    test('mp가 최대치인 상태에서 pray 발동', () {
      // given
      Cleric cleric = Cleric('이학민');

      // when & then
      // 아무런 행동도 하지 않아 mp 잔여량이 최대치일 것이므로, pray를 아무리 발동해도 리턴 값은 0.
      expect(cleric.pray(0), equals(0));
      expect(cleric.pray(1), equals(0));
      expect(cleric.pray(3), equals(0));
      expect(cleric.pray(5), equals(0));
      expect(cleric.pray(10), equals(0));
      expect(cleric.pray(100), equals(0));
    });

    test('selfAid 발동 후 최대치 이내 회복', () {
      // given
      Cleric cleric1 = Cleric('이학민');
      Cleric cleric2 = Cleric('홍길동');

      cleric1.selfAid(); // 1번 인스턴스 mp 5 소모, 잔여량: 5
      cleric2.selfAid(); // 2번 인스턴스 mp 5 소모, 잔여량: 5

      // when
      int prayResult1 = cleric1.pray(1);
      int prayResult2 = cleric2.pray(3);

      // then
      expect(prayResult1, greaterThanOrEqualTo(1));
      expect(prayResult1, lessThanOrEqualTo(3));
      expect(prayResult2, greaterThanOrEqualTo(3));
      expect(prayResult2, lessThanOrEqualTo(5));
    });

    test('selfAid 발동 후 최대치 초과 회복', () {
      // given
      Cleric cleric1 = Cleric('이학민');
      Cleric cleric2 = Cleric('홍길동');

      cleric1.selfAid(); // 1번 인스턴스 mp 5 소모, 잔여량: 5
      cleric2.selfAid(); // 2번 인스턴스 mp 5 소모, 잔여량: 5

      // when
      int prayResult1 = cleric1.pray(24);
      int prayResult2 = cleric2.pray(36);

      // then
      // 실질 회복량은 5를 초과할 수 없음.
      expect(prayResult1, equals(5));
      expect(prayResult2, equals(5));
    });

    test('selfAid mp 소모 및 hp 회복 검증', () {
      // given
      Cleric cleric = Cleric('이학민');

      // when
      cleric.selfAid();

      // then
      expect(cleric.mp, equals(5));
      expect(cleric.hp, equals(50));
    });
  });
}

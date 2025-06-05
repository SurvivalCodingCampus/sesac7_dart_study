import 'package:modu_3_dart_study/cleric.dart';
import 'package:test/test.dart';

void main() {
  group('Cleric Test', () {
    test('생성자 확인', () {
      // given
      final int testHp = 100;
      final int testMp = 50;
      final Cleric cleric1 = Cleric('이학민');
      final Cleric cleric2 = Cleric('카리나', hp: testHp);
      final Cleric cleric3 = Cleric('홍길동', hp: testHp, mp: testMp);

      // when & then
      expect(cleric1.name, equals('이학민'));
      expect(cleric1.hp, equals(Cleric.maxHp));
      expect(cleric1.mp, equals(Cleric.maxMp));

      expect(cleric2.name, equals('카리나'));
      expect(cleric2.hp, equals(testHp));
      expect(cleric2.mp, equals(Cleric.maxMp));

      expect(cleric3.name, equals('홍길동'));
      expect(cleric3.hp, equals(testHp));
      expect(cleric3.mp, equals(testMp));
    });

    test('selfAid mp 소모 및 hp 회복 검증', () {
      // given
      final Cleric cleric = Cleric('이학민');

      // when
      cleric.selfAid();

      // then
      expect(cleric.mp, equals(5));
      expect(cleric.hp, equals(50));
    });

    test('mp가 0인 상태에서 selfAid 발동 시 hp를 회복하지 않음', () {
      // given
      final Cleric cleric = Cleric('이학민');
      cleric.hp = 0;
      cleric.mp = 0;

      // when
      cleric.selfAid();

      // then
      expect(cleric.hp, equals(0));
    });

    test('mp가 최대치인 상태에서는 pray 마법을 발동해도 mp 회복 값은 0', () {
      // given
      final Cleric cleric = Cleric('이학민');

      // when & then
      // 아무런 행동도 하지 않아 mp 잔여량이 최대치일 것이므로, pray를 아무리 발동해도 리턴 값은 0.
      for (int i = 0; i < 50; i++) {
        expect(cleric.pray(i), equals(0));
      }
    });

    test('selfAid 발동 후 pray 마법 발동으로 mp 최대치 이내 회복', () {
      // given
      final int testSecond1 = 1;
      final int testSecond2 = 3;
      final Cleric cleric1 = Cleric('이학민');
      final Cleric cleric2 = Cleric('홍길동');

      cleric1.selfAid(); // 1번 인스턴스 mp 5 소모, 잔여량: 5
      cleric2.selfAid(); // 2번 인스턴스 mp 5 소모, 잔여량: 5

      // when
      final int prayResult1 = cleric1.pray(testSecond1);
      final int prayResult2 = cleric2.pray(testSecond2);

      // then
      expect(prayResult1, greaterThanOrEqualTo(testSecond1));
      expect(prayResult1, lessThanOrEqualTo(testSecond1 + 2));
      expect(prayResult2, greaterThanOrEqualTo(testSecond2));
      expect(prayResult2, lessThanOrEqualTo(testSecond2 + 2));
    });

    test('selfAid 발동 후 pray 마법 발동으로 mp 최대치 초과 회복', () {
      // given
      final int testSecond1 = 24;
      final int testSecond2 = 36;
      final int selfAidMpCost = 5; // selfAid mp 소모량
      final Cleric cleric1 = Cleric('이학민');
      final Cleric cleric2 = Cleric('홍길동');

      cleric1.selfAid(); // 1번 인스턴스 mp 5 소모, 잔여량: 5
      cleric2.selfAid(); // 2번 인스턴스 mp 5 소모, 잔여량: 5

      // when
      final int prayResult1 = cleric1.pray(testSecond1);
      final int prayResult2 = cleric2.pray(testSecond2);

      // then
      // 실질 회복량은 5를 초과할 수 없음.
      expect(prayResult1, equals(Cleric.maxMp - selfAidMpCost));
      expect(prayResult2, equals(Cleric.maxMp - selfAidMpCost));
    });
  });
}

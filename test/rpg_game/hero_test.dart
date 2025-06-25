import 'package:modu_3_dart_study/rpg_game/hero.dart';
import 'package:test/test.dart';

void main() {
  group('Hero Test', () {
    test('생성자 테스트', () {
      // given
      final int testHp = 100;
      final Hero hero = Hero(name: '이학민', hp: testHp);

      // when & then
      expect(hero.name, equals('이학민'));
      expect(hero.hp, equals(testHp));
      expect(hero.hpMax, equals(testHp)); // 입력으로 받은 hp 값이 곧 hp 최대치로 설정
    });

    test('setter 동작 여부 확인', () {
      // given
      final int testHp = 100;
      final int testInputHp = 200;
      final Hero hero = Hero(name: '이학민', hp: testHp);

      // when
      // hpMax는 final로 선언된 상수라 변경 불가능
      hero.name = '홍길동';
      hero.hp = testInputHp;

      // then
      expect(hero.name, equals('홍길동'));
      expect(hero.hp, equals(testInputHp));
    });

    test('각 메소드 동작 여부 확인', () {
      // given
      final int testHp = 100;
      final Hero hero = Hero(name: '이학민', hp: testHp);

      // when & then
      expect(() => hero.attack(), returnsNormally);
      expect(() => hero.run(), returnsNormally);
    });
  });
}

import 'package:modu_3_dart_study/hero.dart';
import 'package:modu_3_dart_study/poison_slime.dart';
import 'package:test/test.dart';

void main() {
  group('PoisonSlime Test', () {
    test('생성자 테스트', () {
      // given
      final PoisonSlime poisonSlime1 = PoisonSlime('레드 슬라임');
      final PoisonSlime poisonSlime2 = PoisonSlime('블루 슬라임');
      final PoisonSlime poisonSlime3 = PoisonSlime('그린 슬라임');

      // when & then
      expect(poisonSlime1.suffix, equals('레드 슬라임'));
      expect(poisonSlime2.suffix, equals('블루 슬라임'));
      expect(poisonSlime3.suffix, equals('그린 슬라임'));
    });

    test('독 살포 가능 횟수가 남아있을 때 정상적으로 살포하는지? ', () {
      // given
      final int poisonCountInit = 5; // 독 살포 횟수 최초 초기화 값(고정)
      final int poisonCountStandard = 0; // 독 살포 횟수의 하한선 값
      final int testHp = 1000; // 용사가 죽는 것을 방지하기 위해 임의의 매우 큰 값 제공
      final int dieHp = 0;
      final PoisonSlime poisonSlime1 = PoisonSlime('레드 슬라임');
      final PoisonSlime poisonSlime2 = PoisonSlime('블루 슬라임');
      final PoisonSlime poisonSlime3 = PoisonSlime('그린 슬라임');
      final Hero hero1 = Hero(name: 'name', hp: testHp);
      final Hero hero2 = Hero(name: 'name', hp: testHp);
      final Hero hero3 = Hero(name: 'name', hp: testHp);

      // 공격 횟수 경계값 설정
      final int testAttackCount1 = 4;
      final int testAttackCount2 = 5;
      final int testAttackCount3 = 6;

      // when & then
      // 공격 횟수가 4번 혹은 5번일 때는 문제 없이 독을 모두 살포하지만,
      expect(poisonSlime1.poisonCount, equals(poisonCountInit));
      for (int i = 0; i < testAttackCount1; i++) {
        expect(() => poisonSlime1.attack(hero1), returnsNormally);
      }
      expect(
        poisonSlime1.poisonCount,
        equals(poisonCountInit - testAttackCount1),
      );
      expect(hero1.hp, lessThan(testHp));
      expect(hero1.hp, greaterThan(dieHp));

      expect(poisonSlime2.poisonCount, equals(poisonCountInit));
      for (int i = 0; i < testAttackCount2; i++) {
        expect(() => poisonSlime2.attack(hero2), returnsNormally);
      }
      expect(
        poisonSlime2.poisonCount,
        equals(poisonCountInit - testAttackCount2),
      );
      expect(hero2.hp, lessThan(testHp));
      expect(hero2.hp, greaterThan(dieHp));

      // 공격 횟수가 6번인 경우 5번은 독을 살포하고 마지막엔 독 살포 횟수가 부족하여 살포하지 않는다.
      expect(poisonSlime3.poisonCount, equals(poisonCountInit));
      for (int i = 0; i < testAttackCount3; i++) {
        expect(() => poisonSlime3.attack(hero3), returnsNormally);
      }
      expect(poisonSlime3.poisonCount, equals(poisonCountStandard));
      expect(hero3.hp, lessThan(testHp));
      expect(hero3.hp, greaterThan(dieHp));
    });

    test('용사가 이미 죽었다면 공격을 하지 않는다', () {
      // given
      final int testHp = 100;
      final int heroAttackHpStandard = 0; // 용사를 공격할 수 있는 hp 기준.
      final PoisonSlime poisonSlime = PoisonSlime('레드 슬라임');
      final Hero hero = Hero(name: 'name', hp: testHp);

      // when & then
      hero.hp -= testHp; // 용사는 죽은 상태
      poisonSlime.attack(hero);
      expect(hero.hp, equals(heroAttackHpStandard));
    });
  });
}

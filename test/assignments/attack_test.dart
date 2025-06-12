import 'package:modu_3_dart_study/assignments/hero.dart';
import 'package:modu_3_dart_study/assignments/poison_slime.dart';
import 'package:test/test.dart';

void main() {
  group('Poison slime 테스트', () {
    test('slime 공격 테스트', () {
      final hero = Hero('hero1', 100, 100);
      final poisonSlime = PoisonSlime('A');

      poisonSlime.attack(hero);

      // 일반 데미지: 10 + 독 데미지 20 (100 / 5)
      // 기본적으로 줄어들긴 해야 함
      expect(hero.hp, lessThan(100));
    });

    test('poison 공격 최대 5회 가능 테스트', () {
      final hero = Hero('hero2', 100, 100);
      final poisonSlime = PoisonSlime('A');

      for (int i = 0; i < 6; i++) {
        poisonSlime.attack(hero);
      }
      // 5번 사용 후 0
      expect(poisonSlime.poisonCount, 0);
    });

    test('poison 데미지 hp 1/5 테스트', () {
      // hp 95 설정
      final hero = Hero('hero3', 95, 100);
      final poisonSlime = PoisonSlime('A');

      poisonSlime.attack(hero);

      // 95 - 10(기본) = 85
      final expectedPoisonDamage = (85 / 5).floor();
      final expectedHp = 95 - 10 - expectedPoisonDamage;

      expect(hero.hp, expectedHp);
    });
  });
}

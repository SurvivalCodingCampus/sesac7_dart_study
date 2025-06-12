import 'package:modu_3_dart_study/assignments/2025-06-12/poison_slime.dart';
import 'package:modu_3_dart_study/hero.dart';
import 'package:test/test.dart';

void main() {
  group('PoisonSlime 테스트', () {
    final fixHp = 40;

    test('생성자 테스트 (2번)', () {
      PoisonSlime poisonSlime = PoisonSlime('화이트');
      expect(poisonSlime.suffix == '화이트', true);
    });

    test('poisonCount 초기화 테스트 (3번)', () {
      PoisonSlime poisonSlime = PoisonSlime('블랙');
      expect(poisonSlime.poisonCount, 5);
    });

    test('PoisonSlime attack() 테스트 (4번)', () {
      PoisonSlime poisonSlime = PoisonSlime('블랙');
      Hero hero = Hero(name: '임찬규', hp: fixHp);

      int initialPoisonCount = poisonSlime.poisonCount;
      int initialHeroHp = hero.hp; // 40
      int firstAttackDamage = 10;
      int poisonAttackDamage = ((initialHeroHp - firstAttackDamage) / 5)
          .toInt(); // 6

      poisonSlime.attack(hero); //24

      expect(hero.hp, initialHeroHp - firstAttackDamage - poisonAttackDamage);
      expect(poisonSlime.poisonCount, initialPoisonCount - 1);
    });
  });
}

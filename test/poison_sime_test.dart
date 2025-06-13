import 'package:modu_3_dart_study/character/hero.dart';
import 'package:modu_3_dart_study/monster/poison_slime.dart';
import 'package:modu_3_dart_study/monster/slime.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('PoisonSlimeTest', () {
    test('PoisonSlime 클래스 생성자 테스트', () {
      final String testPoisonSlimeSuffix = '독 슬라임';
      final PoisonSlime poisonSlime = PoisonSlime(testPoisonSlimeSuffix);

      expect(poisonSlime.suffix, testPoisonSlimeSuffix);
    });
    group('PoisonSlime 클래스 상속 테스트', () {
      test('PoisonSlime 클래스 상속 멤버 테스트', () {
        final String testPoisonSlimeSuffix = '독 슬라임';
        final PoisonSlime poisonSlime = PoisonSlime(testPoisonSlimeSuffix);
        final String testSlimeSuffix = '슬라임';
        final Slime slime = Slime(testSlimeSuffix);

        expect(poisonSlime is Slime, isTrue);
        expect(slime is PoisonSlime, isFalse); // Slime은 PoisonSlime의 SuperClass임으로 말이 안된다.
        expect(poisonSlime.hp, equals(slime.hp));
        expect(poisonSlime.level, equals(slime.level));
        expect(poisonSlime.slimeAttackDamage, equals(slime.slimeAttackDamage));
      });
      test('PoisonSlime 클래스 상속 attack Slime 클래스 데미지 반영 테스트', () {
        final String testPoisonSlimeSuffix = '독 슬라임';
        final PoisonSlime poisonSlime = PoisonSlime(testPoisonSlimeSuffix);
        final String testHeroName = '영웅';
        final int testHeroHp = 100;
        final Hero hero = Hero(name: testHeroName, hp: testHeroHp);

        poisonSlime.attack(hero);

        final int poisonDamage = ((testHeroHp - poisonSlime.slimeAttackDamage) * poisonSlime.poisonDamageRatio).toInt();
        final int superClassAttackDamage = hero.heroMaxHp - hero.hp - poisonDamage; // PoisonSlime의 독데미지를 제외한 super.attack 공격이 들어갔는지 확인

        expect(poisonSlime.slimeAttackDamage, superClassAttackDamage);
      });
    });
    test('PoisonSlime 클래스 attack Hero hp 추가 독데미지 확인 테스트', () {
      final String testPoisonSlimeSuffix = '독 슬라임';
      final PoisonSlime poisonSlime = PoisonSlime(testPoisonSlimeSuffix);
      final String testHeroName = '영웅';
      final int testHeroHp = 100;
      final Hero hero = Hero(name: testHeroName, hp: testHeroHp);

      poisonSlime.attack(hero);

      final int poisonDamage = ((testHeroHp - poisonSlime.slimeAttackDamage) * poisonSlime.poisonDamageRatio).toInt();
      final int excludeSlimeAttackDamage = hero.heroMaxHp - hero.hp - poisonSlime.slimeAttackDamage;
      expect(excludeSlimeAttackDamage, equals(poisonDamage));
    });
    test('PoisonSlime 클래스 attack poisonCount 0 테스트', () {
      final String testPoisonSlimeSuffix = '독 슬라임';
      final PoisonSlime poisonSlime = PoisonSlime(testPoisonSlimeSuffix);
      final String testHeroName = '영웅';
      final int testHeroHp = 100;
      final Hero hero = Hero(name: testHeroName, hp: testHeroHp);

      poisonSlime.poisonCount = 0;
      poisonSlime.attack(hero);

      expect(hero.hp, equals(hero.heroMaxHp - poisonSlime.slimeAttackDamage));
    });
  });
  test('PoisonSlime 클래스 poisonCount 0 미만 setter throw 테스트', () {
    final String testPoisonSlimeSuffix = '독 슬라임';
    final PoisonSlime poisonSlime = PoisonSlime(testPoisonSlimeSuffix);

    expect(() => poisonSlime.poisonCount = -1, throwsException);
  });
}
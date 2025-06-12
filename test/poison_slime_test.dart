import 'package:modu_3_dart_study/hero.dart';
import 'package:modu_3_dart_study/poison_slime.dart';
import 'package:modu_3_dart_study/slime.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('PoisonSLime 클래스 테스트', () {
    final String testSuffix = 'test suffix';
    final String heroName = '홍길동';
    final int heroHp = 200;
    final poisonSLime = PoisonSlime(testSuffix);
    final hero = Hero(name: heroName, hp: heroHp);
    final int defaultPoisonCount = 5;
    final int slimeAttackCount = 7;

    test('슈퍼 클래스의 suffix를 받는 생성자 서브 클래스에서 테스트', () {
      final superSlime = Slime(testSuffix);
      final subSlime = PoisonSlime(testSuffix);

      expect(superSlime.suffix == testSuffix, equals(true));
      expect(subSlime.suffix == testSuffix, equals(true));
    });

    test('독 공격 가능 횟수 poisonCount 초깃값 5인지 테스트', () {
      expect(poisonSLime.poisonCount == defaultPoisonCount, equals(true));
    });

    test('PoisonSlime attack() 테스트', () {
      int testPoisonCount = defaultPoisonCount;

      for (int i = 0; i < slimeAttackCount; i++) {
        poisonSLime.attack(hero);
        if (testPoisonCount > 0) testPoisonCount--;
        expect(poisonSLime.poisonCount == testPoisonCount, equals(true));
      }
    });
  });
}

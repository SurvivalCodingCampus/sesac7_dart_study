import 'package:modu_3_dart_study/250604/hero.dart';
import 'package:modu_3_dart_study/250604/poison_slime.dart';
import 'package:test/test.dart';

void main() {
  group('[PoisonSlime 테스트]\n', () {
    test('초기값테스트', () {
      PoisonSlime poisonSlime = PoisonSlime('A');

      expect(poisonSlime.suffix, equals('A'));
      expect(poisonSlime.poisonCount, equals(5));
    });

    test('attack테스트', () {
      Hero hero = Hero('heroA', 100);
      PoisonSlime poisonSlime = PoisonSlime('A');

      // int heroHP = hero.hp;
      // heroHP -= 10; //90
      // int damage = heroHP ~/ 5;//18
      // heroHP -= damage; //72

      poisonSlime.attack(hero);
      expect(hero.hp, equals(72));

      // int heroHP = hero.hp;
      // heroHP -= 10; //62
      // int damage = heroHP ~/ 5;//12
      // heroHP -= damage; //50

      poisonSlime.attack(hero);
      expect(hero.hp, equals(50));
    });
  });
}

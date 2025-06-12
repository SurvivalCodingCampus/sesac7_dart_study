import 'package:test/test.dart';
import 'package:modu_3_dart_study/assignments/2025-06-12/hero.dart';
import 'package:modu_3_dart_study/assignments/2025-06-12/slime.dart';

void main() {
  group('GROUP : Constructor tests for Hero and Slime\n', () {
    test('Hero, Slime, PoisonSlime instance', () {
      //given
      Hero hero = Hero('초보자', hp: 100);
      Slime slime = Slime('째깐이');
      PoisonSlime poisonSlime = PoisonSlime('맹독째깐이');
      //when
      //then
      // Test for Hero's name, hp, and maxHP
      expect(hero.name, '초보자');
      expect(hero.hp, 100);
      expect(hero.maxHP, 100);
      // Test for slime's suffix and hp(default value = 50)
      expect(slime.suffix, '째깐이');
      expect(slime.hp, 50);
      // Test for poisonSlime's suffix, hp(default value = 50), and poisonCount(default value = 5)
      expect(poisonSlime.suffix, '맹독째깐이');
      expect(poisonSlime.hp, 50);
      expect(poisonSlime.poisonCount, 5);
    });
  });

  group('GROUP : Attack method test for Hero and Slime\n', () {
    test('Hero and Slime_attack method test : basic case', () {
      //given
      Hero hero = Hero('초보자', hp: 100);
      Slime slime = Slime('째깐이');
      //when
      // Hero method class attack() and run() are simple text output at the moment, therefore not testsed.
      // the section focus on testing attack(Hero) method of Slime.
      slime.attack(hero);
      //then
      // 100(set hp of Hero) - 10(fixed damage of Slime)
      expect(hero.hp, 90);
    });
    test('Hero and Slime_attack method test : Hero low hp case', () {
      //given
      Hero hero = Hero('초보자', hp: 5);
      Slime slime = Slime('째깐이');
      //when
      slime.attack(hero);
      //then
      // 5(set hp of Hero) - 10(fixed damage of Slime) = -5 but negative health changes to zero
      expect(hero.hp, 0);
    });
    test('Hero and PoisonSlime_attack method test : basic case', () {
      //given
      Hero hero = Hero('초보자', hp: 100);
      PoisonSlime poisonSlime = PoisonSlime('맹독째깐이');
      //when
      poisonSlime.attack(hero);
      //then
      // 100(set hp of Hero) - 10(fixed damage of Slime) = 90, // poison damage: 90 - 90/5(18) = 72(final value)
      expect(hero.hp, 72);
      // poisonCount 5 - 1 = 4
      expect(poisonSlime.poisonCount, 4);
    });
    test('Hero and PoisonSlime_attack method test : Hero low hp case', () {
      //given
      Hero hero = Hero('초보자', hp: 5);
      PoisonSlime poisonSlime = PoisonSlime('맹독째깐이');
      //when
      poisonSlime.attack(hero);
      //then
      // 5(set hp of Hero) - 10(fixed damage of Slime) = -5 becomes 0, // poison damage: 0
      expect(hero.hp, 0);
      // poisonCount 5 - 1 = 4
      expect(poisonSlime.poisonCount, 4);
    });
    test(
      'Hero and PoisonSlime_attack method test : Slime run out of poisonCount case',
      () {
        //given
        Hero hero = Hero('초보자', hp: 100);
        PoisonSlime poisonSlime = PoisonSlime('맹독째깐이');
        poisonSlime.poisonCount = 0;
        //when
        poisonSlime.attack(hero);
        //then
        // 100(set hp of Hero) - 10(fixed damage of Slime) = 90, // poison damage: x
        expect(hero.hp, 90);
        // poisonCount is still 0
        expect(poisonSlime.poisonCount, 0);
      },
    );
    test(
      'Hero and PoisonSlime_attack method test : Slime attacks twice with only one poisonCount',
      () {
        //given
        Hero hero = Hero('초보자', hp: 100);
        PoisonSlime poisonSlime = PoisonSlime('맹독째깐이');
        poisonSlime.poisonCount = 1;
        //when
        poisonSlime.attack(hero);
        //then
        // 100(set hp of Hero) - 10(fixed damage of Slime) = 90, // poison damage: 90 - 90/5(18) = 72(final value)
        expect(hero.hp, 72);
        expect(poisonSlime.poisonCount, 0);
        //when
        poisonSlime.attack(hero);
        //then
        // 72(remaining hp of Hero) - 10(fixed damage of Slime) = 62, // poison damage : x
        expect(hero.hp, 62);
        expect(poisonSlime.poisonCount, 0);
      },
    );
  });
}

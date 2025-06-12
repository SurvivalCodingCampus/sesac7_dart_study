import 'package:test/test.dart';
import 'package:modu_3_dart_study/assignments/2025-06-12/hero.dart';
import 'package:modu_3_dart_study/assignments/2025-06-12/slime.dart';

void main() {
  group('Constructor tests for Hero and Slime', () {
    test('Hero, Slime, PoisonSlime instance', () {
      //given
      Hero hero = Hero('초보자', hp: 100);
      Slime slime = Slime('째깐이');
      PoisonSlime poisonSlime = PoisonSlime('맹독째깐이');
      //when
      //then
      //Test for hero's name and hp
      expect(hero.name, '초보자');
      expect(hero.hp, 100);
      expect(hero.maxHP, 100);
      //Test for slime's suffix and hp(default value = 50)
      expect(slime.suffix, '째깐이');
      expect(slime.hp, 50);
      //Test for poisonSlime's suffix, hp(default value = 50), and poisonCount(default value = 5)
      expect(poisonSlime.suffix, '맹독째깐이');
      expect(poisonSlime.hp, 50);
      expect(poisonSlime.poisonCount, 5);
    });
  });

  group('Method test for Hero and Slime', () {
    test('Hero and Slime method test : basic case', () {
      //given
      Hero hero = Hero('초보자', hp: 100);
      Slime slime = Slime('째깐이');
      //when
      //hero 클래스의 메소드 attack()과 run()은 현재로서는 단순히 콘솔 텍스트 출력이 전부이므로 테스트 하지 않았습니다.
      //따라서 slime의 attack(hero)를 중점적으로 테스트합니다.
      slime.attack(hero);
      //then
      // 100(설정된 히어로의 체력) - 10(슬라임의 기본 공격력)
      expect(hero.hp, 90);
    });
    test('Hero and Slime method test : hero low hp case', () {
      //given
      Hero hero = Hero('초보자', hp: 5);
      Slime slime = Slime('째깐이');
      //when
      slime.attack(hero);
      //then
      // 5(설정된 히어로의 체력) - 10(슬라임의 기본 공격력) = -5 but 체력은 0 이하로 낮아지지 않고 음수의 체력은 0으로 변환됩니다.
      expect(hero.hp, 0);
    });
    test('Hero and PoisonSlime method test : basic case', () {
      //given
      Hero hero = Hero('초보자', hp: 100);
      PoisonSlime poisonSlime = PoisonSlime('맹독째깐이');
      //when
      poisonSlime.attack(hero);
      //then
      // 100(설정된 히어로의 체력) - 10(슬라임의 기본공격력) = 90, // 독딜: 90 - 90/5(18) = 72(최종값)
      expect(hero.hp, 72);
      // poisonCount가 5 - 1 = 4
      expect(poisonSlime.poisonCount, 4);
    });
    test('Hero and PoisonSlime method test : hero low hp case', () {
      //given
      Hero hero = Hero('초보자', hp: 5);
      PoisonSlime poisonSlime = PoisonSlime('맹독째깐이');
      //when
      poisonSlime.attack(hero);
      //then
      // 5(설정된 히어로의 체력) - 10(슬라임의 기본공격력) = -5 becomes 0, // 독딜: 0
      expect(hero.hp, 0);
      // poisonCount가 5 - 1 = 4
      expect(poisonSlime.poisonCount, 4);
    });
    test('Hero and Slime method test : slime run out of poisonCount case', () {
      //given
      Hero hero = Hero('초보자', hp: 100);
      PoisonSlime poisonSlime = PoisonSlime('맹독째깐이');
      poisonSlime.poisonCount = 0;
      //when
      poisonSlime.attack(hero);
      //then
      // 100(설정된 히어로의 체력) - 10(슬라임의 기본공격력) = 90, // 독딜: x
      expect(hero.hp, 90);
      // poisonCount가 0
      expect(poisonSlime.poisonCount, 0);
    });
    test(
      'Hero and Slime method test : slime attack twice with only one poisonCount',
      () {
        //given
        Hero hero = Hero('초보자', hp: 100);
        PoisonSlime poisonSlime = PoisonSlime('맹독째깐이');
        poisonSlime.poisonCount = 1;
        //when
        poisonSlime.attack(hero);
        //then
        // 100(설정된 히어로의 체력) - 10(슬라임의 기본공격력) = 90, // 독딜: 90 - 90/5(18) = 72(최종값)
        expect(hero.hp, 72);
        expect(poisonSlime.poisonCount, 0);
        //when
        poisonSlime.attack(hero);
        //then
        // 72(남은 히어로의 체력) - 10(슬라임의 기본공격력) = 62, // 독딜 : x
        expect(hero.hp, 62);
        expect(poisonSlime.poisonCount, 0);
      },
    );
  });
}

import 'package:modu_3_dart_study/20250611/wand.dart';
import 'package:modu_3_dart_study/20250611/wizard.dart';
import 'package:modu_3_dart_study/20250612/greatWizard.dart';
import 'package:modu_3_dart_study/hero.dart';
import 'package:modu_3_dart_study/poisonSlime.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  final slimeAttackCount = 5;
  final heroMaxHp = 100;

  late PoisonSlime poisonSlime;
  late Hero hero;
  late Wand wand;
  late Wizard wizard;
  late GreatWizard greatWizard;

  group('영웅, 마법사, 슬라임 연계 테스트', ()
  {
    setUp( () {
      poisonSlime = PoisonSlime('독슬라임');
      hero = Hero('울트라맨', hp: heroMaxHp);
      wand = Wand('일반지팡이', power: 100);
      wizard = Wizard('일반마법사', hp: 80, wand: wand);
      greatWizard = GreatWizard('슈퍼마법사', hp: 100, wand: wand);
    });

    test('영웅의 HP보다 더 큰 공격 시 0', () {
      // 독슬라임이 울트라맨을 연속 6번 공격
      for (var i = 0; i < slimeAttackCount + 1; i++) {
        poisonSlime.attack(hero);
      }

      expect(hero.hp, 0);
    });

    test('독슬라임의 2번 공격 후 superHeal받았을때 영웅 HP 최대 확인', () {
      for (var i = 0; i < 2; i++) {
        poisonSlime.attack(hero);
      }
      greatWizard.superHeal(hero);
      expect(hero.hp, heroMaxHp);
    });

    test('독슬라임의 5번 공격 후 잔여 poisonCount', () {
      // 독슬라임이 울트라맨을 연속 5번 공격
      for (var i = 0; i < slimeAttackCount; i++) {
        poisonSlime.attack(hero);
      }

      expect(poisonSlime.poisonCount, 0);
    });

    test('독슬라임의 2번 공격 후 Heal받았을때 영웅 HP 확인', () {
      // 독슬라임이 울트라맨을 연속 6번 공격
      for (var i = 0; i < 2; i++) {
        poisonSlime.attack(hero);
      }

      expect(hero.hp, 50); // 미리 계산했을때 잔여 50
    });

    test('슈퍼마법사 superHeal을 3번 시전했을 때 남은 MP', () {
      // 슈퍼마법사의 MP는 150, 한번 소모량 50
      for (var i = 0; i < 3; i++) {
        greatWizard.superHeal(hero);
      }

      expect(greatWizard.mp, 0);
    });
  });
}
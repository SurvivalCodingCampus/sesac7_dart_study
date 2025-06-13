import 'package:modu_3_dart_study/hero.dart';
import 'package:test/test.dart';
import 'package:modu_3_dart_study/poison_slime.dart';

void main() {
  test('PoisonSlime의 초기 공격값은 5이다', (){
    final slime01 = PoisonSlime('슬라임1');
    expect(slime01.poisonCount, 5);
  });

  test('기본 슬라임이 영웅 1회 공격', (){
    final hero01 = Hero(name: '영웅1', hp: Hero.defaultHp);
    final slime01 = Slime('슬라임1');

    slime01.attack(hero01);
    expect(hero01.hp, equals(Hero.defaultHp - 10));
  });

  test('독슬라임이 영웅 1회 공격시 영웅 hp에서 10hp 감소후 추가로 1/5 감소', (){
    final hero02 = Hero(name: '영웅2', hp: Hero.defaultHp);
    final slime02 = PoisonSlime('슬라임2');

    slime02.attack(hero02);

    final expectedAttack = Hero.defaultHp - Slime.defaultAttack;
    final expectedPoison = expectedAttack / 5;
    final expectHp = expectedAttack - expectedPoison;
    
    expect(hero02.hp, equals(expectHp));
  });

  test('독슬라임이 영웅 1회 공격시 poisonCount 1 감소', (){
    final hero03 = Hero(name: '영웅3', hp: Hero.defaultHp);
    final slime03 = PoisonSlime('슬라임3');

    slime03.attack(hero03);
    expect(slime03.poisonCount, equals(slime03.intPoisonCount - 1));
  });
  
}
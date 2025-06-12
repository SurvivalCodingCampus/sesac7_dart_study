import 'package:modu_3_dart_study/assignments/2025-06-12/slime.dart';
import 'package:modu_3_dart_study/hero.dart';
import 'package:test/test.dart';

void main() {
  test('Hero Test', () {
    //준비 given
    final hero = Hero(name: '홍길동', hp: 100);

    Slime slime = Slime('슬라임12');
    //실행 when
    hero.attack(slime);

    //검증 then
    expect(hero.hp, equals(99));
    //matcher는 실제로 맞는지 아닌지 검증하는 함수이다. equals가 matcher의 함수?
    //equals는 생략이 가능하다.
    //아래처럼 작성해도 가능.

    /*
    expect(hero.hp == 99,true);
    expect(hero.hp, 99);
    expect(hero.hp ==99 , isTrue);
    expect(hero.hp == 99 , equals(true));
    expect(hero.hp, isNot(100));
    */
  });
}

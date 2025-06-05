import 'package:modu_3_dart_study/hero.dart';
import 'package:test/test.dart';

void main() {
  test('Hero Test', () {
    // given
    Hero hero = Hero(name: '홍길동', hp: 100);

    // when
    hero.attack();  // 99

    // then
    expect(hero.hp, equals(99));
    expect(hero.hp == 99, equals(true));
    expect(hero.hp == 99, true);
    expect(hero.hp == 99, isTrue);
    expect(hero.hp, 99);
    expect(hero.hp, isNot(100));
  });
}
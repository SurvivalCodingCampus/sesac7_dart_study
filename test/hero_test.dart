import 'package:modu_3_dart_study/hero.dart';
import 'package:test/test.dart';

void main() {
  test('Hero Test', () {
    // given
    Hero hero = Hero('홍길동', 100);

    // when
    hero.attack();

    // then
    expect(hero.hp, equals(99));
  });
}
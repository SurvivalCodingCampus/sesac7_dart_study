import 'package:modu_3_dart_study/hero.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  test('heor test', () {
    // given
    final hero = Hero('히어로', 100);

    //when
    hero.damages();

    // then
    expect(hero.hp, equals(99));
  });
}
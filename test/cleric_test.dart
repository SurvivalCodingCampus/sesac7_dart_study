
import 'package:modu_3_dart_study/cleric.dart';
import 'package:test/test.dart';

void main() {
  test('selfAid 메서드 - MP가 충분할 때', () {
    // given
    Cleric cleric = Cleric();
    cleric.hp = 30; // HP 손상

    // when
    cleric.selfAid();

    //
    final expectedHp = cleric.maxHp;
    final expectedMp = cleric.mp - cleric.selfAidMp;

    // then
    expect(cleric.hp, equals(expectedHp));
    expect(cleric.mp, equals(expectedMp));
  });
}
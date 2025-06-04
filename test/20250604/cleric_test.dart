
import 'package:modu_3_dart_study/20250604/Cleric.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  test('cleric test', () {
    // given
    Cleric cleric = Cleric('성기사', 50, 10);

    //when
    print('20만큼 공격당했다');
    cleric.hp = cleric.hp - 20;
    print('1 현재 MP : ${cleric.mp}, 현재 HP : ${cleric.hp}');
    cleric.selfAid();
    print('2 현재 MP : ${cleric.mp}, 현재 HP : ${cleric.hp}');

    int mp = cleric.pray(1);
    print('회복된 MP : $mp');
    print('3 현재 MP : ${cleric.mp}, 현재 HP : ${cleric.hp}');

    print('40만큼 공격당했다');
    cleric.hp = cleric.hp - 40;
    print('4 현재 MP : ${cleric.mp}, 현재 HP : ${cleric.hp}');

    mp = cleric.pray(20);
    print('2 회복된 MP : $mp');

    print('5 현재 MP : ${cleric.mp}, 현재 HP : ${cleric.hp}');

    // then
    expect(true, cleric.mp <= 10);
    expect(true, cleric.hp <= 50 && cleric.hp > 0);
    expect(false, cleric.name.isEmpty);
  });
}
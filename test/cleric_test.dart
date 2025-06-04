import 'package:modu_3_dart_study/cleric.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  test('Cleric Test', () {
    Cleric cleric = new Cleric('성직자', 50, 50, 10, 10);

    expect(cleric.name, equals('성직자'));
    expect(cleric.hp, equals(50));
    expect(cleric.maxHp, equals(50));
    expect(cleric.mp, equals(10));
    expect(cleric.maxMp, equals(10));

  });

  test('Cleric Self Aid Test', () {
    Cleric cleric1 = new Cleric('성직자', 1, 50, 10, 10);
    Cleric cleric2 = new Cleric('성직자', 1, 50, 1, 10);

    cleric1.selfAid();
    cleric2.selfAid();

    // 자힐 가능 (mp가 5이상)
    expect(cleric1.hp, equals(cleric1.maxHp));
    expect(cleric1.mp, equals(cleric1.maxMp - 5));

    // 자힐 불가능 (mp가 5미만)
    expect(cleric2.mp < 5, equals(true));
    expect(cleric2.hp == cleric2.maxHp, equals(false));
  });
}
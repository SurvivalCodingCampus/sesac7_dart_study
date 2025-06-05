import 'dart:math';

import 'package:modu_3_dart_study/cleric.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  test('Cleric Test', () {
    final cleric = Cleric('성직자', 50, 10);

    expect(cleric.name, equals('성직자'));
    expect(cleric.hp, equals(50));
    expect(cleric.maxHp, equals(50));
    expect(cleric.mp, equals(10));
    expect(cleric.maxMp, equals(10));
  });

  test('Cleric Self Aid Test', () {
    final cleric1 = Cleric('성직자', 1, 10);
    final cleric2 = Cleric('성직자', 1, 1);

    cleric1.selfAid();
    cleric2.selfAid();

    // 자힐 가능 (mp가 5이상)
    expect(cleric1.hp, equals(cleric1.maxHp));
    expect(cleric1.mp, equals(cleric1.maxMp - 5));

    // 자힐 불가능 (mp가 5미만)
    expect(cleric2.mp < 5, equals(true));
    expect(cleric2.hp == cleric2.maxHp, equals(false));
  });

  test('Cleric Pray Test', () {
    // mp가 최대가 아닌 성직자
    final cleric1 = Cleric('성직자', 50, 0);
    final cleric2 = Cleric('성직자', 50, 9);

    // mp가 최대인 성직자
    final cleric3 = Cleric('성직자', 50, 10);

    int recoveryMp1 = cleric1.pray(Random().nextInt(cleric1.maxMp + 1));
    int recoveryMp2 = cleric2.pray(1);
    int recoveryMp3 = cleric3.pray(1);

    expect(recoveryMp1 >= 1 && recoveryMp1 <= 10, equals(true));
    expect(recoveryMp2, equals(1));
    expect(recoveryMp3, equals(0));
  });
}

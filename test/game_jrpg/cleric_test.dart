import 'dart:math';

import 'package:modu_3_dart_study/game_jrpg/cleric.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  test('Cleric Test', () {
    final cleric = Cleric('성직자', hp: 50, mp: 10);

    expect(cleric.name, equals('성직자'));
    expect(cleric.hp, equals(50));
    expect(Cleric.maxHp, equals(50));
    expect(cleric.mp, equals(10));
    expect(Cleric.maxMp, equals(10));
  });

  test('Cleric Self Aid Test', () {
    final cleric1 = Cleric('성직자', hp: 1, mp: 10);
    final cleric2 = Cleric('성직자', hp: 1, mp: 1);

    cleric1.selfAid();
    cleric2.selfAid();

    // 자힐 가능 (mp가 5이상)
    expect(cleric1.hp, equals(Cleric.maxHp));
    expect(cleric1.mp, equals(Cleric.maxMp - 5));

    // 자힐 불가능 (mp가 5미만)
    expect(cleric2.mp < 5, equals(true));
    expect(cleric2.hp == Cleric.maxHp, equals(false));
  });

  test('Cleric Pray Test', () {
    // mp가 최대가 아닌 성직자
    final cleric1 = Cleric('성직자', hp: 50, mp: 0);
    final cleric2 = Cleric('성직자', hp: 50, mp: 9);

    // mp가 최대인 성직자
    final cleric3 = Cleric('성직자', hp: 50, mp: 10);

    int recoveryMp1 = cleric1.pray(Random().nextInt(Cleric.maxMp + 1));
    int recoveryMp2 = cleric2.pray(1);
    int recoveryMp3 = cleric3.pray(1);

    expect(recoveryMp1 >= 0 && recoveryMp1 <= 10, equals(true));
    expect(recoveryMp2, equals(1));
    expect(recoveryMp3, equals(0));
  });

  test('Cleric 생성자 테스트', () {
    final clericAllParam = Cleric('아서스', hp: 40, mp: 5);
    final clericNameHP = Cleric('아서스', hp: 35);
    final clericName = Cleric('아서스');
    // final clericNoName = Cleric(); 필수 파라미터인 이름이 없기에 인스턴스화 불가
    final clericNameMP = Cleric('아서스', mp: 10);

    // 이름, hp, mp 모두 지정한 생성자 인스턴스화 테스트
    expect(clericAllParam.name == '아서스', true);
    expect(clericAllParam.hp == 40, true);
    expect(clericAllParam.mp == 5, true);

    // 이름, hp만 지정한 생성자 인스턴스화 테스트
    expect(clericNameHP.name == '아서스', true);
    expect(clericNameHP.hp == 35, true);
    expect(clericNameHP.mp == Cleric.maxMp, true);

    // 이름만 지정한 생성자 인스턴스화 테스트
    expect(clericName.name == '아서스', true);
    expect(clericName.hp == Cleric.maxHp, true);
    expect(clericName.mp == Cleric.maxMp, true);

    // 이름, mp만 지정한 생성자 인스턴스화 테스트
    expect(clericNameMP.name == '아서스', true);
    expect(clericNameMP.hp == Cleric.maxHp, true);
    expect(clericNameMP.mp == 10, true);
  });
}

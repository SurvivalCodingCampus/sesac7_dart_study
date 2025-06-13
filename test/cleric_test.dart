import 'dart:math';

import 'package:modu_3_dart_study/character/cleric.dart';
import 'package:test/test.dart';

void main() {
  group('Cleric Test', () {
    test('최초 Cleric 인스턴스 생성 후 속성값 확인', () {
      final clericName = 'Cleric';
      final cleric = Cleric(clericName);

      expect(cleric.name, equals(clericName));
      expect(cleric.mp, equals(Cleric.maxMp)); // 최초 mp 값이 MaxMp값과 동일한지 확인
      expect(cleric.hp, equals(Cleric.maxHp)); // 최초 hp 값이 MaxHp값과 동일한지 확인
    });

    test('selfAid 호출 시 최소 mp 값 검증', () {
      final cleric = Cleric('Cleric');

      cleric.mp = 3;
      final int currentMp = cleric.mp;

      cleric.selfAid();

      expect(cleric.mp, equals(currentMp));
    });

    test('selfAid 호출 시 hp값 maxHp값 반영 검증', () {
      final cleric = Cleric('Cleric');

      cleric.hp = 15;

      cleric.selfAid();

      expect(cleric.hp == Cleric.maxHp, equals(true));
    });

    test('pray 호출 시 mp 회복 값 반영 검증', () {
      final cleric = Cleric('Cleric');

      cleric.mp -= 6;
      final int beforeClericMp = cleric.mp;

      final int actualMp = cleric.pray(2); // 회복된 mp 값

      expect(cleric.mp == beforeClericMp + actualMp, equals(true));
    });

    test('pray 호출 후 현재 mp가 회복 요청시간 + 0 ~ 2 만큼 추가 되었는 지 검증', () {
      final cleric = Cleric('Cleric');

      cleric.mp = 4;

      int actualMp = cleric.pray(3);

      expect(actualMp, lessThanOrEqualTo(5));
    });

    test('pray 호출 후 현재 회복된 mp가 maxMp 값을 넘긴는 지 검증', () {
      final cleric = Cleric('Cleric');

      cleric.mp = Random().nextInt(Cleric.maxMp); // Cleric mp값을 maxMp값 내에서 랜덤으로 지정

      cleric.pray(Random().nextInt(100));

      expect(cleric.mp, lessThanOrEqualTo(Cleric.maxMp));
    });
  });

  test('Cleric 클래스의 static 멤버 maxHp, maxMp 값 불변 검증', () {
    int clericMaxHp = Cleric.maxHp;
    int clericMaxMp = Cleric.maxMp;

    clericMaxHp = 0; // ClericMaxHp 값을 0으로 저장
    clericMaxMp = 0; // ClericMaxMp 값을 0으로 저장

    // 변수 clericMaxHp와 clericMaxMp의 값을 변경하면 저장 되어있는 정적 멤버의 값도 변경 되는지 확인
    expect(Cleric.maxHp != clericMaxHp && Cleric.maxMp != clericMaxMp, equals(true));
  });

  group('Cleric Constructor Test', () {
    test('Cleric 클래스 생성자의 name, hp, mp를 받아서 생성하는 경우', () {
      final String clericName = '아서스';
      final int clericHp = 40;
      final int clericMp = 5;
      final cleric = Cleric(clericName, hp: clericHp, mp: clericMp);

      expect(cleric.name, equals(clericName));
      expect(cleric.hp, equals(clericHp));
      expect(cleric.mp, equals(clericMp));
    });
    
    test('Cleric 클래스 생성자의 name, hp를 받아서 생성하는 경우', () {
      final String clericName = '아서스';
      final int clericHp = 35;
      final cleric = Cleric(clericName, hp: clericHp);

      expect(cleric.name, equals(clericName));
      expect(cleric.hp, equals(clericHp));
      expect(cleric.mp, equals(Cleric.maxMp)); // mp값을 인자로 넣지 않는 경우 maxMp값이 반영되는지 확인
    });

    test('Cleric 클래스 생성자의 name만 받아서 생성하는 경우', () {
      final String clericName = '아서스';
      final cleric = Cleric(clericName);

      expect(cleric.name, equals(clericName));
      expect(cleric.hp, equals(Cleric.maxHp)); // hp값을 인자로 넣지 않는 경우 maxHp값이 반영되는지 확인
      expect(cleric.mp, equals(Cleric.maxMp)); // mp값을 인자로 넣지 않는 경우 maxMp값이 반영되는지 확인
    });
  });
}
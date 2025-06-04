

import 'package:modu_3_dart_study/assignments/2025-06-04/Cleric.dart';
import 'package:test/test.dart';

void main() {
  test('Cleric Test', () {
    Cleric cleric = Cleric('성직자');
    expect(cleric.name, '성직자');
    expect(cleric.hp == 50, true);
    expect(cleric.max_hp, equals(50));
    expect(cleric.mp, 10);
    expect(cleric.max_mp, 10);

    cleric.hp = 30;

    cleric.selfAid();
    //mp 5 소비
    expect(cleric.mp == 5, true);

    cleric.hp = 0;
    cleric.selfAid();
    //mp 5소비
    expect(cleric.mp, equals(0));

    cleric.pray(3);
    // 3초간 mp 회복
    //mp 0에서 3초 회복해서, 5이하의 mp가 충전됨.
    expect(cleric.mp <= 5, true);

    //1초간 mp 회복
    cleric.pray(1);
    // 최대 mp 5에서 1초 회복해서, 최대치가 8
    expect(cleric.mp <= 8, true);
  });

  group('Cleric Test', () {

    test('생성자 테스트(초기상태 확인)', () {
      Cleric cleric = Cleric('성직자');
      expect(cleric.name, '성직자');
      expect(cleric.hp, 50);
      expect(cleric.max_hp, 50);
      expect(cleric.mp, 10);
      expect(cleric.max_mp, 10);
    });
    
    test('selfAid 테스트',(){
      Cleric cleric = Cleric('성직자');
      cleric.hp = 30;
      cleric.selfAid();
      expect(cleric.mp, 5);
      expect(cleric.mp, equals(5));

      cleric.hp =0;
      cleric.selfAid();
      expect(cleric.mp, 0);
      expect(cleric.mp == 0, true);
    });

    test('pray 테스트', (){
      Cleric cleric = Cleric('성직자');
      cleric.mp = 0;
      cleric.pray(3);
      expect(cleric.mp <= 5, true);

      cleric.pray(1);
      expect(cleric.mp <= 8, true);
    });
    
  });
}

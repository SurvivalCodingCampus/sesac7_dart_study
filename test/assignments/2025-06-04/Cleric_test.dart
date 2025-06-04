import 'dart:math';

import 'package:modu_3_dart_study/assignments/2025-06-04/Cleric.dart';
import 'package:test/test.dart';

void main(){

  test('Cleric Test', (){
    Cleric cleric = Cleric('성직자');
    expect(cleric.name, '성직자');
    expect(cleric.hp == 50, true);
    expect(cleric.max_hp, equals(50));
    expect(cleric.mp , 10);
    expect(cleric.max_mp , isNot(49));

    cleric.hp = 30;
    
    cleric.selfAid();
    //mp 5 소비
    expect(cleric.mp ==5, true);

    cleric.hp = 0;
    cleric.selfAid();
    //mp 5소비
    expect(cleric.mp ,equals(0));

    cleric.pray(3);
    // 3초간 mp 회복
    //mp 0에서 3초 회복해서, 5이하의 mp가 충전됨.
    expect(cleric.mp <=5, true);

    //1초간 mp 회복
    cleric.pray(1);
    // 최대 mp 5에서 1초 회복해서, 최대치가 8
    expect(cleric.mp <=8, true);

  });



}
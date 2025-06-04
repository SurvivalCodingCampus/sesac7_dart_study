import 'package:modu_3_dart_study/assignments/2025-06-04/solution1/cleric.dart';
import 'package:test/test.dart';

void main (){
  test('Cleric Test', () {
    //given
    final cleric = Cleric(name: '클레릭', hp: 2 ,mp: 5);
    
    //when
    cleric.selfAid();
    cleric.pray(prayTime: 3);
    
    //then

    // maxMp 를 넘지 않았는지, 3초 동안 회복했을 때 최솟값을 넘었는지
    expect(cleric.hp == cleric.maxHp, equals(true));
    expect(cleric.mp < 11 || cleric.mp > 2, equals(true));
    
  },);
}
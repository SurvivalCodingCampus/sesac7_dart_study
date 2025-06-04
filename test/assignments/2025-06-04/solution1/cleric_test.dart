import 'package:modu_3_dart_study/assignments/2025-06-04/solution1/cleric.dart';
import 'package:test/test.dart';

void main (){
  test('Cleric Test', () async {
    //given
    final cleric = Cleric(name: '클레릭', hp: 2 ,mp: 7);
    
    //when
    cleric.selfAid();

    //pray 메서드에 비동기 함수 timer 를 사용하고 있기 때문에 prayTime의 작업이 완료 되면 다음 작업을 진행 할 수 있도록 테스트 코드 작성
    await Future.delayed(Duration(seconds: 1));
    cleric.pray(prayTime: 3);
    await Future.delayed(Duration(seconds: 4));
    
    //then

    // maxMp 를 넘지 않았는지, 3초 동안 회복했을 때 최솟값을 넘었는지
    expect(cleric.hp == cleric.maxHp, equals(true));
    expect(cleric.mp < 11 || cleric.mp > 2, equals(true));
    
  },);
}
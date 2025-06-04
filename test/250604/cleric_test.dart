import 'package:modu_3_dart_study/250604/cleric.dart';
import 'package:test/test.dart';

void main(){
  test('Cleric Test',(){
    //given(준비)
    final cleric = Cleric('용사',1,2); // 인스턴스 생성

    //when(실행)

    //then(검증)
    // 생성자, 초기화 확인
    expect(cleric.name, '용사');
    expect(cleric.hp, 50);
    expect(cleric.mp, 10);
  });
}
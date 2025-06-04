import 'package:modu_3_dart_study/assignments/2025-06-04/Cleric.dart';
import 'package:test/test.dart';

void main(){

  test('Cleric Test', (){
    Cleric cleric = Cleric('성직자');
    expect(cleric.name, '성직자');

    cleric.selfAid();
    //mp 5 소비
    expect(cleric.mp ==5, true);

    cleric.pray(3);
    // 3초간 Mp 회복

    expect(cleric.mp <=10, true);
  });
}
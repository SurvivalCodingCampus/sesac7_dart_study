import 'package:test/test.dart';
import 'package:modu_3_dart_study/2025-06-11/wizard.dart';

void main(){
  test('wizard 이름이 세글자 이하일때',(){
    expect(() => Wizard(name: '안녕', wand: Wand(name: '지팡이1', power: 0)) , throwsException);
  });

  test('wand 이름이 세글자 이하일때',(){
    expect(() => Wizard(name: '홍길동', wand: Wand(name: '지팡', power: 0)) , throwsException);
  });

  // test('wizard mp는 0 이상',(){
  //   expect(() => Wizard(name: '마법사', hp: 0, mp: 0, wand: Wand(name: '지팡이1', power: 0)) , throwsException);
  // }, skip: true);

  // test('wizard hp가 음수이면 hp를 0으로',(){
  //   final wizard01 = Wizard(name: '마법사', hp: -2, wand: Wand(name: '지팡이1', power: 0));
  //   expect(wizard01.hp, 0);
  // });

  // test('마법사의 mp는 0 이상',(){
  //   expect(() => Wizard(name: '마법사', mp: -1, wand: Wand(name: '지팡이1', power: 0)) , throwsException);
  // });
}

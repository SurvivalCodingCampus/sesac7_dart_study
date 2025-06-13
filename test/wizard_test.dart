import 'package:modu_3_dart_study/hero.dart';
import 'package:test/test.dart';
import 'package:modu_3_dart_study/wizard.dart';

void main() {
  test('마법사 생성자 mp 확인', (){
    final wizard01 = Wizard(name: '마법사01');
    expect(wizard01.mp, 100);
  });
  
  test('마법사의 heal 메서드 확인: 마법사의 mp가 0인 경우', (){
    final wizard02 = Wizard(name: '마법사02', mp: 0);
    final healedHero01 = Hero(name: '치료된 영웅01', hp: 10);
    expect(() => wizard02.heal(healedHero01), throwsException);
  });

  test('마법사의 heal 메서드 확인: 메서드가 실행 ', (){
    final wizard03 = Wizard(name: '마법사02');
    final healedHero02 = Hero(name: '치료된 영웅02', hp: 10);
  
    wizard03.heal(healedHero02);

    expect(wizard03.mp, 90);
    expect(healedHero02.hp, 30);
  });
}
import 'package:modu_3_dart_study/assignments/2025-06-12/wizard.dart';
import 'package:modu_3_dart_study/hero.dart';
import 'package:test/test.dart';

void main() {
  group('wizard 테스트', () {
    final int fixHp = 40; //초기 hp - 40고정
    final int initialMp = 100; //mp - 100고정.
    final int healHpAmount = 20;
    final int healMpConsumption = 10;

    test('생성자 테스트', () {
      Wizard wizard = Wizard(name: '손주영', hp: fixHp);
      expect(wizard.name == '손주영', true);
      expect(wizard.hp, fixHp);
    });
    test('mp 100 초기화 정상 테스트', () {
      Wizard wizard = Wizard(name: '손주영', hp: fixHp);
      expect(wizard.mp == initialMp, true);
    });
    test('heal 메소드 정상 테스트', () {
      Wizard wizard = Wizard(name: '손주영', hp: fixHp);
      Hero hero = Hero(name: '오스틴', hp: fixHp);

      ///hero의 hp를 20 회복시키고 , 자신의 mp를 10 소모함. -> hero의 hp는 60이 될것이고, wizard의 mp는 90이 될거임.
      wizard.heal(hero);
      expect(hero.hp, fixHp + healHpAmount);
      expect(wizard.mp, initialMp - healMpConsumption);
    });

    test('heal 메소드 예외 처리 테스트 - 마나가 10보다 적을때', () {
      Wizard wizard = Wizard(name: '손주영', hp: fixHp);
      Hero hero = Hero(name: '오스틴', hp: fixHp);

      ///mp 5로 수정하고 힐 했을때, 예외처리 테스트.
      wizard.mp = 5;
      expect(() => wizard.heal(hero), throwsException);
    });
  });
}

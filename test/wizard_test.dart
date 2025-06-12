import 'package:modu_3_dart_study/wand.dart';
import 'package:modu_3_dart_study/wizard.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('WizardTest', () {
    group('Wizard 클래스 생성자 테스트', () {
      test('Wizard 클래스 필수 생성자 테스트', () {
        final String testWizardName = 'Wizard';
        final int testWizardHp = 50;
        final Wizard wizard = Wizard(name: testWizardName, hp: testWizardHp);

        expect(wizard.wizardName, equals(testWizardName));
        expect(wizard.wizardHp, equals(testWizardHp));
        expect(wizard.wizardMp, equals(Wizard.wizardDefaultMp));
        expect(wizard.wand, isNull);
      });
      test('Wizard 클래스 필수, 옵셔널 생성자 테스트', () {
        final String testWizardName = 'Wizard';
        final int testWizardHp = 50;
        final String testWizardWandName = 'Wand';
        final double testWizardWandPower = 50.0;
        final Wand testWizardWand = Wand(name: testWizardWandName, power: testWizardWandPower);
        final Wizard wizard = Wizard(name: testWizardName, hp: testWizardHp, wand: testWizardWand);

        expect(wizard.wand, isNotNull);
        expect(wizard.wand?.wandName, equals(testWizardWandName));
        expect(wizard.wand?.wandPower, equals(testWizardWandPower));
      });
    });
    test('Wizard 클래스 이름 최소 범위 미만 테스트', () {
      final String testWizardName = 'Wizard';
      final int testWizardHp = 50;
      final StringBuffer buffer = StringBuffer();
      String rangeOutWizardName;

      final Wizard wizard = Wizard(name: testWizardName, hp: testWizardHp);

      for (int i = 1; i < wizard.wizardNameLimit; i++) {
        buffer.write('a');
      }

      rangeOutWizardName = buffer.toString();

      expect(() => wizard.wizardName = rangeOutWizardName, throwsException);
    });
    test('Wizard 클래스 이름 최소 범위 이상 테스트', () {
      final String testWizardName = 'Wizard';
      final int testWizardHp = 50;
      final StringBuffer buffer = StringBuffer();

      String minimumRangeWizardName;

      final Wizard wizard = Wizard(name: testWizardName, hp: testWizardHp);

      for (int i = 1; i <= wizard.wizardNameLimit; i++) {
        buffer.write('a');
      }

      minimumRangeWizardName = buffer.toString();

      expect(() => wizard.wizardName = minimumRangeWizardName, returnsNormally);
    });
    test('Wizard 클래스 인스턴스 생성 후 wand 프로퍼티 null 삽입 불가능 테스트', () {
      final String testWizardName = 'Wizard';
      final int testWizardHp = 50;
      final String testWizardWandName = 'Wand';
      final double testWizardWandPower = 50.0;
      final Wand testWizardWand = Wand(name: testWizardWandName, power: testWizardWandPower);
      final Wizard wizard = Wizard(name: testWizardName, hp: testWizardHp, wand: testWizardWand);

      expect(() => wizard.wand = null, throwsException);
    });
    test('Wizard 클래스 wand 인자 null로 인스턴스 생성 후 wand 프로퍼티 삽입 적용 테스트', () {
      final String testWizardName = 'Wizard';
      final int testWizardHp = 50;
      final Wizard wizard = Wizard(name: testWizardName, hp: testWizardHp);

      final String testWizardWandName = 'Wand';
      final double testWizardWandPower = 50.0;
      final Wand testWizardWand = Wand(name: testWizardWandName, power: testWizardWandPower);
      wizard.wand = testWizardWand;

      expect(wizard.wand, isNotNull);
    });
    test('Wizard 클래스 mp Setter 0 미만인 경우 throw 테스트', () {
      final String testWizardName = 'Wizard';
      final int testWizardHp = 50;
      final Wizard wizard = Wizard(name: testWizardName, hp: testWizardHp);

      expect(() => wizard.wizardMp = -1, throwsException);
    });
    test('Wizard 클래스 hp Setter 음수인 경우 0 적용 테스트', () {
      final String testWizardName = 'Wizard';
      final int testWizardHp = 50;
      final Wizard wizard = Wizard(name: testWizardName, hp: testWizardHp);

      wizard.wizardHp = -1;

      expect(wizard.wizardHp, equals(0));
    });
  });
}
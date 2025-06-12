import 'package:modu_3_dart_study/wizard.dart';
import 'package:test/test.dart';

void main() {
  test('Given Wizard 클래스 when 인스턴스 생성 이후에 지팡이를 null 설정하는 경우 then 예외 발생', () {
    // given(준비)
    Wizard westWizard = Wizard(name: 'westWizard', mp: 10, hp: 10);
    // when (실행)
    // westWizard.setWand = null;
    // then (검증)
    expect(() => westWizard.setWand = null, throwsException);
  });

  test('Given Wizard 클래스 when 인스턴스 생성 이후에 MP를 0 미만으로 설정하는 경우 then 예외 발생', () {
    // given(준비)
    Wizard westWizard = Wizard(name: 'westWizard', mp: 10, hp: 10);
    // when (실행)
    // westWizard.setMp = -10;
    // then (검증)
    expect(() => westWizard.setMp = -10, throwsException);
  });

  test('Given Wizard 클래스 when 인스턴스 생성 이후에 MP를 0으로 설정하는 경우 then MP는 0', () {
    // given(준비)
    Wizard westWizard = Wizard(name: 'westWizard', mp: 10, hp: 10);
    // when (실행)
    westWizard.setMp = 0;
    // then (검증)
    expect(westWizard.mp, 0);
  });

  test('Given Wizard 클래스 when 인스턴스 생성 이후에 HP를 0 미만이 되는 경우에도 then HP는 0', () {
    // given(준비)
    Wizard westWizard = Wizard(name: 'westWizard', mp: 10, hp: 10);
    // when (실행)
    westWizard.setHp = -10;
    // then (검증)
    expect(westWizard.hp, 0);
  });
}

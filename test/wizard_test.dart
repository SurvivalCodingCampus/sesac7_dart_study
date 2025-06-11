import 'package:modu_3_dart_study/wand.dart';
import 'package:modu_3_dart_study/wizard.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  test('Wizard 클래스 타당성 검사 테스트', () {
    final String initialName = '';
    final int initialHp = 0;
    final int initialMp = 0;
    final String threeLettersName = 'abc';
    final String lessThreeLettersName = 'ab';
    final String? nullName = null;
    final Wand? nullWand = null;
    final Wand wand = Wand(name: '지팡이', power: 1.0);
    final int minMp = 0;
    final int lessMinMp = -1;
    final int minHp = 0;
    final int negativeHp = -1;
    final int nonNegativeHp = 100;

    final wizard = Wizard(name: initialName, hp: initialHp, mp: initialMp);
    final wizardForTestHp = Wizard(
      name: initialName,
      hp: initialHp,
      mp: initialMp,
    );

    // Wizard 이름이 3글자 이상인 경우와 그렇지 않은 경우
    expect(() => wizard.name = threeLettersName, returnsNormally);
    expect(() => wizard.name = lessThreeLettersName, throwsException);

    // Wizard 이름이 null인 경우
    expect(() => wizard.name = nullName, throwsException);

    // Wizard가 생성된 이후에 Wand에 null이 들어오는 경우와 아닌 경우
    expect(() => wizard.wand = nullWand, throwsException);
    expect(() => wizard.wand = wand, returnsNormally);

    // Wizard mp가 0 이상인 경우와 그렇지 않은 경우
    expect(() => wizard.mp = minMp, returnsNormally);
    expect(() => wizard.mp = lessMinMp, throwsException);

    // Wizard hp가 음수인 경우와 그렇지 않은 경우
    wizardForTestHp.hp = negativeHp;

    expect(() => wizard.hp = nonNegativeHp, returnsNormally);
    expect(wizardForTestHp.hp == minHp, equals(true));
  });
}

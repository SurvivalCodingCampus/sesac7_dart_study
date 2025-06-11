import 'package:modu_3_dart_study/wand.dart';
import 'package:modu_3_dart_study/wizard.dart';
import 'package:test/test.dart';

void main() {
  group('wizard test', () {
    test('생성자 테스트', () {
      // given
      final int testHp = 50;
      final int testMp = 10;
      final double testPower = 5.0;
      final Wand testWand = Wand('견습 지팡이', testPower);
      final Wizard wizard = Wizard('이학민', testHp, testMp, testWand);

      // when & then
      expect(wizard.name, equals('이학민'));
      expect(wizard.hp, equals(testHp));
      expect(wizard.mp, equals(testMp));
      expect(wizard.wand, equals(testWand));
    });

    test('마법사의 이름이 너무 짧게(3문자 미만) 설정되었을 경우', () {
      // given
      final String testName1 = '홍';
      final String testName2 = '길동';
      final int testHp = 50;
      final int testMp = 10;
      final double testPower = 5.0;
      final Wand testWand = Wand('견습 지팡이', testPower);
      final Wizard wizard1 = Wizard('이학민', testHp, testMp, testWand);
      final Wizard wizard2 = Wizard('카리나', testHp, testMp, testWand);

      // when & then
      expect(() => {wizard1.name = testName1}, throwsException);
      expect(() => {wizard2.name = testName2}, throwsException);
    });

    test('마법사가 생성된 후 지팡이 정보를 null로 설정했을 때', () {
      // given
      final int testHp = 50;
      final int testMp = 10;
      final double testPower = 5.0;
      final Wand testWand = Wand('견습 지팡이', testPower);
      final Wizard wizard = Wizard('이학민', testHp, testMp, testWand);

      // when & then
      expect(() => {wizard.wand = null}, throwsException);
    });

    test('마법사의 MP가 음수로 설정되었을 경우', () {
      // given
      final int testHp = 50;
      final int testMp = 10;
      final int testWrongMp = -10;
      final double testPower = 5.0;
      final Wand testWand = Wand('견습 지팡이', testPower);
      final Wizard wizard = Wizard('이학민', testHp, testMp, testWand);

      // when & then
      expect(() => {wizard.mp = testWrongMp}, throwsException);
    });

    test('마법사의 HP가 음수로 설정될 경우', () {
      // given
      final int testHp = 50;
      final int testWrongHp1 = -50;
      final int testWrongHp2 = -100;
      final int testMp = 10;
      final double testPower = 5.0;
      final Wand testWand = Wand('견습 지팡이', testPower);
      final Wizard wizard1 = Wizard('이학민', testHp, testMp, testWand);
      final Wizard wizard2 = Wizard('카리나', testHp, testMp, testWand);

      // when
      wizard1.hp = testWrongHp1;
      wizard2.hp = testWrongHp2;

      // then
      expect(wizard1.hp, equals(0));
      expect(wizard2.hp, equals(0));
    });
  });
}

import 'package:modu_3_dart_study/250611/wand.dart';
import 'package:modu_3_dart_study/250611/wizard.dart';
import 'package:test/test.dart';

void main() {
  group('Wizard,Wind 테스트', () {
    test('Wand생성 테스트', () {
      //given

      //when

      //then
      expect(() => Wand(name: 'a', power: 1), throwsException); //지팡이 이름이 3문자미만
      expect(() => Wand(name: 'aaa', power: 1), returnsNormally); //지팡이 이름이 3문자
      expect(
        () => Wand(name: 'aaaa', power: 1),
        returnsNormally,
      ); //지팡이 이름이 3문자이상

      expect(() => Wand(name: 'aaaa', power: 0.4), throwsException); //0.5미만
      expect(() => Wand(name: 'aaaa', power: 0.5), returnsNormally); //0.5
      expect(
        () => Wand(name: 'aaaa', power: 100),
        returnsNormally,
      ); //0.5이상 100이하
      expect(() => Wand(name: 'aaaa', power: 100.1), throwsException); //100초과
    });

    test('Wizard생성 테스트', () {
      //given

      //when

      //then
      Wand wand = Wand(name: 'aaaaa', power: 50);
      expect(() => Wizard('a', 1, 1, wand), throwsException); //이름이 3글자미만
      expect(() => Wizard('aaa', 1, 1, wand), returnsNormally); //이름이 3글자
      expect(() => Wizard('aaaa', 1, 1, wand), returnsNormally); //이름이 3글자이상

      expect(() => Wizard('aaaa', 1, -1, wand), throwsException); //MP가 -1
      expect(() => Wizard('aaaa', 1, 0, wand), returnsNormally); //MP가 0
      expect(() => Wizard('aaaa', 1, 1, wand), returnsNormally); //MP가 1

      Wizard wizard0 = Wizard('wizard0', -1, 1, wand);
      expect(wizard0.hp, equals(0)); //HP가 -1이면 0이된다.

      expect(() => Wizard('aaaa', 1, 1, null), throwsException); //지팡이가 null
    });
  });
}

import 'package:modu_3_dart_study/10_string_control/word.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('Word 클래스 테스트', () {
    final testWord = 'aEiOuBcDf';
    final testInstance = Word(word: testWord);
    final List<int> vowelIndex = [1, 2, 3, 4, 5];
    final List<int> consonantIndex = [6, 7, 8, 9];

    test('Word 클래스 isVowel() 테스트', () {
      for (int i in vowelIndex) {
        expect(testInstance.isVowel(i), equals(true));
      }

      for (int i in consonantIndex) {
        expect(testInstance.isVowel(i), equals(false));
      }
    });

    test('Word 클래스 isConsonant() 테스트', () {
      for (int i in vowelIndex) {
        expect(testInstance.isConsonant(i), equals(false));
      }

      for (int i in consonantIndex) {
        expect(testInstance.isConsonant(i), equals(true));
      }
    });

    test('Word 클래스 경계 조건 테스트', () {
      // 인덱스 0 테스트 (현재 구현에서는 false 반환)
      expect(testInstance.isVowel(0), equals(false));
      expect(testInstance.isConsonant(0), equals(true));

      // 음수 인덱스 테스트
      expect(testInstance.isVowel(-1), equals(false));
      expect(testInstance.isConsonant(-1), equals(true));

      // 문자열 길이를 초과하는 인덱스 테스트
      expect(testInstance.isVowel(testWord.length + 1), equals(false));
      expect(testInstance.isConsonant(testWord.length + 1), equals(true));
    });

    test('빈 문자열 테스트', () {
      final emptyWord = Word(word: '');
      expect(emptyWord.isVowel(1), equals(false));
      expect(emptyWord.isConsonant(1), equals(false));
    });
  });
}

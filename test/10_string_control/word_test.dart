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
  });
}

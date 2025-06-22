import 'package:modu_3_dart_study/assignments/2025-06-20/word.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('Word 테스트', () {
    test('Word 생성 테스트', () {
      Word word = Word(word: 'djwiqj');
      expect(word.word, 'djwiqj');
    });

    test('Word의 모음 테스트', () {
      Word word = Word(word: 'test');
      expect(word.word, 'test');
      expect(word.isVowel(1), true);
      expect(word.isVowel(0), false);
    });
    test('Word의 자음 테스트', () {
      Word word = Word(word: 'test');
      expect(word.word, 'test');
      expect(word.isConsonant(1), false);
      expect(word.isConsonant(0), true);
    });
    test('인덱스 예외 상황 테스트', () {
      Word word = Word(word: 'test');
      expect(() => word.isConsonant(-1), throwsException);
      expect(() => word.isVowel(-1), throwsException);

      expect(() => word.isConsonant(word.word.length), throwsException);
      expect(() => word.isVowel(word.word.length), throwsException);
      expect(() => word.isConsonant(word.word.length + 1), throwsException);
      expect(() => word.isVowel(word.word.length + 1), throwsException);
    });
  });
}

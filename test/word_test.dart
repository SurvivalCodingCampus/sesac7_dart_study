import 'package:modu_3_dart_study/string_control/word.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('WordClassTest', () {
    test('WordClass 생성자 테스트', () {
      final String testWord = 'testWord';
      final Word testWordClass = Word(word: testWord);

      expect(testWordClass.word, equals(testWord));
    });

    group('WordClass isVowel 메서드 모음 테스트', () {
      test('isVowel 메서드 모음 인덱스 테스트', () {
        final String testWord = 'testWord';
        final Word testWordClass = Word(word: testWord);

        expect(testWordClass.isVowel(5), isTrue);
      });
      test('isVowel 메서드 자음 인덱스 테스트', () {
        final String testWord = 'testWord';
        final Word testWordClass = Word(word: testWord);

        expect(testWordClass.isVowel(0), isFalse);
      });
      test('isVowel 메서드 인덱스 초과 throw 테스트', () {
        final String testWord = 'testWord';
        final Word testWordClass = Word(word: testWord);

        expect(() => testWordClass.isVowel(-1), throwsException);
        expect(() => testWordClass.isVowel(testWord.length), throwsException);
      });
    });

    group('WordClass isConsonant 메서드 자음 테스트', () {
      test('isConsonant 메서드 모음 인덱스 테스트', () {
        final String testWord = 'testWord';
        final Word testWordClass = Word(word: testWord);

        expect(testWordClass.isConsonant(5), isFalse);
      });
      test('isConsonant 메서드 자음 인덱스 테스트', () {
        final String testWord = 'testWord';
        final Word testWordClass = Word(word: testWord);

        expect(testWordClass.isConsonant(0), isTrue);
      });
      test('isConsonant 메서드 인덱스 초과 throw 테스트', () {
        final String testWord = 'testWord';
        final Word testWordClass = Word(word: testWord);

        expect(() => testWordClass.isConsonant(-1), throwsException);
        expect(() => testWordClass.isConsonant(testWord.length), throwsException);
      });
    });
  });
}
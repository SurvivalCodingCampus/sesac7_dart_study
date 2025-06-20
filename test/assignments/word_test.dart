import 'package:modu_3_dart_study/assignments/word.dart';
import 'package:test/test.dart';

void main() {
  const String sampleWord = 'sample!';
  const String upperCaseWord = 'SAMPLE!';
  const int vowelIndex = 1;
  const int consonantIndex = 0;
  const int specialCharacterIndex = 6;
  const int outOfIndex = sampleWord.length;
  const int minusIndex = -1;

  late Word word;

  setUp(() {
    word = Word(sampleWord);
  });

  group('isVowel', () {
    test('The vowelIndex of sampleWord has isVowel true.', () {
      // given

      // when
      // then
      expect(word.isVowel(vowelIndex), isTrue);
    });

    test('The consonantIndex of sampleWord has isVowel false.', () {
      // given

      // when
      // then
      expect(word.isVowel(consonantIndex), isFalse);
    });

    test('The minusIndex of sampleWord has isVowel throws exception.', () {
      // given

      // when
      // then
      expect(() => word.isVowel(minusIndex), throwsException);
    });

    test('The outOfIndex of sampleWord has isVowel throws exception.', () {
      // given

      // when
      // then
      expect(() => word.isVowel(outOfIndex), throwsException);
    });

    test('It works fine even if word is capitalized.', () {
      // given
      final word = Word(upperCaseWord);

      // when
      // then
      expect(word.isVowel(vowelIndex), isTrue);
    });

    test('The specialCharacterIndex of sampleWord has isVowel false.', () {
      // given

      // when
      // then
      expect(word.isVowel(specialCharacterIndex), isFalse);
    });
  });

  group('isConsonant', () {
    test('The vowelIndex of sampleWord has isConsonant false.', () {
      // given

      // when
      // then
      expect(word.isConsonant(vowelIndex), isFalse);
    });

    test('The consonantIndex of sampleWord has isConsonant true.', () {
      // given

      // when
      // then
      expect(word.isConsonant(consonantIndex), isTrue);
    });

    test('The minusIndex of sampleWord has isConsonant throws exception.', () {
      // given
      // when
      // then
      expect(() => word.isConsonant(minusIndex), throwsException);
    });

    test('The outOfIndex of sampleWord has isConsonant throws exception.', () {
      // given

      // when
      // then
      expect(() => word.isConsonant(outOfIndex), throwsException);
    });

    test('It works fine even if word is capitalized.', () {
      // given
      final word = Word(upperCaseWord);

      // when
      // then
      expect(word.isConsonant(vowelIndex), isFalse);
    });

    test('The specialCharacterIndex of sampleWord has isConsonant false.', () {
      // given

      // when
      // then
      expect(word.isConsonant(specialCharacterIndex), isFalse);
    });
  });
}

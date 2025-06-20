import 'package:modu_3_dart_study/assignments/word.dart';
import 'package:test/test.dart';

void main() {
  group('모음 테스트', () {
    final word = Word(word: 'Programming');

    test('소문자 테스트', () {
      expect(word.isVowel(5), isTrue);
      expect(word.isVowel(8), isTrue);
    });

    test('대문자 테스트', () {
      final apple = Word(word: 'Apple');
      expect(apple.isVowel(0), isTrue);
    });

    test('자음 false', () {
      expect(word.isVowel(0), isFalse);
      expect(word.isVowel(1), isFalse);
    });

    test('단어 길이 벗어나면 false', () {
      expect(word.isVowel(-1), isFalse);
      expect(word.isVowel(100), isFalse);
    });
  });

  group('자음 테스트', () {
    final word = Word(word: 'Dart!@#12314');

    test('자음 테스트', () {
      expect(word.isConsonant(0), isTrue);
      expect(word.isConsonant(2), isTrue);
      expect(word.isConsonant(3), isTrue);
    });

    test('모음 테스트', () {
      expect(word.isConsonant(1), isFalse);
    });

    test('특수문자, 숫자 false 테스트', () {
      expect(word.isConsonant(9), isFalse);
      expect(word.isConsonant(4), isFalse);
    });

    test('단어 길이 벗어나면 false', () {
      expect(word.isConsonant(-1), isFalse);
      expect(word.isConsonant(50), isFalse);
    });
  });
}

import 'package:modu_3_dart_study/250620/word.dart';
import 'package:test/test.dart';
import 'dart:math';

void main() {
  final List<String> englishWords = [
    'apple',
    'banana',
    'orange',
    'grape',
    'strawberry',
    'hello',
    'world',
    'dart',
    'flutter',
    'programming',
    '',
    'computer',
    'developer',
    'software',
  ];

  test('isVowel, isConsonant 테스트', () {
    for (int i = 0; i < englishWords.length; i++) {
      Word word = Word(word: englishWords[i]);

      // List list = ['a', 'e', 'i', 'o', 'u'];
      // Word.vowels = list;
      // Word.vowels = ['a', 'e', 'i', 'o', 'u'];

      Word.vowels.add('p');

      final alphabets = word.word.split('');
      print(alphabets);

      for (int i = 0; i < alphabets.length; i++) {
        String alphabet = alphabets[i];
        print(alphabet);
        expect(word.isVowel(i), isVowel(alphabet));
        expect(word.isConsonant(i), isConsonant(alphabet));
      }
    }
  });

  test('isVowel, isConsonant exception 테스트', () {
    Word word = Word(word: englishWords[1]);
    expect(
      () => word.isConsonant(word.word.length + 1),
      throwsA(isA<Exception>()),
    );
    expect(() => word.isConsonant(-1), throwsA(isA<Exception>()));
  });
}

bool isVowel(String alphabet) {
  final vowels = ['a', 'e', 'i', 'o', 'u'];
  return vowels.contains(alphabet);
}

bool isConsonant(String alphabet) {
  return !isVowel(alphabet);
}

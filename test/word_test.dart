import 'package:test/test.dart';
import 'package:modu_3_dart_study/word.dart';

void main() {

group('Word 클래스 테스트', () {
  final word01 = Word('language');

  test('테스트 단어의 1번째 글자는 자음이다',(){   
    expect(word01.isVowel(0), false);
  });

  test('테스트 단어의 2번째 글자는 모음이다',(){   
    expect(word01.isVowel(1), true);
  });

  test('테스트 단어의 2번째 글자는 모음이면 자음일수없다',(){   
    expect(word01.isConsonant(1), false);
  });
  
  test('범위를 벗어난 인덱스에 대한 예외 처리', () {
    expect(() => word01.isVowel(-1), throwsA(isA<RangeError>()));
    expect(() => word01.isVowel(100), throwsA(isA<RangeError>()));
  });

  test('다양한 모음과 자음 테스트', () {
      final testWord = Word('aeiou');
      for (int i = 0; i < testWord.word.length; i++) {
        expect(testWord.isVowel(i), true);
        expect(testWord.isConsonant(i), false);
      }
    });
  });

  

}
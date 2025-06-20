import 'package:test/test.dart';
import 'package:modu_3_dart_study/word.dart';

void main() {

  final word01 = Word('language');

  test('테스트 단어의 1번째 글자는 모음이다',(){   
    expect(word01.isVowel(0), false);
  });

  test('테스트 단어의 2번째 글자는 모음이다',(){   
    expect(word01.isVowel(1), true);
  });

  test('테스트 단어의 2번째 글자는 모음이면 자음일수없다',(){   
    expect(word01.isConsonant(1), false);
  });

}
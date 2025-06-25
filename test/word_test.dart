import 'package:modu_3_dart_study/word.dart';
import 'package:test/test.dart';

void main() {
  group('Word 생성자 테스트', () {
    test('문자열을 인자로 받아 인스턴스 생성', () {
      // given
      final String testString = 'Hello World!';
      final Word testWord = Word(word: testString);

      // when & then
      expect(testWord.word, equals(testString));
    });
  });

  group('isVowel() 메소드 테스트', () {
    test('공백이면 모음에 해당하지 않으므로 false를 리턴', () {
      // given
      final String testString = 'Hello World!';
      final int testInt = 6;
      final Word testWord = Word(word: testString);

      // when & then
      expect(testWord.isVowel(testInt), isFalse);
    });

    test(
      'gatherAlphabet(모음 리스트)에 저장된 값들과 비교하여 같은 값이 존재한다면 모음인 것이므로 true를 리턴',
      () {
        // given
        final String testString = 'Hello World!';
        final int testInt = 5;
        final Word testWord = Word(word: testString);

        // when & then
        expect(testWord.isVowel(testInt), isTrue);
      },
    );

    test('gatherAlphabet(모음 리스트)에 같은 값이 없다면 모음이 아니므로 false를 리턴', () {
      // given
      final String testString = 'Hello World!';
      final int testInt = 4;
      final Word testWord = Word(word: testString);

      // when & then
      expect(testWord.isVowel(testInt), isFalse);
    });
  });

  group('isConsonant() 메소드 테스트', () {
    test('공백이면 자음에 해당하지 않으므로 false를 리턴', () {
      // given
      final String testString = 'Hello World!';
      final int testInt = 6;
      final Word testWord = Word(word: testString);

      // when & then
      expect(testWord.isConsonant(testInt), isFalse);
    });

    test('isVowel 결과가 true로 해당 글자가 모음인 것이 확정 되면 자음이 아니므로 false를 리턴', () {
      // given
      final String testString = 'Hello World!';
      final int testInt = 5;
      final Word testWord = Word(word: testString);

      // when & then
      expect(testWord.isConsonant(testInt), isFalse);
    });

    test(
      '앞선 조건에 해당하지 않으면서 아스키코드 범위(대문자: 65-90, 소문자: 97-122)에 해당하지 않을 경우(=특수문자) false를 리턴',
      () {
        // given
        final String testString = 'Hello World!';
        final int testInt = 12;
        final Word testWord = Word(word: testString);

        // when & then
        expect(testWord.isConsonant(testInt), isFalse);
      },
    );

    test('앞선 모든 조건에 해당하지 않으면 자음이므로 true를 리턴', () {
      // given
      final String testString = 'Hello World!';
      final int testInt = 1;
      final Word testWord = Word(word: testString);

      // when & then
      expect(testWord.isConsonant(testInt), isTrue);
    });
  });
}

/*

### 테스트 케이스 정리
- 생성자 테스트: word를 인자로 받아 인스턴스 생성
- isVowel() 메소드 테스트
  => 공백이면 모음에 해당하지 않으므로 false를 리턴
  => gatherAlphabet(모음 리스트)에 저장된 모든 값들과 비교하여 같은 값이 존재한다면 모음인 것이므로 true를 리턴
  => gatherAlphabet(모음 리스트)에 같은 값이 없다면 모음이 아니므로 false를 리턴
- isConsonant() 메소드 테스트
  => 공백이면 자음에 해당하지 않으므로 false를 리턴
  => isVowel 결과가 true로 해당 글자가 모음인 것이 확정 되면 자음이 아니므로 false를 리턴
  => 앞선 조건에 해당하지 않으면서 아스키코드 범위(대문자: 65-90, 소문자: 97-122)에 해당하지 않을 경우(=특수문자)
  => 위 조건에 해당하지 않으면 자음이므로 true를 리턴

*/

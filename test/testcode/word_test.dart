import 'package:modu_3_dart_study/lecture_code/generic/word.dart';
import 'package:test/test.dart';

void main() {
  group('문자열조작 연습문제 1 ',() {
    Word w = Word();
    w.word = 'good';
    test('모음인 경우 Test', () {
      //given(준비)

      //when(실행)

      //then(검증)
      expect(w.isVowel(2), true);
    });

    test('모음이 아닌 경우 Test', () {
      //given(준비)

      //when(실행)

      //then(검증)
      expect(w.isVowel(1), false);
      expect(w.isVowel(5), false);
      expect(w.isConsonant(0), false);
      expect(w.isConsonant(-1), false);
    });
  });

  group('문자열조작 연습문제 2 ',() {
    Word w = Word();
    w.word = 'good';
    test('자음인 경우 Test', () {
      //given(준비)

      //when(실행)

      //then(검증)
      expect(w.isConsonant(1), true);
    });

    test('모음이 아닌 경우 Test', () {
      //given(준비)

      //when(실행)

      //then(검증)
      expect(w.isConsonant(2), false);
      expect(w.isConsonant(5), false);
      expect(w.isConsonant(0), false);
      expect(w.isConsonant(-1), false);

    });
  });
}

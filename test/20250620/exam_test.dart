import 'package:modu_3_dart_study/20250620/exam.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  late StrongBox<String> padlockSafe, buttonSafe, dialSafe, fingerSafe;
  late String value;
  group('20250620 테스트', ()
  {
    setUp((){
      value = 'empty';

      padlockSafe = StrongBox(keyType: KeyType.padlock);
      padlockSafe.put('보석이 나왔다');

      buttonSafe = StrongBox(keyType: KeyType.button);
      buttonSafe.put('보석이 나왔다');

      dialSafe = StrongBox(keyType: KeyType.dial);
      dialSafe.put('보석이 나왔다');

      fingerSafe = StrongBox(keyType: KeyType.finger);
      fingerSafe.put('보석이 나왔다');
    });
    test('padlock 금고 오픈 테스트', () {
      int maxTryCounts = padlockSafe.getMaxAttempts(KeyType.padlock);

      for (int i = 0; i < maxTryCounts; i++) {
        value = padlockSafe.get() ?? "empty";
      }
      expect(padlockSafe.tryCount, maxTryCounts);
      expect(value == '보석이 나왔다', isTrue);
    });
    test('button 금고 오픈 테스트', () {
      int maxTryCounts = buttonSafe.getMaxAttempts(KeyType.button);

      for (int i = 0; i < maxTryCounts; i++) {
        value = buttonSafe.get() ?? "empty";
      }
      expect(buttonSafe.tryCount, maxTryCounts);
      expect(value == '보석이 나왔다', isTrue);
    });
    test('dial 금고 오픈 테스트', () {
      int maxTryCounts = buttonSafe.getMaxAttempts(KeyType.dial);

      for (int i = 0; i < maxTryCounts; i++) {
        value = dialSafe.get() ?? "empty";
      }
      expect(dialSafe.tryCount, maxTryCounts);
      expect(value == '보석이 나왔다', isTrue);
    });
    test('finger 금고 오픈 테스트', () {
      int maxTryCounts = buttonSafe.getMaxAttempts(KeyType.finger);

      for (int i = 0; i < maxTryCounts; i++) {
        value = fingerSafe.get() ?? "empty";
      }
      expect(fingerSafe.tryCount, maxTryCounts);
      expect(value == '보석이 나왔다', isTrue);
    });
    test('Word 클래스 모음 테스트', () {
      final word = Word(word: 'apple');

      expect(word.isVowel(0), isTrue);
      expect(word.isVowel(3), isFalse);
    });

    test('Word 클래스 자음 테스트', () {
      final word = Word(word: 'android');

      expect(word.isConsonant(0), isFalse);
      expect(word.isConsonant(1), isTrue);
    });

    test('Word 클래스 범위 체크 테스트', () {
      final word = Word(word: 'android');

      expect(() => word.isVowel(200), throwsA(isA<ArgumentError>()));
      expect(() => word.isConsonant(150), throwsA(isA<ArgumentError>()));
    });

    test('빈 문자열/영문이 아닌 문자열 체크', () {
      expect(() => Word(word: ''), throwsA(isA<ArgumentError>()));
      expect(() => Word(word: '국어사전'), throwsA(isA<ArgumentError>()));
      expect(() => Word(word: '^^^^1234***'), throwsA(isA<ArgumentError>()));
    });

    test('대문자/소문자 혼합 시 테스트', () {
      final word = Word(word: 'AppleAndAndroid');

      expect(word.isVowel(0), isTrue);
      expect(word.isVowel(1), isFalse);
      expect(word.isConsonant(6), isTrue);
      expect(word.isConsonant(9), isTrue);
    });
  });
}
import 'package:modu_3_dart_study/20250620/exam.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

const int padlockMaxTryCounts = 1024;
const int buttonMaxTryCounts = 10000;
const int dialMaxTryCounts = 30000;
const int fingerMaxTryCounts = 1000000;

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

      for (int i = 0; i < padlockMaxTryCounts; i++) {
        value = padlockSafe.get() ?? "empty";
      }
      expect(padlockSafe.tryCount, padlockMaxTryCounts);
      expect(value == '보석이 나왔다', isTrue);
    });
    test('button 금고 오픈 테스트', () {
      for (int i = 0; i < buttonMaxTryCounts; i++) {
        value = buttonSafe.get() ?? "empty";
      }
      expect(buttonSafe.tryCount, buttonMaxTryCounts);
      expect(value == '보석이 나왔다', isTrue);
    });
    test('dial 금고 오픈 테스트', () {
      for (int i = 0; i < dialMaxTryCounts; i++) {
        value = dialSafe.get() ?? "empty";
      }
      expect(dialSafe.tryCount, dialMaxTryCounts);
      expect(value == '보석이 나왔다', isTrue);
    });
    test('finger 금고 오픈 테스트', () {
      for (int i = 0; i < fingerMaxTryCounts; i++) {
        value = fingerSafe.get() ?? "empty";
      }
      expect(fingerSafe.tryCount, fingerMaxTryCounts);
      expect(value == '보석이 나왔다', isTrue);
    });
    test('Word 클래스 모음 테스트', () {
      final word = Word();
      word.word = 'adslkfjalskdfj';
      expect(word.isVowel(0), isTrue);
      expect(word.isVowel(1), isFalse);
    });

    test('Word 클래스 자음 테스트', () {
      final word = Word();
      word.word = 'adslkfjalskdfj';
      expect(word.isConsonant(0), isFalse);
      expect(word.isConsonant(1), isTrue);
    });
  });
}
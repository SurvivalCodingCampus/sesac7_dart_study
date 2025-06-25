import 'package:modu_3_dart_study/assignments/strong_box.dart';
import 'package:test/test.dart';

void main() {
  const int totalPadlockCount = 1024;
  const int totalButtonCount = 10000;
  const int totalDialCount = 30000;
  const int totalFingerCount = 1000000;

  group('StrongBox 클래스 테스트', () {
    group('padlock 테스트', () {
      late StrongBox<String> padlockBox;

      setUp(() {
        padlockBox = StrongBox<String>(key: KeyType.padlock);
        padlockBox.put('다이아');
      });

      test('1024번까지는 null을 반환 하는 테스트', () {
        for (int i = 0; i < totalPadlockCount; i++) {
          expect(padlockBox.get(), isNull);
        }
      });

      test('1024번 횟수를 날리고 보물 획득 테스트', () {
        for (int i = 0; i < 1024; i++) {
          padlockBox.get();
        }
        expect(padlockBox.get(), '다이아');
      });

      test('1024번 이후로 아이템 가져오기', () {
        for (int i = 0; i < totalPadlockCount + 1; i++) {
          padlockBox.get();
        }

        expect(padlockBox.get(), '다이아');
        expect(padlockBox.get(), '다이아');
      });
    });

    group('button 테스트', () {
      test('10000번 횟수 날리고 아이템 얻기 테스트', () {
        final buttonBox = StrongBox<int>(key: KeyType.button);
        buttonBox.put(100);

        for (int i = 0; i < totalButtonCount; i++) {
          buttonBox.get();
        }

        expect(buttonBox.get(), 100);
      });
    });

    group('dial 테스트', () {
      test('30000번 횟수 날리고 아이템 얻기 테스트 ', () {
        final dialBox = StrongBox<String>(key: KeyType.dial);
        dialBox.put('다이아');

        for (int i = 0; i < totalDialCount; i++) {
          dialBox.get();
        }

        expect(dialBox.get(), '다이아');
      });
    });

    group('finger 테스트', () {
      test('1000000번 횟수 날리고 리스트 아이템 얻기 테스트', () {
        final fingerBox = StrongBox<List<String>>(key: KeyType.finger);
        final secretList = ['다이아', '골드', '에메랄드', '실버'];
        fingerBox.put(secretList);

        for (int i = 0; i < totalFingerCount; i++) {
          fingerBox.get();
        }

        expect(fingerBox.get(), secretList);
      });
    });
  });
}

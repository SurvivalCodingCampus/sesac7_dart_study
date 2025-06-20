import 'package:modu_3_dart_study/asset/strong_box.dart';
import 'package:modu_3_dart_study/enum/key_type.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('StrongBoxClassTest', () {
    test('StrongBox 클래스 생성자 테스트', () {
      for (KeyType keyType in KeyType.values) {
        final StrongBox<int> testStrongBox = StrongBox(keyType: keyType);
        expect(keyType, equals(testStrongBox.keyType));
      }
    });

    test('StrongBox 클래스 put 메서드 테스트', () {
      final StrongBox<int> testStrongBox = StrongBox(keyType: KeyType.finger);
      final int intItem = 10000;

      testStrongBox.put(intItem);

      for (int i = 0; i <= testStrongBox.keyType.tryCount; i++) {
        int? item = testStrongBox.get();
        if (i == testStrongBox.keyType.tryCount) {
          expect(item.runtimeType, equals(intItem.runtimeType));
        }
      }
    });

    group('StrongBox 클래스 KeyType 별 get 메서드 테스트', () {
      group('KeyType padlock get 메서드 테스트', () {
        test('padlock get메서드 count 미달 return null 테스트', () {
          final StrongBox<int> testStrongBox = StrongBox(
            keyType: KeyType.padlock,
          );
          final int intItem = 10000;

          testStrongBox.put(intItem);

          for (int i = 0; i <= testStrongBox.keyType.tryCount; i++) {
            if (i == testStrongBox.keyType.tryCount - 1) {
              // 마지막 카운트전에 나와서 expect에서 호출
              break;
            } else {
              testStrongBox.get();
            }
          }
          expect(testStrongBox.get(), isNull);
        });

        test('padlock get메서드 count 도달 return iten 테스트', () {
          final StrongBox<int> testStrongBox = StrongBox(
            keyType: KeyType.padlock,
          );
          final int intItem = 10000;

          testStrongBox.put(intItem);

          for (int i = 0; i <= testStrongBox.keyType.tryCount; i++) {
            if (i == testStrongBox.keyType.tryCount) {
              // 마지막 카운트에 나와서 expect에서 호출
              break;
            } else {
              testStrongBox.get();
            }
          }
          expect(testStrongBox.get(), equals(intItem));
        });

        test('padlock get메서드 count 초과 throw 테스트', () {
          final StrongBox<int> testStrongBox = StrongBox(
            keyType: KeyType.padlock,
          );
          final int intItem = 10000;

          testStrongBox.put(intItem);

          for (int i = 0; i <= testStrongBox.keyType.tryCount; i++) {
            testStrongBox.get();
          }
          expect(() => testStrongBox.get(), throwsException);
        });
      });

      group('KeyType button get 메서드 테스트', () {
        test('button get메서드 count 미달 return null 테스트', () {
          final StrongBox<int> testStrongBox = StrongBox(
            keyType: KeyType.button,
          );
          final int intItem = 10000;

          testStrongBox.put(intItem);

          for (int i = 0; i <= testStrongBox.keyType.tryCount; i++) {
            if (i == testStrongBox.keyType.tryCount - 1) {
              // 마지막 카운트전에 나와서 expect에서 호출
              break;
            } else {
              testStrongBox.get();
            }
          }
          expect(testStrongBox.get(), isNull);
        });

        test('button get메서드 count 도달 return iten 테스트', () {
          final StrongBox<int> testStrongBox = StrongBox(
            keyType: KeyType.button,
          );
          final int intItem = 10000;

          testStrongBox.put(intItem);

          for (int i = 0; i <= testStrongBox.keyType.tryCount; i++) {
            if (i == testStrongBox.keyType.tryCount) {
              // 마지막 카운트에 나와서 expect에서 호출
              break;
            } else {
              testStrongBox.get();
            }
          }

          expect(testStrongBox.get(), equals(intItem));
        });

        test('button get메서드 count 초과 throw 테스트', () {
          final StrongBox<int> testStrongBox = StrongBox(
            keyType: KeyType.button,
          );
          final int intItem = 10000;

          testStrongBox.put(intItem);

          for (int i = 0; i <= testStrongBox.keyType.tryCount; i++) {
            testStrongBox.get();
          }
          expect(() => testStrongBox.get(), throwsException);
        });
      });

      group('KeyType dial get 메서드 테스트', () {
        test('dial get메서드 count 미달 return null 테스트', () {
          final StrongBox<int> testStrongBox = StrongBox(keyType: KeyType.dial);
          final int intItem = 10000;

          testStrongBox.put(intItem);

          for (int i = 0; i <= testStrongBox.keyType.tryCount; i++) {
            if (i == testStrongBox.keyType.tryCount - 1) {
              // 마지막 카운트전에 나와서 expect에서 호출
              break;
            } else {
              testStrongBox.get();
            }
          }
          expect(testStrongBox.get(), isNull);
        });

        test('dial get메서드 count 도달 return iten 테스트', () {
          final StrongBox<int> testStrongBox = StrongBox(keyType: KeyType.dial);
          final int intItem = 10000;

          testStrongBox.put(intItem);

          for (int i = 0; i <= testStrongBox.keyType.tryCount; i++) {
            if (i == testStrongBox.keyType.tryCount) {
              // 마지막 카운트에 나와서 expect에서 호출
              break;
            } else {
              testStrongBox.get();
            }
          }

          expect(testStrongBox.get(), equals(intItem));
        });

        test('dial get메서드 count 초과 throw 테스트', () {
          final StrongBox<int> testStrongBox = StrongBox(keyType: KeyType.dial);
          final int intItem = 10000;

          testStrongBox.put(intItem);

          for (int i = 0; i <= testStrongBox.keyType.tryCount; i++) {
            testStrongBox.get();
          }
          expect(() => testStrongBox.get(), throwsException);
        });
      });

      group('KeyType finger get 메서드 테스트', () {
        test('finger get메서드 count 미달 return null 테스트', () {
          final StrongBox<int> testStrongBox = StrongBox(
            keyType: KeyType.finger,
          );
          final int intItem = 10000;

          testStrongBox.put(intItem);

          for (int i = 0; i <= testStrongBox.keyType.tryCount; i++) {
            if (i == testStrongBox.keyType.tryCount - 1) {
              // 마지막 카운트전에 나와서 expect에서 호출
              break;
            } else {
              testStrongBox.get();
            }
          }
          expect(testStrongBox.get(), isNull);
        });

        test('finger get메서드 count 도달 return iten 테스트', () {
          final StrongBox<int> testStrongBox = StrongBox(
            keyType: KeyType.finger,
          );
          final int intItem = 10000;

          testStrongBox.put(intItem);

          for (int i = 0; i <= testStrongBox.keyType.tryCount; i++) {
            if (i == testStrongBox.keyType.tryCount) {
              // 마지막 카운트에 나와서 expect에서 호출
              break;
            } else {
              testStrongBox.get();
            }
          }

          expect(testStrongBox.get(), equals(intItem));
        });

        test('finger get메서드 count 초과 throw 테스트', () {
          final StrongBox<int> testStrongBox = StrongBox(
            keyType: KeyType.finger,
          );
          final int intItem = 10000;

          testStrongBox.put(intItem);

          for (int i = 0; i <= testStrongBox.keyType.tryCount; i++) {
            testStrongBox.get();
          }
          expect(() => testStrongBox.get(), throwsException);
        });
      });
    });
  });
}

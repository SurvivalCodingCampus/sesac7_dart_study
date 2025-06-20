import 'package:modu_3_dart_study/assignments/strong_box/key_type.dart';
import 'package:modu_3_dart_study/assignments/strong_box/strong_box.dart';
import 'package:test/test.dart';

void main() {
  const KeyType defaultKey = KeyType.button;
  const int defaultItem = 1;

  group('constructor', () {
    test(
      'When create a StrongBox, key is the given value, item is null.',
      () {
        // given
        // when
        final strongBox = StrongBox<int>(key: defaultKey);
        for (int i = 0; i < defaultKey.tryLimit; i++) {
          expect(strongBox.get(), null);
        }

        // then
        expect(strongBox.key, defaultKey);
        expect(strongBox.get(), null);
      },
    );

    test(
      'When create a StrongBox, key and item is the given value.',
      () {
        // given
        // when
        final strongBox = StrongBox<int>(key: defaultKey, item: defaultItem);
        for (int i = 0; i < defaultKey.tryLimit; i++) {
          expect(strongBox.get(), null);
        }

        // then
        expect(strongBox.key, defaultKey);
        expect(strongBox.get(), defaultItem);
      },
    );
  });

  group('put', () {
    test(
      'Put changes the item from dafaultItem to anotherItem.',
      () {
        // given
        final anotherItem = 10;
        final strongBox = StrongBox<int>(key: defaultKey, item: defaultItem);

        // when
        strongBox.put(anotherItem);
        for (int i = 0; i < defaultKey.tryLimit; i++) {
          expect(strongBox.get(), null);
        }

        // then
        expect(strongBox.get(), anotherItem);
      },
    );
  });

  group('get', () {
    test(
      'If _openTryCount is less than key.tryLimit, get returns null.',
      () {
        // given
        final strongBox = StrongBox<int>(key: defaultKey, item: defaultItem);

        // when
        for (int i = 0; i < defaultKey.tryLimit - 1; i++) {
          expect(strongBox.get(), null);
        }

        // then
        expect(strongBox.get(), null);
      },
    );

    test(
      'If _openTryCount equals key.tryLimit, get returns item.',
      () {
        // given
        final item = 1;
        final strongBox = StrongBox<int>(key: defaultKey, item: item);

        // when
        for (int i = 0; i < defaultKey.tryLimit; i++) {
          expect(strongBox.get(), null);
        }

        // then
        expect(strongBox.get(), item);
      },
    );
  });
}

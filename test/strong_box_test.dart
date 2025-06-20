import 'package:modu_3_dart_study/strong_box.dart';
import 'package:test/test.dart';

void main() {
  group('StrongBox 생성자 테스트', () {
    test('enum의 모든 타입을 인자로 인스턴스를 생성이 가능해야하며, 필요한 값들이 정확히 들어가야 한다.', () {
      // given
      final KeyType testType1 = KeyType.padlock;
      final KeyType testType2 = KeyType.button;
      final KeyType testType3 = KeyType.dial;
      final KeyType testType4 = KeyType.finger;
      final StrongBox testBox1 = StrongBox(keyType: testType1);
      final StrongBox testBox2 = StrongBox(keyType: testType2);
      final StrongBox testBox3 = StrongBox(keyType: testType3);
      final StrongBox testBox4 = StrongBox(keyType: testType4);

      // when & then
      expect(testBox1.keyType, equals(KeyType.padlock));
      expect(testBox2.keyType, equals(KeyType.button));
      expect(testBox3.keyType, equals(KeyType.dial));
      expect(testBox4.keyType, equals(KeyType.finger));
    });
  });

  group('put() 메소드 테스트', () {
    test('처음 물건을 넣을 경우(entity 값이 null인 경우) 정상적으로 물건이 들어가야 한다.', () {
      // given
      final KeyType testType1 = KeyType.padlock;
      final KeyType testType2 = KeyType.button;
      final KeyType testType3 = KeyType.dial;
      final String testEntity1 = '테스트용 물건';
      final int testEntity2 = 150;
      final KeyType testEntity3 = KeyType.finger;
      final StrongBox testBox1 = StrongBox(keyType: testType1);
      final StrongBox testBox2 = StrongBox(keyType: testType2);
      final StrongBox testBox3 = StrongBox(keyType: testType3);

      // when & then
      expect(testBox1.entity, isNull);
      expect(testBox2.entity, isNull);
      expect(testBox3.entity, isNull);

      expect(() => testBox1.put(testEntity1), returnsNormally);
      expect(testBox1.entity, equals(testEntity1));

      expect(() => testBox2.put(testEntity2), returnsNormally);
      expect(testBox2.entity, equals(testEntity2));

      expect(() => testBox3.put(testEntity3), returnsNormally);
      expect(testBox3.entity, equals(testEntity3));
    });

    test(
      '금고에 물건이 들어가있을 경우(entity 값이 null이 아닐 경우) 물건을 넣을 수 없어 Exception이 발생해야 한다.',
      () {
        // given
        final String testEntity1 = '테스트용 물건';
        final int testEntity2 = 150;
        final KeyType testEntity3 = KeyType.finger;
        final StrongBox testBox1 = StrongBox(keyType: KeyType.padlock);
        final StrongBox testBox2 = StrongBox(keyType: KeyType.button);
        final StrongBox testBox3 = StrongBox(keyType: KeyType.dial);

        // when
        testBox1.put(testEntity1);
        testBox2.put(testEntity2);
        testBox3.put(testEntity3);

        // then
        expect(testBox1.entity, isNotNull);
        expect(testBox2.entity, isNotNull);
        expect(testBox3.entity, isNotNull);

        expect(() => testBox1.put(testEntity3), throwsException);
        expect(() => testBox2.put(testEntity2), throwsException);
        expect(() => testBox3.put(testEntity1), throwsException);
      },
    );
  });

  group('get() 메소드 테스트', () {
    test('padlock 경계값 테스트', () {
      // given
      final KeyType testType = KeyType.padlock;
      final String testEntity = '테스트용 물건';
      final int keyLimit = 1024; // 경계값은 1023회, 1024회, 1025회
      final int tryCountReset = 0; // entity를 리턴한 후 리셋된 tryCount
      final StrongBox testBox = StrongBox(keyType: testType);

      // when
      testBox.put(testEntity);

      // then
      expect(keyLimit, equals(testBox.keyTypeMap[testType]));

      // 1회 ~ 1023회 시도까지는 계속 null을 리턴
      for (int i = 0; i < keyLimit - 1; i++) {
        expect(testBox.get(), isNull);
      }

      // 마지막인 1024회까지도 null을 리턴
      expect(testBox.get(), isNull);

      // 사용횟수 제한을 초과하여 시도하면 그때 entity를 리턴
      expect(testBox.get(), equals(testEntity));

      // entity를 리턴하면서 entity 값을 null로 비우고 tryCount 값을 0으로 초기화했는지 확인
      expect(testBox.entity, isNull);
      expect(testBox.tryCount, equals(tryCountReset));
    });

    test('button 경계값 테스트', () {
      // given
      final KeyType testType = KeyType.button;
      final String testEntity = '테스트용 물건';
      final int keyLimit = 10000; // 경계값은 9999회, 10000회, 10001회
      final int tryCountReset = 0; // entity를 리턴한 후 리셋된 tryCount
      final StrongBox testBox = StrongBox(keyType: testType);

      // when
      testBox.put(testEntity);

      // then
      expect(keyLimit, equals(testBox.keyTypeMap[testType]));

      // 1회 ~ 9999회 시도까지는 계속 null을 리턴
      for (int i = 0; i < keyLimit - 1; i++) {
        expect(testBox.get(), isNull);
      }

      // 마지막인 10000회까지도 null을 리턴
      expect(testBox.get(), isNull);

      // 사용횟수 제한을 초과하여 시도하면 그때 entity를 리턴
      expect(testBox.get(), equals(testEntity));

      // entity를 리턴하면서 entity 값을 null로 비우고 tryCount 값을 0으로 초기화했는지 확인
      expect(testBox.entity, isNull);
      expect(testBox.tryCount, equals(tryCountReset));
    });

    test('dial 경계값 테스트', () {
      // given
      final KeyType testType = KeyType.dial;
      final String testEntity = '테스트용 물건';
      final int keyLimit = 30000; // 경계값은 29999회, 30000회, 30001회
      final int tryCountReset = 0; // entity를 리턴한 후 리셋된 tryCount
      final StrongBox testBox = StrongBox(keyType: testType);

      // when
      testBox.put(testEntity);

      // then
      expect(keyLimit, equals(testBox.keyTypeMap[testType]));

      // 1회 ~ 29999회 시도까지는 계속 null을 리턴
      for (int i = 0; i < keyLimit - 1; i++) {
        expect(testBox.get(), isNull);
      }

      // 마지막인 30000회까지도 null을 리턴
      expect(testBox.get(), isNull);

      // 사용횟수 제한을 초과하여 시도하면 그때 entity를 리턴
      expect(testBox.get(), equals(testEntity));

      // entity를 리턴하면서 entity 값을 null로 비우고 tryCount 값을 0으로 초기화했는지 확인
      expect(testBox.entity, isNull);
      expect(testBox.tryCount, equals(tryCountReset));
    });

    test('finger 경계값 테스트', () {
      // given
      final KeyType testType = KeyType.finger;
      final String testEntity = '테스트용 물건';
      final int keyLimit = 1000000; // 경계값은 999999회, 1000000회, 1000001회
      final int tryCountReset = 0; // entity를 리턴한 후 리셋된 tryCount
      final StrongBox testBox = StrongBox(keyType: testType);

      // when
      testBox.put(testEntity);

      // then
      expect(keyLimit, equals(testBox.keyTypeMap[testType]));

      // 1회 ~ 999999회 시도까지는 계속 null을 리턴
      for (int i = 0; i < keyLimit - 1; i++) {
        expect(testBox.get(), isNull);
      }

      // 마지막인 1000000회까지도 null을 리턴
      expect(testBox.get(), isNull);

      // 사용횟수 제한을 초과하여 시도하면 그때 entity를 리턴
      expect(testBox.get(), equals(testEntity));

      // entity를 리턴하면서 entity 값을 null로 비우고 tryCount 값을 0으로 초기화했는지 확인
      expect(testBox.entity, isNull);
      expect(testBox.tryCount, equals(tryCountReset));
    });
  });
}

/*

### 테스트 케이스 정리 ###
- 생성자 테스트
  => enum의 모든 타입을 인자로 인스턴스를 생성이 가능해야하며, 필요한 값들이 정확히 들어가야 한다.
- put() 메소드 테스트
  => 처음 물건을 넣을 경우(entity 값이 null인 경우) 정상적으로 물건이 들어가야 한다.
  => 금고에 물건이 들어가있을 경우(entity 값이 null이 아닐 경우) 물건을 넣을 수 없어 Exception이 발생해야 한다.
- get() 메소드 테스트
  => 각 열쇠의 사용횟수 제한이 존재하는데, 경계값을 기준으로 로직이 제대로 작동하는지 확인한다.
  =>
 */

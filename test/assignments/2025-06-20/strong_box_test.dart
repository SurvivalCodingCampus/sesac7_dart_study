import 'package:modu_3_dart_study/assignments/2025-06-20/key_type.dart';
import 'package:modu_3_dart_study/assignments/2025-06-20/strong_box.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('StrongBox 테스트', () {
    test('StrongBox 생성 및 get()시 null 테스트', () {
      KeyType keyType = KeyType.padlock;
      StrongBox<String> strongBox = StrongBox(keyType: keyType);
      strongBox.put('중요한 물건');

      expect(strongBox.get(), null);
    });

    test('StrongBox padlock 생성 및 각 키 반환시 횟수 제한 null 및 횟수 제한 이후 값 반환 테스트', () {
      StrongBox<String> box1 = StrongBox(keyType: KeyType.padlock);
      box1.put('중요한 물건');

      for (int i = 0; i < 1024; i++) {
        expect(box1.get(), isNull);
        expect(box1.openCount, equals(i + 1));
      }
      expect(box1.get(), isNotNull);
      expect(box1.openCount, 1024);

      expect(box1.get(), isNotNull);
      expect(box1.openCount, 1024);

      ///1024에서 더 이상 늘어나지 않음. why? 문제 요구사항이 openCount < keyType.remainCount 일때만 openCount를 증가 시키고 Null 반환하고 , 아닌 경우에는 값을 반환하기때문에
      ///각 remainCount값에 도달하면 그 이상으로 값이 증가하지 않음.
    });

    test('StrongBox button 생성 및 각 키 반환시 횟수 제한 null 및 횟수 제한 이후 값 반환 테스트', () {
      StrongBox<String> box2 = StrongBox(keyType: KeyType.button);
      box2.put('중요한 물건');

      for (int i = 0; i < 10000; i++) {
        expect(box2.get(), isNull);
        expect(box2.openCount, equals(i + 1));
      }
      expect(box2.get(), isNotNull);
      expect(box2.openCount, 10000);

      expect(box2.get(), isNotNull);
      expect(box2.openCount, 10000);
    });

    test('StrongBox dial 생성 및 각 키 반환시 횟수 제한 null 및 횟수 제한 이후 값 반환 테스트', () {
      StrongBox<String> box3 = StrongBox(keyType: KeyType.dial);
      box3.put('중요한 물건');
      for (int i = 0; i < 30000; i++) {
        expect(box3.get(), isNull);
        expect(box3.openCount, equals(i + 1));
      }
      expect(box3.get(), isNotNull);
      expect(box3.openCount, 30000);

      expect(box3.get(), isNotNull);
      expect(box3.openCount, 30000);
    });

    test('StrongBox finger 생성 및 각 키 반환시 횟수 제한 null 및 횟수 제한 이후 값 반환 테스트', () {
      StrongBox<String> box4 = StrongBox(keyType: KeyType.finger);
      box4.put('중요한 물건');
      for (int i = 0; i < 1000000; i++) {
        expect(box4.get(), isNull);
        expect(box4.openCount, equals(i + 1));
      }
      expect(box4.get(), isNotNull);
      expect(box4.openCount, 1000000);

      expect(box4.get(), isNotNull);
      expect(box4.openCount, 1000000);
    });
  });
}

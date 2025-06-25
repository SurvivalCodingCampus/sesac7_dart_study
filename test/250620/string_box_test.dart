import 'package:modu_3_dart_study/250620/strong_box.dart';
import 'package:test/test.dart';

void main() {
  test('금고방식별 시도횟수 테스트', () {
    for (int i = 0; i < KeyType.values.length; i++) {
      KeyType keyType = KeyType.values[i];

      print(keyType.toString());
      final strongBox = StrongBox(keyType: keyType);

      strongBox.put(input: '금고');

      var value;

      int tryCount = 0;
      do {
        value = strongBox.get();
        tryCount++;
        //print(value);
      } while (value == null);

      print(tryCount);

      expect(tryCount, StrongBox.targetCounts[keyType.index]);
    }
  });
}

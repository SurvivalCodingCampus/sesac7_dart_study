import 'package:modu_3_dart_study/assignments/2025-06-11/person.dart';
import 'package:test/test.dart';

void main() {
  group('Person 테스트', () {
    test('생성자 테스트', () {
      final person = Person('이기혁', 2000);
      expect(person.name, '이기혁');
      expect(person.age, 25);
    });
  });
}

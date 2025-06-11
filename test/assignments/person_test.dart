import 'package:modu_3_dart_study/assignments/person.dart';
import 'package:test/test.dart';

void main() {
  group('Person 테스트', () {
    test('name, birthYear 생성', () {
      final person = Person('person1', 1997);

      expect(person.name, equals('person1'));
      expect(person.birthYear, equals(1997));
    });

    test('age 계산 테스트', () {
      final currentYear = DateTime.now().year;
      final person = Person('person2', 2000);

      expect(person.age, equals(currentYear - 2000));
    });

    test('name, birthYear 수정 불가 테스트', () {
      final person = Person('person3', 2010);

      expect(
        () => person.name,
        returnsNormally,
      ); // 에러(exception)가 없이 동작 해야 하는 테스트 코드 속성
      expect(() => person.birthYear, returnsNormally);
    });
  });
}

import 'package:modu_3_dart_study/person.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('PersonTest', () {
    test('Person 클래스 생성자 테스트', () {
      final String testPersonName = 'Person';
      final int testPersonBirthYear = 1998;
      final Person person = Person(name: testPersonName, birthYear: testPersonBirthYear);

      expect(person.name == testPersonName, equals(true));
      expect(person.birthYear == testPersonBirthYear, equals(true));
    });
    test('Person 클래스 age 프로퍼티 유효성 체크', () {
      final String testPersonName = 'Person';
      final int testPersonBirthYear = 1998;
      final Person person = Person(name: testPersonName, birthYear: testPersonBirthYear);

      final int personAge = DateTime.now().year - person.birthYear;

      expect(person.age, equals(personAge));
    });
  });
}
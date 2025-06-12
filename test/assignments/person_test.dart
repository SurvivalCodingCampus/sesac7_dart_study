import 'package:modu_3_dart_study/assignments/person.dart';
import 'package:test/test.dart';

void main() {
  const String defaultName = 'name';
  const int defaultBirthYear = 1996;

  late int thisYear;

  setUp(() {
    thisYear = DateTime.now().year;
  });

  group('constructor', () {
    test('When create a person, the name, birthYear are given value.', () {
      // given

      // when
      final person = Person(defaultName, birthYear: defaultBirthYear);

      // then
      expect(person.name, defaultName);
      expect(person.birthYear, defaultBirthYear);
    });
  });

  group('age', () {
    test('When create a person, the age == thisYear - birthYear.', () {
      // given
      final person = Person(defaultName, birthYear: defaultBirthYear);

      // when
      // then
      expect(person.age, thisYear - defaultBirthYear);
    });
  });
}

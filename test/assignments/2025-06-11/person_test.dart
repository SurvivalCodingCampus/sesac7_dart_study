import 'package:test/test.dart';
import 'package:modu_3_dart_study/assignments/2025-06-11/Person.dart';

void main() {
  test('Person instance test', () {
    Person sumin = Person('Sumin', 1995);

    expect(sumin.name, 'Sumin');
    expect(sumin.birthYear, 1995);

    final now = DateTime.now();
    expect(sumin.age, now.year - 1995);
  });
}

import 'package:modu_3_dart_study/encapsulation/person.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  test('Person 클래스 테스트', () {
    final originName = '홍기동1';
    final originBirthYear = 1999;
    final originAge = DateTime.now().year - originBirthYear;
    final newName = '홍길동2';
    final newBirthYear = 1000;
    final newAge = DateTime.now().year - newBirthYear;

    final originPerson = Person(name: originName, birthYear: originBirthYear);
    final newPerson = Person(name: newName, birthYear: newBirthYear);

    // setter 가 없기 때문에 수정 불가 (에러 발생, 테스트 불가)
    // originPerson.name = originName;
    // originPerson.birthYear = originBirthYear;
    // originPerson.age = originAge;
    // newPerson.name = newName;
    // newPerson.birthYear = newBirthYear;
    // newPerson.age = newAge;

    expect(originPerson.age == originAge, equals(true));
    expect(newPerson.age == newAge, equals(true));
  });
}

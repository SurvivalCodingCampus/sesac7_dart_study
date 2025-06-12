import 'package:test/test.dart';
import 'package:modu_3_dart_study/250611/person.dart';

void main() {
  test('오늘부터 언제까지 몇일 차이나는지 테스트', () {
    //이름체크
    Person person0 = Person('박수진', DateTime.now());
    expect(person0.name, equals('박수진'));

    //1일전에 태어났으면 1살
    Person person1 = Person('박수진', DateTime.now().subtract(Duration(days: 1)));
    expect(person1.age, equals(1));

    //365일전에 태어났으면 2살
    Person person2 = Person(
      '박수진',
      DateTime.now().subtract(Duration(days: 365)),
    );
    expect(person2.age, equals(2));

    //3650일전에 태어났으면 11살
    Person person3 = Person(
      '박수진',
      DateTime.now().subtract(Duration(days: 365 * 10)),
    );
    expect(person3.age, equals(11));

    //내 생일부터 계산
    Person person4 = Person('박수진', DateTime.utc(1979, 12, 12));
    expect(person4.age, equals(46));
  });
}

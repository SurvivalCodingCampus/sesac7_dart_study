import 'package:modu_3_dart_study/person.dart';
import 'package:test/test.dart';

void main() {
  test('생성자 테스트', () {
    // given
    final int yearNow = DateTime.now().year; // 현재 연도
    final int testYear1 = 2001;
    final int testYear2 = 1988;
    final Person person1 = Person('이학민', testYear1);
    final Person person2 = Person('홍길동', testYear2);

    // when & then
    expect(person1.name, equals('이학민'));
    expect(person1.birthYear, equals(testYear1));
    expect(person1.age, equals(yearNow - testYear1));

    expect(person2.name, equals('홍길동'));
    expect(person2.birthYear, equals(testYear2));
    expect(person2.age, equals(yearNow - testYear2));
  });
}

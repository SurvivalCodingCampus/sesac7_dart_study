import 'package:test/test.dart';
import 'package:modu_3_dart_study/2025-06-11/person.dart';

void main(){
  test('person 생성자 테스트',(){
    final person01 = Person(name: '홍길동', birthYear: 1991);
    final expectedAge = DateTime.now().year - person01.birthYear;
    expect(person01.age, expectedAge);
  });
}

import 'package:modu_3_dart_study/person.dart';
import 'package:test/test.dart';

void main() {
  test('Given Person 클래스 when 2024년으로 인스턴스 생성하면 then age 값이 1이어야', () {
    // given(준비)
    Person hongGilDong = Person(name: '홍길동', birthYear: 2024);
    // when (실행)
    // hongGilDong.age
    // then (검증)
    expect(hongGilDong.age, 1);
  });

  test('Given Person 클래스 when 2000년으로 인스턴스 생성하면 then age 값이 25이어야', () {
    // given(준비)
    Person hongGilDong = Person(name: '홍길동', birthYear: 2000);
    // when (실행)
    // hongGilDong.age
    // then (검증)
    expect(hongGilDong.age, 25);
  });

  test('Given Person 클래스 when 2030년으로 인스턴스 생성하면 then 예외 발생', () {
    // given(준비)
    Person amugae = Person(name: '아무개', birthYear: 2030);
    // when (실행)
    // amugae.age
    // then (검증)
    expect(() => amugae.age, throwsException);
  });

  test('Given Person 클래스 when 1890년으로 인스턴스 생성하면 then 예외 발생', () {
    // given(준비)
    Person amugae = Person(name: '아무개', birthYear: 1890);
    // when (실행)
    // amugae.age
    // then (검증)
    expect(() => amugae.age, throwsException);
  });
}

import 'package:modu_3_dart_study/lecture_code/generic/strongbox.dart';
import 'package:test/test.dart';

void main() {
  group('제네릭 열거형', () {
    test('연습문제 1 클래스 정의 Test', () {
      //given(준비)
      var letter = StrongBox<String>();
      var num = StrongBox<int>();
      var per = StrongBox<Person>();

      final person = Person(name: '홍길동', age: 100);
      final String answer = 'a';
      final int number = 1;

      final name = '홍길동';
      final age = 100;

      //when(실행)
      letter.put(answer);
      num.put(number);
      per.put(person);

      //then(검증)
      expect(letter.get() == answer, true);
      expect(num.get() == number, true);
      expect(per.get()?.name == name, true);
      expect(per.get()?.age == age, true);
    });
  });
}
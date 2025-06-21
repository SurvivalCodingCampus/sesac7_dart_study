import 'package:modu_3_dart_study/lecture_code/generic/strongbox.dart';
import 'package:test/test.dart';

class Person {
  String name;
  int age;

  Person({required this.name, required this.age});
}

void main() {
  group('제네릭 열거형 연습문제 1 ', () {
    test('클래스 정의 Test', () {
      //given(준비)
      final person = Person(name: '홍길동', age: 100);
      final name = '홍길동';
      final age = 100;

      var letter = StrongBox<String>(name);
      var num = StrongBox<int>(age);
      var per = StrongBox<Person>(person);

      final String answer = 'a';
      final int number = 1;

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

  group('제네릭 열거형 연습문제 2 ', () {
    test('열거형 KeyType정의 및 클래스 수정 - 한도횟수까지 시도 Test', () {
      //given(준비)
      final StrongBox sb = StrongBox(KeyType);
      KeyType key = KeyType.padlock;

      //when(실행)
      sb.put(key);
      for (int i = 0; i < StrongBox.padlockLimitNum; i++) {
        sb.get();
      }

      //then(검증)
      expect(sb.get() == null, true);
    });

    test('연습문제 2 열거형 KeyType정의 및 클래스 수정 - button 한도횟수까지 시도 초과 Test', () {
      //given(준비)
      final StrongBox sb = StrongBox(KeyType);
      KeyType key = KeyType.button;
      sb.put(key);

      //when(실행)
      for (int i = 0; i < StrongBox.buttonLimitNum; i++) {
        sb.get();
      }

      //then(검증)
      expect(sb.get() == null, true);
    });

    test('연습문제 2 열거형 KeyType정의 및 클래스 수정 - dial 한도횟수까지 시도 초과 Test', () {
      //given(준비)
      final StrongBox sb = StrongBox(KeyType);
      KeyType key = KeyType.dial;
      sb.put(key);

      //when(실행)
      for (int i = 0; i < StrongBox.dialLimitNum; i++) {
        sb.get();
      }

      //then(검증)
      expect(sb.get() == null, true);
    });

    test('연습문제 2 열거형 KeyType정의 및 클래스 수정 - finger 한도횟수까지 시도 초과 Test', () {
      //given(준비)
      final StrongBox sb = StrongBox(KeyType);
      KeyType key = KeyType.finger;
      sb.put(key);

      //when(실행)
      for (int i = 0; i < StrongBox.fingerLimitNum; i++) {
        sb.get();
      }

      //then(검증)
      expect(sb.get() == null, true);
    });
  });

  group('제네릭 열거형 연습문제 2', () {
    test('열거형 KeyType정의 및 클래스 수정 - padlock 한도횟수 초과 Test', () {
      //given(준비)
      final StrongBox sb = StrongBox(KeyType);
      final int addLimitNum = 1;
      KeyType key = KeyType.padlock;
      sb.put(key);

      //when(실행)
      for (int i = 0; i < StrongBox.padlockLimitNum + addLimitNum; i++) {
        sb.get();
      }

      //then(검증)
      expect(sb.get() == key, true);
    });

    test('연습문제 2 열거형 KeyType정의 및 클래스 수정 - button 한도횟수 초과 Test', () {
      //given(준비)
      final StrongBox sb = StrongBox(KeyType);
      final int addLimitNum = 1;
      KeyType key = KeyType.button;
      sb.put(key);

      //when(실행)
      for (int i = 0; i < StrongBox.buttonLimitNum + addLimitNum; i++) {
        sb.get();
      }

      //then(검증)
      expect(sb.get() == key, true);
    });

    test('연습문제 2 열거형 KeyType정의 및 클래스 수정 - dial 한도횟수 초과 Test', () {
      //given(준비)
      final StrongBox sb = StrongBox(KeyType);
      final int addLimitNum = 1;
      KeyType key = KeyType.dial;
      sb.put(key);

      //when(실행)
      for (int i = 0; i < StrongBox.dialLimitNum + addLimitNum; i++) {
        sb.get();
      }

      //then(검증)
      expect(sb.get() == key, true);
    });

    test('연습문제 2 열거형 KeyType정의 및 클래스 수정 - finger 한도횟수 초과 Test', () {
      //given(준비)
      final StrongBox sb = StrongBox(KeyType);
      final int addLimitNum = 1;
      KeyType key = KeyType.finger;
      sb.put(key);

      //when(실행)
      for (int i = 0; i < StrongBox.fingerLimitNum + addLimitNum; i++) {
        sb.get();
      }

      //then(검증)
      expect(sb.get() == key, true);
    });
  });
}

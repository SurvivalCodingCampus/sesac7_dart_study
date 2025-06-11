/*
이름을 가지는 Person 클래스를 작성하고, 다음을 수행하는 코드를 작성하시오.
이름이 ‘홍길동', ‘한석봉' 인 Person 인스턴스를 생성하고, List에 담습니다.
List에 담긴 모든 Person 인스턴스의 이름을 표시하시오.
*/
import 'package:modu_3_dart_study/20250611/person.dart';

void main() {
  List<Person> students = [];

  Person person1 = Person('홍길동', 20);
  Person person2 = Person('한석봉', 25);

  students.add(person1);
  students.add(person2);

  for (final student in students) {
    print("학생 이름 : ${student.name}");
  }
}
import 'package:modu_3_dart_study/assignments/person.dart';

void main() {
  collectionAssign2();
  collectionAssign3();
}

void collectionAssign2() {
  // 연습문제 2 - 컬렉션의 응용
  final List<Map<String, dynamic>> people = [
    {'name': '홍길동', 'age': 20},
    {'name': '한석봉', 'age': 25},
  ];

  for (final person in people) {
    print('${person['name']}의 나이는 ${person['age']}살');
  }
}

void collectionAssign3() {
  // 연습문제 3 - 클래스와 컬렉션 응용
  final hong = Person('홍길동', birthYear: 2000);
  final han = Person('한석봉', birthYear: 2000);
  final people = [hong, han];

  for (final person in people) {
    print(person.name);
  }
}

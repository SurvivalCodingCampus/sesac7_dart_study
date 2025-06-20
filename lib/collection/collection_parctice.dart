import 'package:modu_3_dart_study/encapsulation/person.dart';

void main() {
  practice2();
  practice3();
}

void practice2() {
  Map<String, int> people = {'홍길동': 20, '한석봉': 25};

  for (var element in people.entries) {
    print('"${element.key}의 나이는 ${element.value}살"');
  }
}

void practice3() {
  final person1 = Person(name: '홍길동', birthYear: 1999);
  final person2 = Person(name: '한석봉', birthYear: 1999);
  List<Person> people = [person1, person2];

  for (var person in people) {
    print(person.name);
  }
}

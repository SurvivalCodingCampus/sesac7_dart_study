List<Map<String, dynamic>> heros = [
  {'name': '홍길동', 'age': 20},
  {'name': '한석봉', 'age': 25},
];

class Person {
  String name;

  Person(this.name);
}

void main() {
  print('${heros[0]['name']}의 나이는 ${heros[0]['age']}');
  print('${heros[1]['name']}의 나이는 ${heros[1]['age']}');

  final p1 = Person('홍길동');
  final p2 = Person('한석봉');

  List<Person> herosName = [p1, p2];

  for (final person in herosName) {
    print(person.name);
  }
}

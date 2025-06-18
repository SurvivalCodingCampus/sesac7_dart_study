void main() {
  assignment2();
  assignment3();
}

class Person {
  final String _name;
  final int _age;

  // getter
  String get name => _name;
  int get age => _age;

  Person({required String name, required int age}) : _name = name, _age = age;
}

void assignment2() {
  final Map<String, int> personMap = {'홍길동': 25, '한석봉': 20};

  for (var element in personMap.entries) {
    print('${element.key}의 나이는 ${element.value}살');
  }
}

void assignment3() {
  final Person person1 = Person(name: '홍길동', age: 25);
  final Person person2 = Person(name: '한석봉', age: 20);
  final List<Person> personList = [];

  personList.add(person1);
  personList.add(person2);

  for (var element in personList) {
    print(element.name);
  }
}

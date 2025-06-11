class Person {
  final String name;
  final int birthYear;

  Person({required this.name, required this.birthYear});

  int get age => DateTime.now().year - birthYear;
}

void _collectionPractice2() {
  List<Map<String, dynamic>> people = [];
  people.add({'name': '홍길동', 'age': 20});
  people.add({'name': '한석봉', 'age': 25});

  for (Map<String, dynamic> person in people) {
    print('${person['name']}의 나이는 ${person['age']}살');
  }
}

void _collectionPractice3() {
  Person personHong = Person(name: '홍길동', birthYear: 2005);
  Person personHan = Person(name: '한석봉', birthYear: 2000);

  List<Person> people = <Person>[];
  people.add(personHong);
  people.add(personHan);

  for (Person person in people) {
    print(person.name);
  }
}

void main() {
  _collectionPractice2();
  _collectionPractice3();
}

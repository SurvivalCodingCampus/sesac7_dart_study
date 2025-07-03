void main() {
  for (var person in people.entries) {
    print('${person.key}의 나이는 ${person.value}살');
  }

  print('---------------------------');

  for (final person in peopleList) {
    print(person.name);
  }
}

Map<String, int> people = {'홍길동': 20, '한석봉': 25};

// ----------------------------

class Person {
  final String name;

  Person(this.name);
}

List<Person> peopleList = [Person('홍길동'), Person('한석봉')];

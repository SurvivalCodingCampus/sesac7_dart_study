void main() {
  assignment2();
  assignment3();
}

class Person {
  final String _name;
  final int _birthYear;

  // getter
  String get name => _name;
  int get birthYear => _birthYear;
  int get age {
    final year = DateTime.now().year;
    return year - birthYear;
  }

  Person(this._name, this._birthYear);
}

void assignment2() {
  // Person에서의 나이 계산은 '현재 연도 - birthYear'
  final Person person1 = Person('홍길동', 2005);
  final Person person2 = Person('한석봉', 2000);

  final Map<String, int> personMap = {
    person1.name: person1.age,
    person2.name: person2.age,
  };

  for (var element in personMap.entries) {
    print('${element.key}의 나이는 ${element.value}살');
  }
}

void assignment3() {
  // Person에서의 나이 계산은 '현재 연도 - birthYear'
  final Person person1 = Person('홍길동', 2005);
  final Person person2 = Person('한석봉', 2000);
  final List<Person> personList = [];

  personList.add(person1);
  personList.add(person2);

  for (var element in personList) {
    print(element.name);
  }
}

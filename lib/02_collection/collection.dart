

void func(String name) {
  print(name);
}

void main() {
  final List<String> names = [];

  final names2 = <String>['dd', 'ddd', 'dd'];
  names2.add('aaa');
  names2.add('bbb');
  names2.add('ccc');
  // names2.elementAt(3);
  print(names2[3]);
  names2.contains('dd');

  names2.forEach((name) {

  });

  names2.forEach(print);

  final names3 = [];
  names3.add('bbb');
  names3.add(1);
  names3.add(true);

  // type safety
  var name4 = '홍길동';
  // name4 = 1;
  print(name4.length);

  // type safety 완전히 반한다. 금지
  dynamic name5 = '홍길동';
  name5 = 1;
  name5 = true;
  name5 = null;
  // print(name5.length);

  // something('홍길동');

  final lottoSet = <int>{1, 2, 3, 4};
  lottoSet.add(5);
  lottoSet.add(5);
  lottoSet.add(5);
  lottoSet.add(5);

  print(lottoSet);

  Map<String, dynamic> person = {
    'name': '홍길동',
    'age': 10,
  };

  Person person2 = Person('홍길동', 10);

  List<Person> people = [
    person2,
  ];

  person2.name = '한석봉';
  print(people[0].name);
}

class Person {
  String name;
  int age;

  Person(this.name, this.age);
}

void something(name) {
  print(name + 1);
}
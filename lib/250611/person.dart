class Person {
  final String name;
  final DateTime birthYear;

  Person(this.name, this.birthYear);

  int get age {
    Duration difference = DateTime.now().difference(birthYear);
    print('difference: $difference');

    int years = difference.inDays ~/ 365 + 1;
    print('years: $years');

    return years;
  }
}

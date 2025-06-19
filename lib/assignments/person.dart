class Person {
  final String name;
  final int birthYear;

  Person(
    this.name, {
    required this.birthYear,
  });

  int get age => DateTime.now().year - birthYear;
}

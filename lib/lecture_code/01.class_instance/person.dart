class Person {
  final String name;
  int birthYear;

  Person({required this.name, required int birthYear})
    : birthYear = birthYear >= 1970 ? birthYear : 1970;

  int get age {
    return DateTime.now().year - birthYear;
  }
}
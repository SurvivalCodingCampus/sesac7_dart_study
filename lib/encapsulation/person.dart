class Person {
  final String _name;
  final int _birthYear;

  Person({required String name, required int birthYear})
    : _name = name,
      _birthYear = birthYear;

  String get name => _name;

  int get birthYear => _birthYear;

  int get age => DateTime.now().year - birthYear;
}

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

class Person {
  String _name;

  int _birthYear;

  // Person({required String name, required int birthYear})
  //   : _name = name,
  //     _birthYear = birthYear;

  Person(this._name, this._birthYear);

  String get name => _name;

  int get birthYear => _birthYear;

  int get age {
    final now = DateTime.now();
    final year = now.year;
    return year - birthYear;
  }
}

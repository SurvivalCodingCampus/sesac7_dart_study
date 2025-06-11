class Person {
  final String _name;
  final int _age;

  String get name => _name;
  int get age => _age;

  Person(this._name, this._age);
}

class Student {
  final String _name;
  final int _birthYear;

  String get name => _name;

  int _age = 0;
  int get age{
    DateTime now = DateTime.now();
    final int currentYear = now.year;
    _age = currentYear - _birthYear;

    if (_age > 200 || _age < 0) throw Exception('생성 시 태어난 년도를 확인해주세요.');

    return _age;
  }

  Student(this._name, {required int birthYear}) : _birthYear = birthYear;
}
class Person {
  final String name;
  final int birthYear;
  int _age = 0;

  Person({required this.name, required this.birthYear});

  int get age {
    final now = DateTime.now();
    final currentYear = now.year;
    _age = currentYear - birthYear;
    if (_age > 0 && _age < 130) {
      return _age;
    } else {
      throw Exception('태어난 연도를 확인해 주세요.');
    }
  }
}

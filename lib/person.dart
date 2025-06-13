class Person {
  final String name;
  final int birthYear;

  // int _age = 0;

  Person({required this.name, required this.birthYear});

  int get age {
    final now = DateTime.now();
    final currentYear = now.year;
    final int age = currentYear - birthYear;
    if (age > 0 && age < 130) {
      return age;
    } else {
      throw Exception('태어난 연도를 확인해 주세요.');
    }
  }
}

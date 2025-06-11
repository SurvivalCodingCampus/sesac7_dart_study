class Person {
  final String _name;
  final int _birthYear;

  // getter
  String get name => _name;
  int get birthYear => _birthYear;
  int get age {
    final year = DateTime.now().year;

    // 출생 연도에 대한 검증
    if (birthYear > year) {
      throw Exception('출생 연도는 현재 연도보다 커질 수 없습니다.');
    }
    return year - birthYear;
  }

  Person(this._name, this._birthYear);
}

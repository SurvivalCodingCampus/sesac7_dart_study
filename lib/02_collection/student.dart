class Student {
  final String _name;
  int _birthYear;

  set birthYear(int value) {
    _birthYear = value;

    if (age > 200 || age < 0) throw Exception('생성 시 태어난 년도를 확인해주세요.');
  }

  int get birthYear => _birthYear;

  String get name => _name;

  int get age {
    DateTime now = DateTime.now();
    final int currentYear = now.year;
    return currentYear - _birthYear;
  }

  Student(this._name, {required int birthYear}) : _birthYear = birthYear {
    this.birthYear = birthYear;
  }
}

void main() {
  Student student = Student('aaa', birthYear: 2000);
  student.birthYear = 10;

}
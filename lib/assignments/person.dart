class Person {
  final String _name;
  final int _birthYear;

  Person(this._name, this._birthYear);

  String get name => _name;

  int get birthYear => _birthYear;

  int get age => DateTime.now().year - _birthYear;
}

void main() {
  final Map<String, dynamic> honggildong = {'name': '홍길동', 'age': 20};
  final Map<String, dynamic> hanseokbong = {'name': '한석봉', 'age': 25};

  print('${honggildong['name']}의 나이는 ${honggildong['age']}살');
  print('${hanseokbong['name']}의 나이는 ${hanseokbong['age']}살');
}

class Employee {
  String _name;
  int _age;

  // 생성자
  Employee({required String name, required int age}) : _name = name, _age = age;

  // getter
  String get name => _name;

  int get age => _age;

  // setter
  set name(String name) => _name = name;

  set age(int age) {
    if (age < 0) {
      throw Exception('나이는 음수가 될 수 없습니다.');
    }

    _age = age;
  }

  // 직렬화
  Map<String, dynamic> toJson() {
    return {'name': name, 'age': age};
  }
}

class Employee {
  final String _name;
  final int _age;

  String get name => _name;
  int get age => _age;

  Employee(String name, int age) : _name = name, _age = age;

  // 역직렬화
  Employee.fromJson(Map<String, dynamic> json) :
      _name = json['name'],
      _age = json['age'];

  // 직렬화
  Map<String, dynamic> toJson() {
    return {
      'name' : _name,
      'age' : _age
    };
  }
}
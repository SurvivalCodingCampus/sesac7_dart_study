class Employee {
  final String _name;
  final int _age;

  String get name => _name;

  int get age => _age;

  Employee({required String name, required int age}) : _name = name, _age = age;

  Employee.fromJson(Map<String, dynamic> json)
    : _name = json['name'],
      _age = json['age'];

  Map<String, dynamic> toJson() {
    return {'name': name, 'age': age};
  }
}

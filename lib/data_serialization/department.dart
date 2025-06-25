import 'package:modu_3_dart_study/data_serialization/employee.dart';

class Department {
  String _name;
  Employee _leader;

  // 생성자
  Department(String name, Employee leader) : _name = name, _leader = leader;

  // getter
  String get name => _name;

  Employee get leader => _leader;

  // setter
  set name(String name) => _name = name;

  set leader(Employee leader) => _leader = leader;

  // 직렬화
  Map<String, dynamic> toJson() {
    return {'name': name, 'leader': leader.toJson()};
  }
}

import 'package:modu_3_dart_study/11_data_type/employee.dart';

class Department {
  final String _name;
  final Employee _leader;

  String get name => _name;

  Employee get leader => _leader;

  Department({required String name, required Employee leader})
    : _name = name,
      _leader = leader;

  Department.fromJson(Map<String, dynamic> json)
    : _name = json['name'],
      _leader = Employee.fromJson(json['leader']);

  Map<String, dynamic> toJson() {
    return {'name': name, 'leader': leader.toJson()};
  }
}

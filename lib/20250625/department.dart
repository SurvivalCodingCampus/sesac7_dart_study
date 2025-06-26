

import 'package:modu_3_dart_study/20250625/emploee.dart';

class Department {
  final String _name;
  final Employee _leader;

  String get name => _name;
  Employee get leader => _leader;

  Department(String name, Employee leader) : _name = name, _leader = leader;

  // 역직렬화
  Department.fromJson(Map<String, dynamic> json) :
        _name = json['name'],
        _leader = Employee.fromJson(json['leader']);

  // 직렬화
  Map<String, dynamic> toJson() {
    return {
      'name' : _name,
      'leader' : _leader.toJson()
    };
  }
}
import 'package:modu_3_dart_study/assignments/company/employee.dart';

class Department {
  final String name;
  final Employee leader;

  Department({
    required this.name,
    required this.leader,
  });

  Department.fromJson(Map<String, dynamic> json)
    : name = json['name'],
      leader = Employee.fromJson(json['leader']);

  Map<String, dynamic> toJson() {
    return {"name": name, "leader": leader.toJson()};
  }
}

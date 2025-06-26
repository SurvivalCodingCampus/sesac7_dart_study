import 'dart:convert';
import 'dart:io';

class Employee {
  String name;
  int age;

  Employee(this.name, this.age);

  Map<String, dynamic> toJson() => {'name': name, 'age': age};

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(json['name'], json['age']);
  }
}

class Department {
  String name;
  Employee leader;

  Department(this.name, this.leader);

  Map<String, dynamic> toJson() => {'name': name, 'leader': leader.toJson()};

  factory Department.fromJson(Map<String, dynamic> json) {
    return Department(json['name'], Employee.fromJson(json['leader']));
  }
}

void main() {
  final person = Employee('hongildong', 41);
  final department = Department('총무부', person);

  final departmentJson = department.toJson();

  final jsonString = JsonEncoder.withIndent('  ').convert(departmentJson);

  final file = File('company.txt');
  file.writeAsStringSync(jsonString);

  final loadedString = file.readAsStringSync();
  final loadedJson = jsonDecode(loadedString) as Map<String, dynamic>;
  final loadedDepartment = Department.fromJson(loadedJson);

  print('부서명: ${loadedDepartment.name}');
  print(
    '부서장: ${loadedDepartment.leader.name} (${loadedDepartment.leader.age}세)',
  );
}

import 'dart:io';

import 'package:modu_3_dart_study/company/employee.dart';

class Department {
  String name;
  Employee leader;

  Department(this.name, this.leader);
  Department.fromJson(Map<String, dynamic> json): name = json['name'], leader = json['leader'];

  Map<String, dynamic> toJson() => {'name': name, 'leader': leader.toJson()};

  String toJsonString() => '''{"name": "$name", "leader": ${leader.toJsonString()}}''';

  static void saveCompanyText(Department department) {
    final File companyText = File('lib/company/company.txt');

    if (!companyText.existsSync()) {
      companyText.createSync();
    }

    companyText.writeAsStringSync(department.toJsonString());
  }
}

void main() {
  Employee testEmployee = Employee('홍길동', 41);
  Department testDepartment = Department('총무부', testEmployee);

  Department.saveCompanyText(testDepartment);
}
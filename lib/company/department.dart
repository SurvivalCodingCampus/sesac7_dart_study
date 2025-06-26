import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/company/employee.dart';

class Department {
  String name;
  Employee leader;

  Department(this.name, this.leader);
  Department.fromJson(Map<String, dynamic> json): name = json['name'], leader = Employee.fromJson(json['leader']);

  Map<String, dynamic> toJson() => {'name': name, 'leader': leader.toJson()};

  String toJsonString() => jsonEncode(toJson());

  static void saveCompanyText(Department department) {
    final File companyText = File('lib/company/company.txt');

    if (!companyText.existsSync()) {
      companyText.createSync();
    }

    companyText.writeAsStringSync(department.toJsonString());
  }
}
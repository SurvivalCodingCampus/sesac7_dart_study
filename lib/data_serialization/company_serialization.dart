import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/data_serialization/department.dart';
import 'package:modu_3_dart_study/data_serialization/employee.dart';

void main() {
  final Employee employee = Employee(name: '홍길동', age: 41);
  final Department department = Department(name: '총무부', leader: employee);
  final file = File('company.txt');

  final Map<String, dynamic> resultMap = department.toJson();
  final String resultString = jsonEncode(resultMap);

  file.writeAsStringSync(resultString);
}

import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/data_serialization/department.dart';
import 'package:modu_3_dart_study/data_serialization/employee.dart';

void main() {
  final Employee employee = Employee('홍길동', 41);
  final Department department = Department('총무부', employee);
  final file = File('company.txt');

  final Map<String, dynamic> resultMap = department.toJson();
  final String resultString = jsonEncode(resultMap);

  file.writeAsStringSync(resultString);
}

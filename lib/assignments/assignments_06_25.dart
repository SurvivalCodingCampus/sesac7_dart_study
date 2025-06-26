import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/assignments/company/department.dart';
import 'package:modu_3_dart_study/assignments/company/employee.dart';

void main() {
  // try catch 연습문제
  final numString = '10.5';
  int num = 0;

  try {
    num = int.parse(numString);
  } catch (e) {
    num = 0;
  }

  print(num);

  // fromJson, toJson 연습문제
  final employee = Employee(name: '홍길동', age: 41);
  final department = Department(name: '총무부', leader: employee);

  try {
    final json = department.toJson();
    print('json: $json');
    final jsonString = jsonEncode(json);
    print('jsonString: $jsonString');

    final file = File('assets/company.txt');
    final assetsDirectory = Directory('assets');
    if (!assetsDirectory.existsSync()) {
      assetsDirectory.createSync();
    }
    file.writeAsStringSync(jsonString);
    final readJsonString = file.readAsStringSync();
    print('readJsonString: $readJsonString');
    final Map<String, dynamic> readJson = jsonDecode(readJsonString);
    print('readJson: $readJson');

    final readDepartment = Department.fromJson(readJson);
    print(readDepartment);
  } catch (e) {
    print(e);
  }
}

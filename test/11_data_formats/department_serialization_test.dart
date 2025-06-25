import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/11_data_formats/department.dart';
import 'package:modu_3_dart_study/11_data_formats/employee.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('Department 직렬화 / 역직렬화 테스트', () {
    final String name = '홍길동';
    final String departmentName = '총무부';
    final int age = 41;
    final employee = Employee(name: name, age: age);
    final department = Department(name: departmentName, leader: employee);
    final String departmentStringJson =
        '''{"name":"총무부","leader":{"name":"홍길동","age":41}}''';
    final file = File('company.txt');

    test('Department 직렬화 테스트', () {
      Map<String, dynamic> departmentJson = department.toJson();
      final String testDepartmentStringJson = jsonEncode(departmentJson);

      file.writeAsStringSync(testDepartmentStringJson);

      final testStringJson = file.readAsStringSync();

      expect(testStringJson == departmentStringJson, equals(true));
    });

    test('Department 역직렬화 테스트', () {
      final testStringJson = file.readAsStringSync();
      final testDepartment = Department.fromJson(jsonDecode(testStringJson));

      expect(testStringJson == departmentStringJson, equals(true));

      expect(testDepartment.name == departmentName, equals(true));
      expect(testDepartment.leader.name == name, equals(true));
      expect(testDepartment.leader.age == age, equals(true));
    });

    tearDownAll(() {
      if (file.existsSync()) file.deleteSync();
    });
  });
}

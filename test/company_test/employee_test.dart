import 'dart:convert';

import 'package:modu_3_dart_study/company/employee.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('EmployeeClassTest', () {
    test('Employee 클래스 생성자 테스트', () {
      final String testEmployeeName = '박기택';
      final int testEmployeeAge = 28;
      final Employee testEmployee = Employee(testEmployeeName, testEmployeeAge);

      expect(testEmployee.name, equals(testEmployeeName));
      expect(testEmployee.age, equals(testEmployeeAge));
    });

    test('Employee 클래스 Json String 형태를 객체로 직렬화 toJson 메서드 직렬화 검증', () {
      final String testEmployeeName = '박기택';
      final int testEmployeeAge = 28;
      final Employee testEmployee = Employee(testEmployeeName, testEmployeeAge);
      final Map<String, dynamic> toJsonEmployee = testEmployee.toJson();
      final Map<String, dynamic> jsonDecodeEmployee = jsonDecode(
        testEmployee.toJsonString(),
      );

      expect(toJsonEmployee, equals(jsonDecodeEmployee));
    });

    test('Employee 클래스 fromJson 역직렬화 검증', () {
      final String testEmployeeName = '박기택';
      final int testEmployeeAge = 28;
      final Employee testEmployee = Employee(testEmployeeName, testEmployeeAge);
      final Employee deSerializeEmployee = Employee.fromJson(testEmployee.toJson());

      expect(testEmployee.name, equals(deSerializeEmployee.name));
      expect(testEmployee.age, equals(deSerializeEmployee.age));
    });
  });
}

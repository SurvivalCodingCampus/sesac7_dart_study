import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/company/department.dart';
import 'package:modu_3_dart_study/company/employee.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('DepartmentClassTest', () {
    test('Department 클래스 생성자 테스트', () {
      final String testDepartmentName = '총무부';
      final Employee testDepartmentEmployee = Employee('박기택', 28);
      final Department testDepartment = Department(testDepartmentName, testDepartmentEmployee);

      expect(testDepartment.name, equals(testDepartmentName));
      expect(testDepartment.leader, equals(testDepartmentEmployee));
    });

    test('Department 클래스 Json String 형태를 객체로 직렬화 toJson 메서드 직렬화 검증', () {
      final String testDepartmentName = '총무부';
      final Employee testDepartmentEmployee = Employee('박기택', 28);
      final Department testDepartment = Department(testDepartmentName, testDepartmentEmployee);
      final Map<String, dynamic> toJsonDepartment = testDepartment.toJson();
      final Map<String, dynamic> jsonDecodeEmployee = jsonDecode(testDepartment.toJsonString());

      expect(toJsonDepartment, equals(jsonDecodeEmployee));
    });

    test('Department 클래스 fromJson 역직렬화 검증', () {
      final String testDepartmentName = '총무부';
      final Employee testDepartmentEmployee = Employee('박기택', 28);
      final Department testDepartment = Department(testDepartmentName, testDepartmentEmployee);
      final Department deSerializeDepartment = Department.fromJson(testDepartment.toJson());

      expect(testDepartment.name, equals(deSerializeDepartment.name));
      expect(testDepartment.leader.name, equals(deSerializeDepartment.leader.name));
      expect(testDepartment.leader.age, equals(deSerializeDepartment.leader.age));
    });

    group('Deartment 클래스 saveCompanyText 메서드 테스트', () {
      test('saveCompanyText 메서드 파일 생성 테스트', () {
        final String testDepartmentName = '총무부';
        final Employee testDepartmentEmployee = Employee('박기택', 28);
        final Department testDepartment = Department(testDepartmentName, testDepartmentEmployee);
        final File testCompanyText = File('lib/company/company.txt');
        
        if (testCompanyText.existsSync()) {
          testCompanyText.deleteSync();
        }
        
        Department.saveCompanyText(testDepartment);

        expect(testCompanyText.existsSync(), isTrue);
      });

      test('saveCompanyText 메서드 파일 내용 Department JsonString 검증 테스트', () {
        final String testDepartmentName = '총무부';
        final Employee testDepartmentEmployee = Employee('박기택', 28);
        final Department testDepartment = Department(testDepartmentName, testDepartmentEmployee);

        final File testCompanyText = File('lib/company/company.txt');

        if (testCompanyText.existsSync()) {
          testCompanyText.deleteSync();
        }
        
        Department.saveCompanyText(testDepartment);
        
        final String testCompanyTextContent = testCompanyText.readAsStringSync();
        final String testDepartmentJsonString = testDepartment.toJsonString();
        
        expect(testCompanyTextContent, equals(testDepartmentJsonString));
      });
    });
  });
}
import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/assignments/company/department.dart';
import 'package:modu_3_dart_study/assignments/company/employee.dart';
import 'package:test/test.dart';

void main() {
  const String departmentName = '총무부';
  const String employeeName = '홍길동';
  const int employeeAge = 41;
  const String filePath = 'assets/department.json';
  const String sampleJsonString =
      '{"name":"총무부","leader":{"name":"홍길동","age":41}}';

  late Department department;

  setUp(() {
    department = Department(
      name: departmentName,
      leader: Employee(
        name: employeeName,
        age: employeeAge,
      ),
    );
  });

  group('constructor', () {
    test('When create a Department, name and leader are given values.', () {
      // given
      // when

      // then
      expect(department.name, departmentName);
      expect(department.leader.name, employeeName);
      expect(department.leader.age, employeeAge);
    });
  });

  group('toJson', () {
    test(
      'If toJson works correctly, the jsonString is the same as the sampleJsonString.',
      () {
        // given

        // when
        final json = department.toJson();
        final jsonString = jsonEncode(json);

        // then
        expect(jsonString, sampleJsonString);
      },
    );
  });

  group('fromJson', () {
    test('If the json file is correct, fromJson should also work fine.', () {
      // given
      final file = File(filePath);
      final jsonString = file.readAsStringSync();
      final json = jsonDecode(jsonString);

      // when
      final department = Department.fromJson(json);

      // then
      expect(department.name, departmentName);
      expect(department.leader.name, employeeName);
      expect(department.leader.age, employeeAge);
    });

    test(
      'If age in json is a String and age in Employee is an int, fromString throws a TypeError.',
      () {
        // given
        final wrongJsonString =
            '{"name":"총무부","leader":{"name":"홍길동","age":"41"}}';
        final json = jsonDecode(wrongJsonString);

        // when
        // then
        expect(() => Department.fromJson(json), throwsA(isA<TypeError>()));
      },
    );
  });
}

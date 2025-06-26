import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/assignments/company/employee.dart';
import 'package:test/test.dart';

void main() {
  const String name = '홍길동';
  const int age = 41;
  const String filePath = 'assets/employee.json';
  const String sampleJsonString = '{"name":"홍길동","age":41}';

  late Employee employee;

  setUp(() {
    employee = Employee(name: name, age: age);
  });

  group('constructor', () {
    test('When create an Employee, name and age are given values.', () {
      // given
      // when

      // then
      expect(employee.name, name);
      expect(employee.age, age);
    });
  });

  group('toJson', () {
    test(
      'If toJson works correctly, the jsonString is the same as the sampleJsonString.',
      () {
        // given

        // when
        final json = employee.toJson();
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
      final employee = Employee.fromJson(json);

      // then
      expect(employee.name, name);
      expect(employee.age, age);
    });

    test(
      'If age in json is a String and age in Employee is an int, fromString throws a TypeError.',
      () {
        // given
        final wrongJsonString = '{"name":"홍길동","age":"41"}';
        final json = jsonDecode(wrongJsonString);

        // when
        // then
        expect(() => Employee.fromJson(json), throwsA(isA<TypeError>()));
      },
    );
  });
}

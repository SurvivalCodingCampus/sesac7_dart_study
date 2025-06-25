import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/assignments/employee.dart';
import 'package:test/test.dart';

void main() {
  final sampleEmployee = Employee('홍길동', 41);
  final sampleDepartment = Department('총무부', sampleEmployee);
  final sampleJson = {
    'name': '총무부',
    'leader': {'name': '홍길동', 'age': 41},
  };

  group('직렬화, 역직렬화 테스트', () {
    test('Map 변환 테스트', () {
      final resultJson = sampleDepartment.toJson();
      expect(resultJson, equals(sampleJson));
    });

    test('객체 변환 테스트', () {
      final resultDepartment = Department.fromJson(sampleJson);
      expect(resultDepartment.name, '총무부');
      expect(resultDepartment.leader.name, '홍길동');
      expect(resultDepartment.leader.age, 41);
    });
  });

  group('파일 저장 및 복원 테스트', () {
    Directory? tempDirectory;
    File? testFile;

    setUp(() {
      tempDirectory = Directory.systemTemp.createTempSync(
        'serialization_test_',
      );
      testFile = File('${tempDirectory!.path}/company.txt');
    });

    tearDown(() {
      tempDirectory?.deleteSync(recursive: true);
    });

    test('직렬화 후 역 직렬화', () {
      final jsonString = jsonEncode(sampleDepartment.toJson());

      testFile!.writeAsStringSync(jsonString);
      final readString = testFile!.readAsStringSync();

      expect(readString, equals(jsonString));

      final restoredDepartment = Department.fromJson(jsonDecode(readString));
      expect(restoredDepartment.name, sampleDepartment.name);
      expect(restoredDepartment.leader.name, sampleDepartment.leader.name);
      expect(restoredDepartment.leader.age, sampleDepartment.leader.age);
    });
  });
}

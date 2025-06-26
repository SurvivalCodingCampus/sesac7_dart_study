import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/250625/department.dart';
import 'package:modu_3_dart_study/250625/employee.dart';
import 'package:test/test.dart';

void main() {
  group('department 직렬화테스트', () {
    setUp(() {
      //테스트 디렉토리 확인 및 생성
      final assetDir = Directory('asset');
      if (!assetDir.existsSync()) {
        assetDir.createSync(recursive: true);

        //파일이 있으면 삭제
        final file = File('asset/company.txt');
        if (file.existsSync()) {
          file.deleteSync();
        }
      }
    });

    test('Department json 쓰기테스트', () {
      //파일에 json쓰기
      final file = File('asset/company.txt');

      final department = Department(
        'dev2',
        Employee('sujin', 45),
      );

      file.writeAsStringSync(jsonEncode(department.toJson()));
    });

    test('Department json 읽기테스트', () {
      //txt 파일읽어서, 인스탄스의 Json과 비교
      final file = File('asset/company.txt');
      final json = jsonDecode(file.readAsStringSync());
      final departmentFromJson = Department.fromJson(json);

      final department = Department(
        'dev2',
        Employee('sujin', 45),
      );

      expect(departmentFromJson == department, isTrue);
    });
  });
}

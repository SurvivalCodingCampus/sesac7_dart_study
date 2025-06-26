import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/20250625/department.dart';
import 'package:modu_3_dart_study/20250625/emploee.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('20250625 여러가지 데이터 형식 테스트', ()
  {
    late File departmentFile;
    tearDownAll((){
      departmentFile.deleteSync();
    });

    setUp((){
      departmentFile = File('department.txt');
    });

    test('직렬화 및 파일저장 테스트', () {
      final leader = Employee('홍길동', 41);
      final department = Department('총무부', leader);

      final departmentJson = department.toJson();
      String departmentJsonString = jsonEncode(departmentJson);

      //File departmentFile = File('department.txt');
      departmentFile.writeAsStringSync(departmentJsonString);

      expect(departmentFile.existsSync() , isTrue);

    });

    test('파일에서 읽어와서 역직렬화 테스트', () {
      //File departmentFile = File('department.txt');
      String departmentJsonString = departmentFile.readAsStringSync();
      final Map<String, dynamic> departmentMap = jsonDecode(departmentJsonString);
      final department = Department.fromJson(departmentMap);

      expect(department.name , '총무부');
      expect(department.leader.name , '홍길동');
      expect(department.leader.age , 41);
    });
  });
}
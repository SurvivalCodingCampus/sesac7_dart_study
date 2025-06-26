import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/11_serialization/exam/exam.dart';
import 'package:test/test.dart';

void main() {
  final file = File('company.txt');

  final department = Department(
    '총무부',
    Employee('홍길동', 41),
  );

  // 테스트 끝날 때 마다 실행
  tearDown(() {
    if (file.existsSync()) {
      file.deleteSync();
    }
  });

  test('저장', () {
    file.writeAsStringSync(jsonEncode(department.toJson()));

    Department target = Department.fromJson(
      jsonDecode(file.readAsStringSync()),
    );

    expect(department, equals(target));
  });

  test('직렬화', () {
    final expected = {
      'name': '총무부',
      'leader': {
        'name': '홍길동',
        'age': 41,
      },
    };

    expect(department.toJson(), equals(expected));
  });

  test('역직렬화', () {
    final expected = {
      'name': '총무부',
      'leader': {
        'name': '홍길동',
        'age': 41,
      },
    };
    final Department department = Department.fromJson(expected);

    expect(department.name, '총무부');
    expect(department.leader.name, '홍길동');
    expect(department.leader.age, 41);
  });
}

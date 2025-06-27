import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/lecture_code/exception/variousdataformat.dart';
import 'package:test/test.dart';

void main() {
  test('직렬화 역직렬화 확인 test', () {
    //given(준비)
    //총무부 리더 ‘홍길동(41세)’의 인스턴스를 생성
    final String name = '홍길동';
    final String name2 = '총무부';
    final int age = 41;

    Employee employee = Employee(name: name, age: age);
    Department department = Department(name: name2, leader: employee);
    SaveCompanyText saveCompanyText = SaveCompanyText();

    //when(실행)
    saveCompanyText.saveJson(department); // 직력화 된 json company.txt 저장

    final companyFile = File(companyPath); // 파일
    String text = companyFile.readAsStringSync(); // 파일 읽기
    Map<String, dynamic> dejson = jsonDecode(text); // JsonString -> Map
    Department dejson2 = Department.fromJson(dejson); // Map -> 객체

    //then(검증)
    expect(dejson2.name, department.name);
    expect(dejson2.leader.name, employee.name);
    expect(dejson2.leader.age, 41);

    expect(dejson['name'], department.name);
    expect(dejson['leader']['name'], employee.name);
    expect(dejson['leader']['age'], 41);
  });
}

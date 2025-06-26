import 'dart:convert';
import 'dart:io';

class Employee {
  String name;
  int age;

  Employee({required this.name, required this.age});

  @override
  String toString() => 'Employee(name: $name, age: $age)';

  // copyWith 해서 동등성 비교 추가하기
  // @override 
  // Employee copyWith(){

  // }

  // 직렬화, 직렬화를 위해 클래스 일부를 수정
  Map<String, dynamic> toJson() {
    return {'name': name, 'age': age};
  }

  // 역직렬화를 위해서 파싱
  Employee.fromJson(Map<String, dynamic> json) 
    : name = json['name'],
    age = json['age'];
}

class Department {
  String name;
  Employee leader;

  Department({required this.name, required this.leader});

  @override
  String toString() => 'Department(name: $name, leader: $leader)';

  // 직렬화, 직렬화를 위해 클래스 일부를 수정
  Map<String, dynamic> toJson() {
    return {'name': name, 'leader': leader.toJson()};
  }

  // 역직렬화를 위해서 파싱
  Department.fromJson(Map<String, dynamic> json) 
    : name = json['name'],
    leader = Employee.fromJson(json['leader']); // 이니셜라이즈 리스트
}

String saveFile (Department dept, String filePath) {

  // 객체 -> Map
  final Map<String, dynamic> json = dept.toJson();

  // Map -> String
  String jsonString = jsonEncode(json);

  // company.txt 파일에 저장
  final companyFile = File(filePath); // 열기
  final newCompanyFile = companyFile.writeAsStringSync(jsonString, mode: FileMode.write);

  return jsonString;
}

void main () {}

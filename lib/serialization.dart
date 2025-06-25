import 'dart:convert';
import 'dart:io';

void main() {
  // 객체 생성
  Employee HongGilDong = Employee('홍길동', 41);
  // 파일 열기
  final file = File('employees.txt');
  // 파일에 쓸 String 준비
  final String jsonString = jsonEncode(HongGilDong.toJson());
  // 파일에 쓰기
  file.writeAsStringSync(jsonString);

  // 파일 읽고 String에서 Map으로 변환
  Map<String, dynamic> decodedJson = jsonDecode(file.readAsStringSync());
  // Map에서 객체로 변환
  Employee restoredHongGilDong = Employee.fromJson(decodedJson);
  print(restoredHongGilDong);

  // ---------------------
  // 객체 생성
  Department chongMuBuHongGilDong = Department('총무부', Employee('홍길동', 41));
  // 파일 열기
  final companyFile = File('company.txt');
  // 파일에 쓸 String 준비
  final String companyJsonString = jsonEncode(chongMuBuHongGilDong.toJson());
  // 파일에 쓰기
  companyFile.writeAsStringSync(companyJsonString);

  // 파일 읽고 String에서 Map으로 변환
  Map<String, dynamic> companyDecodedJson = jsonDecode(
    companyFile.readAsStringSync(),
  );
  // Map에서 객체로 변환
  Department restoredChongMuBuHongGilDong = Department.fromJson(
    companyDecodedJson,
  );
  print(restoredChongMuBuHongGilDong);
}

class Employee {
  String name;
  int age;

  Employee(this.name, this.age);

  Employee.fromJson(Map<String, dynamic> json)
    : name = json['name'],
      age = json['age'];

  Map<String, dynamic> toJson() {
    return {'name': name, 'age': age};
  }

  @override
  String toString() {
    return 'employee name: $name, employee age: $age';
  }
}

class Department {
  String name;
  Employee leader;

  Department(this.name, this.leader);

  Department.fromJson(Map<String, dynamic> json)
    : name = json['name'],
      leader = Employee.fromJson(json['leader']);

  Map<String, dynamic> toJson() {
    return {'name': name, 'leader': leader.toJson()};
  }

  @override
  String toString() {
    return 'department name: $name, leader name: ${leader.name}';
  }
}

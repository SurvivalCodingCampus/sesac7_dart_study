/*
다음과 같은 사원 클래스와 부서 클래스가 있습니다.
총무부 리더 ‘홍길동(41세)’의 인스턴스를 생성하고 직렬화하여 company.txt 파일에 저장하는 프로그램을 작성하시오.
직렬화를 위해 위의 2개 클래스를 일부 수정하시오.
*/

import 'dart:convert';
import 'dart:io';

const String companyPath = 'asset/company.txt';

class Employee {
  String name;
  int age;

  Employee({required this.name, required this.age});

  // Json으로 직렬화
  Map<String, dynamic> toJson() {
    return {'name': name, 'age': age};
  }

  // Json으로 역직렬화
  Employee.fromJson(Map<String, dynamic> json)
    : name = json['name'],
      age = json['age'];
}

class Department {
  String name;
  Employee leader;

  Department({required this.name, required this.leader});

  // Json으로 직렬화
  Map<String, dynamic> toJson() {
    return {'name': name, 'leader': leader.toJson()}; // 객체 -> Map(Json)
  }

  // Json으로 역직렬화
  Department.fromJson(Map<String, dynamic> json)
    : name = json['name'],
      leader = Employee.fromJson(json['leader']) ; // Map -> 객체
}

class SaveCompanyText {
  void saveJson(Department department) {

    // 객체 -> Map(Json)
    Map<String, dynamic> json = department.toJson();

    // Map(Json) -> String
    String jsdonString = jsonEncode(json);

    // 파일 읽기
    final companyFile = File(companyPath);

    // 파일 쓰기
    companyFile.writeAsStringSync(jsdonString);
  }
}

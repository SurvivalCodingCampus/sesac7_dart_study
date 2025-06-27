import 'dart:convert';
import 'dart:io';
import 'package:test/test.dart';
import 'package:modu_3_dart_study/employee.dart';

void main () {

  // 총무부 리더, 홍길동, 41세 의 인스턴스를 생성
  final person = Employee(name: '홍길동', age: 41);
  final team = Department(name: '총무부', leader: person);

  // final department = Department(name: '총무부', leader: Employee(name: '홍길동', age: 41));

  final filePath = 'lib/company.txt';

  final result = saveFile(team, filePath);

  test('company.txt 파일안에 작성된 내용은 직렬화한 내용과 동일하다', (){
    // expect(result == File(filePath).readAsStringSync(), isTrue);

    try {
      final fileContent = File(filePath).readAsStringSync();
      expect(fileContent, equals(result));
    } catch (e) {
        fail('파일 읽기 실패: $e');
    }
  });

  // 역직렬화를 활용해서 테스트
  test('company.txt 에서 제공받은 json string 값을 역직렬화 한 값은 생성한 인스턴스의 값과 같다',(){

    try {
      // 받은 값
      final String orginString = File(filePath).readAsStringSync();

      // JSON String -> Map
      final Map<String, dynamic> json = jsonDecode(orginString);

      // Map -> 객체
      final Department dept = Department.fromJson(json);

      expect(team.name, equals(dept.name)); 
      expect(team.leader.name, equals(dept.leader.name)); 
      expect(team.leader.age, equals(dept.leader.age,));

    } on FileSystemException catch (e) {
      // FileSystemException: 파일시스템 관련 오류 발생시 사용하는 예외 클래스
      fail('파일 시스템 오류: $e');
    } on FormatException catch (e) { 
      fail('JSON 파싱 오류: $e');
    } catch (e) {
      fail('예상하지 못한 오류: $e');
    }
     
  });

  tearDown((){
    // 테스트 끝날때 마다 샐행
    final file = File(filePath);

    if(file.existsSync()) {
      file.deleteSync();
    }
  });
}
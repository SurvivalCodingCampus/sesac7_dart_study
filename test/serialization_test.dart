import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/serialization.dart';
import 'package:test/test.dart';

void main() {
  test('직렬화 테스트', () {
    // given
    Employee hongGilDong = Employee('홍길동', 41);
    Department chongMuBuHongGilDong = Department('총무부', hongGilDong);

    // when
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

    // then
    expect(restoredChongMuBuHongGilDong.name, '총무부');
    expect(restoredChongMuBuHongGilDong.leader.name, '홍길동');
    expect(restoredChongMuBuHongGilDong.leader.age, 41);
  });
}

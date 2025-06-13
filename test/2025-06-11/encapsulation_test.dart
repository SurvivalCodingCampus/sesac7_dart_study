import 'package:test/test.dart';
import 'package:modu_3_dart_study/2025-06-11/encapsulation.dart';

void main(){
  test('이름 글자수 테스트: 이름이 너무 짧으면 예외처리', (){
    // final person01 = Person(inputName: '');
    // 생성자를 미리 생성해버리면 생성되는 시점에 예외처리 되서 person01 이 없음
    expect(() => Person(inputName: '', inputAge: 20) , throwsException);
  });

  test('이름 글자수 테스트: 이름이 너무 길면 예외처리', (){
    expect(() => Person(inputName: '이름이너무길면예외처리', inputAge: 20) , throwsException);
  });
}
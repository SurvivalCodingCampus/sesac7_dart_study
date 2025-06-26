import 'dart:math';

import 'package:modu_3_dart_study/exception.dart';
import 'package:test/test.dart';

void main() {
  test('입력한 값이 int인 경우 num에 입력한 값이 출력된다',(){

    // random 한 int 만들기
    int randomInt = Random().nextInt(100);
    final result = checkNum('$randomInt');

    expect(result, randomInt);
  });

  test('입력한 값이 double 인 경우 num에 입력한 값은 0이 출력된다',(){

    // random 한 double 만들기
    double randomInt = Random().nextDouble();
    final result = checkNum('$randomInt');
    expect(result, 0);
  });

  test('입력한 값이 int가 아닌 경우 num에 입력한 값은 0이 출력된다',(){
    // random 한 text
    String randomText = 'abc';
    final result = checkNum(randomText);
    expect(result, 0);
  });
}
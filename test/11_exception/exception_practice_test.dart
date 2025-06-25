import 'package:modu_3_dart_study/11_exception/exception_practice.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  test('예외 처리 연습문제 테스트', () {
    final practice = ExceptionPractice();

    practice.run();

    expect(practice.num == 0, equals(true));
    expect(practice.num == 10.5, equals(false));
  });
}


import 'package:modu_3_dart_study/lecture_code/exception/exception.dart';
import 'package:test/test.dart';

void main() {
  test('예외처리 Test', () {
    //given(준비)
    CheckError checkError = CheckError();

    //when(실행)
    checkError.checkIntParseError();

    //then(검증)
    expect(checkError.num, 0);
    expect(checkError.checkIntParseError1().runtimeType, FormatException);

  });
}

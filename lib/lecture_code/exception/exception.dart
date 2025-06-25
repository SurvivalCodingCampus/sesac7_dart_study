// 연습 1. 다음과 같은 코드를 작성, 실행 후 runtime error 를 발생하시오
// 연습 2. 연습 1 에서 작성한 코드를 수정하여, try-catch() 문을 사용하여 예외처리를 하시오. 예외처리에는 다음의 처리를 수행하시오.
// 예외가 발생하면 0으로 처리

class CheckError {
  final numString = '10.5';
  int num = 0;
  int num1 = 0;

  void checkIntParseError() {
    try {
      num = int.parse(numString);
    } on FormatException {
      print('FormatException 발생');
      num = 0;
    }
    print(num);
  }

  // exception 반환후 확인
  Object? checkIntParseError1() {
    try {
      num1 = int.parse(numString);
    } catch (e) {
      return e;
    }
    return null;
  }

}

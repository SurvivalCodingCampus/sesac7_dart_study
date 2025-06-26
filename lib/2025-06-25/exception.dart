void main(List<String> arguments) {
  try {
    someError2();
  } catch (e) {
    print('main에서 catch');
  }
}

void someError2() {
  try {
    someError();
  } catch (e) {
    rethrow; 
    // rethrow 로 에러 처리를 미룸
    // rethrow: 명시적으로 필요할때 쓰지만 Dart 에서는 자동적으로 상위 메서드로 올라와서 터지게 되어있다
  }
}

void someError(){
  // 뭔가를 하는 코드
  throw FormatException('에러가 발생했습니다');
}

// 최종적으로 결과는 main에서 catch 가 출력됨
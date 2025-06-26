void exception1() {
  final numString = '10.5';

  int num;
  try {
    num = int.parse(numString);
  } on FormatException {
    print('숫자 형식이 올바르지 않습니다: $numString');
    num = 0;
  } catch (e) {
    print('예상치 못한 오류가 발생했습니다: $e');
    num = 0;
  }

  print(num);
}

void main() {
  exception1();
}
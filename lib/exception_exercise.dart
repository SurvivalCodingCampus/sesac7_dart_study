void main() {
  final doubleString = '10.5';
  int num;

  try {
    num = int.parse(doubleString);
  } catch (e) {
    num = 0;
    print('예외처리: int.parse 함수의 인자로 interger 타입이 아닌 인자가 들어와서 $num 으로 처리하였음.');
  }
}

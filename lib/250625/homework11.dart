void main() {
  final numString = '10.5';
  int num;
  try {
    num = intParse(numString: numString);
  } catch (e) {
    print(e);
    num = 0;
  }

  print(num);
}

int intParse({required String numString}) {
  try {
    return int.parse(numString);
  } catch (e) {
    throw Exception('파싱 실패!');
  }
}

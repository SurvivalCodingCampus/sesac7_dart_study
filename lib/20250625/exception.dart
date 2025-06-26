void main() {
  final numString = '10.5';
  final num = exceptionProcess(numString);
  print(num);
}

int exceptionProcess(String numString) {
  try {
    return int.parse(numString);
  } catch (e) {
    print('error : $e');
    return 0;
  }
}
void exception1() {
  final numString = '10.5';

  int num;
  try {
    num = int.parse(numString);
  } catch (e) {
    num = 0;
  }

  print(num);
}

void main() {
  exception1();
}
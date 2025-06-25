void main() {
  final numString = '10.5';

  try {
    int num = int.parse(numString);
    print(num);
  } catch (e) {
    int num = 0;
    print(num);
  }
}

class ExceptionPractice {
  final numString = '10.5';
  int num = 0;

  void run() {
    try {
      num = int.parse(numString);
      print(num);
    } catch (e) {
      print(num = 0);
    }
  }
}

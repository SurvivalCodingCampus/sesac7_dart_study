void main() {
  String name = '홍길동';  // 1

  name = '한석봉'; // 2

  name = '$name님';  // 3

  Stopwatch stopwatch = Stopwatch();
  stopwatch.start();

  int num = 0;

  // StringBuffer buffer = StringBuffer(name);
  for(int i = 0; i < 1000000; i++) {
    name = '$name님';  // 3
    // buffer.write('님');
    // buffer.write('님');
    // num = num + i;
  }

  print(stopwatch.elapsed);

}
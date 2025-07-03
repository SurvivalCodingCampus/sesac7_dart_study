Future<void> bird1(Stopwatch stopwatch) async {
  for (int i = 0; i < 4; i++) {
    print('꾸우: ${stopwatch.elapsed}');
    if (i != 3) {
      await Future.delayed(Duration(seconds: 1));
    }
  }
}

Future<void> bird2(Stopwatch stopwatch) async {
  for (int i = 0; i < 4; i++) {
    print('까악: ${stopwatch.elapsed}');
    if (i != 3) {
      await Future.delayed(Duration(seconds: 2));
    }
  }
}

Future<void> bird3(Stopwatch stopwatch) async {
  for (int i = 0; i < 4; i++) {
    print('짹짹: ${stopwatch.elapsed}');
    if (i != 3) {
      await Future.delayed(Duration(seconds: 3));
    }
  }
}

Future<void> bird({
  String sound = '',
  int delaySeconds = 1,
  Stopwatch? stopwatch,
}) async {
  if (stopwatch is Null) stopwatch = Stopwatch()..start();

  for (int i = 0; i < 4; i++) {
    print('$sound: ${stopwatch.elapsed}');
    if (i != 3) {
      await Future.delayed(Duration(seconds: delaySeconds));
    }
  }
}

void main() async {
  // final futures = <Future<void>>[];
  // futures.add(bird1());
  // futures.add(bird2());
  // futures.add(bird3());
  final stopwatch = Stopwatch()..start();

  List<Future<void>> futures = [
    bird1(stopwatch),
    bird2(stopwatch),
    bird3(stopwatch),
  ];

  await Future.wait(futures);
  print(stopwatch.elapsed);
}

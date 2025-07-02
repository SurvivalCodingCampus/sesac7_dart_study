Future<void> firstBird() async {
  for (int i = 0; i < 4; i++) {
    await Future.delayed(Duration(seconds: 1));

    print('꾸우');
  }
}

Future<void> secondBird() async {
  for (int i = 0; i < 4; i++) {
    await Future.delayed(Duration(seconds: 2));

    print('까악');
  }
}

Future<void> thirdBird() async {
  for (int i = 0; i < 4; i++) {
    await Future.delayed(Duration(seconds: 3));

    print('짹짹');
  }
}

void main() async {
  await Future.wait([firstBird(), secondBird(), thirdBird()]);
}

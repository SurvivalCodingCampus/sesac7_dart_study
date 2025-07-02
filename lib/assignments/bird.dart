void main() async {
  birdSound(
    name: '1번 새',
    sound: '꾸우',
    durationSeconds: 1,
  );
  birdSound(
    name: '2번 새',
    sound: '까악',
    durationSeconds: 2,
  );
  birdSound(
    name: '3번 새',
    sound: '짹짹',
    durationSeconds: 3,
  );
}

Future<void> birdSound({
  required String name,
  required String sound,
  required int durationSeconds,
}) async {
  for (int i = 0; i < 4; i++) {
    print('$name, $sound');
    await Future.delayed(Duration(seconds: durationSeconds));
  }
}

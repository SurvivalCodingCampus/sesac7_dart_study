Future<void> birdSound({
  required String sound,
  required int delaySeconds,
}) async {
  for (int i = 0; i < 4; i++) {
    await Future.delayed(Duration(seconds: delaySeconds));
    print('$sound!');
  }
}

void main() async {
  List<Future> futures = [
    birdSound(sound: '꾸우', delaySeconds: 1),
    birdSound(sound: '까악', delaySeconds: 2),
    birdSound(sound: '짹', delaySeconds: 3),
  ];

  await Future.wait(futures);
}

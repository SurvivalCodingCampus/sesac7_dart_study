Future<void> cryBird(int sec, String sound) async {
  for (int i = 0; i < 4; i++) {
    await Future.delayed(Duration(seconds: sec));
    print(sound);
  }
}

void main() {
  cryBird(1, '꾸우');
  cryBird(2, '까악');
  cryBird(3, '짹쨱');
}

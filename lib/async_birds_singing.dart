void main() async {
  final Bird birdKuwoo = Bird(
    singingSound: '꾸우',
    singingInterval: 1,
    numberOfSinging: 4,
  );
  final Bird birdKaak = Bird(
    singingSound: '까악',
    singingInterval: 2,
    numberOfSinging: 4,
  );
  final Bird birdJackJack = Bird(
    singingSound: '짹짹',
    singingInterval: 3,
    numberOfSinging: 4,
  );

  birdKuwoo.singing();
  birdKaak.singing();
  birdJackJack.singing();
}

class Bird {
  String singingSound;
  int singingInterval;
  int numberOfSinging;

  Bird({
    required this.singingSound,
    required this.singingInterval,
    required this.numberOfSinging,
  });

  void singing() async {
    print(singingSound);

    for (int i = 0; i < (numberOfSinging - 1); i++) {
      await Future.delayed(Duration(seconds: singingInterval));
      print(singingSound);
    }
  }
}

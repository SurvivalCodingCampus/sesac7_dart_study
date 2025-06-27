import 'package:intl/intl.dart';

void main() async {
  List<Future<void>> futures = [
    sound(Bird.firstBird),
    sound(Bird.secondBird),
    sound(Bird.thirdBird),
  ];

  await Future.wait(futures);
}

enum Bird {
  firstBird(1),
  secondBird(2),
  thirdBird(3);

  const Bird(this.value);

  final int value;
}

Future<void> sound(Bird bird) async {
  for (int i = 0; i<4; i++) {
    await Future.delayed(Duration(seconds: bird.value));
    String currentTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
    print('${birdSound(bird)} 시간 : $currentTime');
  }
}

String birdSound(Bird bird) {
  String birdSoundText;
  switch (bird) {
    case Bird.firstBird:
      birdSoundText = '꾸우';
    case Bird.secondBird:
      birdSoundText = '까악';
    case Bird.thirdBird:
      birdSoundText = '짹짹';
  }

  return birdSoundText;
}
import 'package:intl/intl.dart';

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
  switch (bird) {
    case Bird.firstBird:
      return '꾸우';
    case Bird.secondBird:
      return '까악';
    case Bird.thirdBird:
      return '짹짹';
  }
}

void main() async {
  List<Future<void>> futures = [
    sound(Bird.firstBird),
    sound(Bird.secondBird),
    sound(Bird.thirdBird),
  ];

  await Future.wait(futures);
}
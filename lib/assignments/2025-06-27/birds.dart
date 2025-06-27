import 'package:intl/intl.dart';

void birdchirp({required String sound, required int interval}) async {
  for (int i = 0; i < 4; i++) {
    if (i != 0) {
      await Future.delayed(Duration(seconds: interval));
    }
    final nowTime = DateFormat("HH:mm:ss").format(DateTime.now());
    print('$nowTime : $sound');
  }
}

void main() async {
  birdchirp(sound: "꾸우", interval: 1);
  birdchirp(sound: "까악", interval: 2);
  birdchirp(sound: "짹짹", interval: 3);
}

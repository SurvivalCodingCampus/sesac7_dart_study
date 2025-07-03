Future<dynamic> getSoundOne() async{

  for (int i = 0; i < 4; i ++) {
    await Future.delayed(Duration(seconds: 1));
    print('꾸우');
  }
}

Future<dynamic> getSoundTwo() async{

  for (int i = 0; i < 4; i ++) {
    await Future.delayed(Duration(seconds: 2));
    print('까악');
  }
}

Future<dynamic> getSoundThree() async{

  for (int i = 0; i < 4; i ++) {
    await Future.delayed(Duration(seconds: 3));
    print('짹짹');
  }
}

// 깔끔한 버전
Future<dynamic> cryBird(int sec, String sound) async{
  for (int i = 0; i < 4; i ++) {
    await Future.delayed(Duration(seconds: sec));
    print(sound);
  }
}


void main () async{
  
  // List<Future> futures = [getSoundOne(), getSoundTwo(), getSoundThree()];
  // List result = await Future.wait(futures);
  // 모든 과정을 기다렸다가 wait 결과를 모으는 함수

  cryBird(1, '꾸우');
  cryBird(2, '까악');
  cryBird(3, '짹짹');
}
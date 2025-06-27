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

void main () async{
  
  List<Future> futures = [getSoundOne(), getSoundTwo(), getSoundThree()];

  List result = await Future.wait(futures);
}
/*
매일 아침, 당신은 새소리에 잠에서 깹니다. 시간이 지나면서, 당신은 세 가지 독특한 새소리를 알아차렸고, 각각 다른 간격으로 반복되는 것을 발견했습니다.

한 새는 1초마다, 다른 새는 2초마다, 마지막 새는 3초마다 소리를 냅니다.

요구사항
각 새의 소리 타이밍을 재현하되, 각 새마다 하나의 비동기 함수를 사용하세요.
각 비동기 함수는 4번만 출력한 후 완료되어야 합니다.
첫 번째 새는 "꾸우" 소리를 냅니다.
두 번째 새는 "까악" 소리를 냅니다.
마지막 새는 "짹짹" 소리를 냅니다.
모든 새소리가 끝나면 프로그램이 종료되어야 합니다.
*/

enum Birds {
  birdNo1(repeatSecond: 1, sound: '꾸우'),
  birdNo2(repeatSecond: 2, sound: '까악'),
  birdNo3(repeatSecond: 3, sound: '짹짹');

  final int repeatSecond;
  final String sound;
  final int repeatLimitNum = 4;
  const Birds({required this.repeatSecond, required this.sound});

  Future<void> twitter() async{
    for(int i = 0 ; i< repeatLimitNum ; i++){
      await Future.delayed(Duration(seconds: repeatSecond));
      print('$sound , ${DateTime.now().second}');
    }
  }
}

Future<void> main() async {
  Stopwatch stopwatch = Stopwatch()..start();
  await Future.wait(Birds.values.map((b)=>b.twitter()));
  print(stopwatch.elapsed);
}

/*
const String birdNo1Sound = '꾸우';
const String birdNo2Sound = '까악';
const String birdNo3Sound = '짹짹';
const int repeatSecondBird1 = 1;
const int repeatSecondBird2 = 2;
const int repeatSecondBird3 = 3;


Future<void> bird1() async {
  for (var i = 0; i < 4; i++) {
    await Future.delayed(const Duration(seconds: repeatSecondBird1));
    print('$birdNo1Sound, ${DateTime.now().second}');
  }
}

Future<void> bird2() async {
  for (var i = 0; i < 4; i++) {
    await Future.delayed(const Duration(seconds: repeatSecondBird2));
    print('$birdNo2Sound, ${DateTime.now().second}');
  }
}

Future<void> bird3() async {
  for (var i = 0; i < 4; i++) {
    await Future.delayed(const Duration(seconds: repeatSecondBird3));
    print('$birdNo3Sound, ${DateTime.now().second}');
  }
}

Future<void> main() async{

  List<Future<void>> birdsList = [
    bird1(),bird2(),bird3(),
  ];

  Stopwatch stopwatch = Stopwatch()..start();
  await Future.wait(birdsList);
  print(stopwatch.elapsed);
}
*/
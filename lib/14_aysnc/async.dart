void main() async {
  List<int> items = [1, 2, 3];
  items.where((e) => e.isEven);

  // 3초
  Future<String> result = fetchDataAsyncTest(3);
  result.then((e) => print('이거!!!!!!!!!!!!!!'));
  fetchDataAsyncTest(1).then((e) => print(e));
  // fetchDataAsync(2).then((e) => print(e));

  // 6초
  String result1 = await fetchDataAsync(3);
  print(result1);
  String result2 = await fetchDataAsync(1);
  print(result2);
  String result3 = await fetchDataAsync(2);
  print(result3);

  String message = fetchData((e) => print(e));
  print(message);

  print('데이터 가져왔음');
}

Future<String> fetchDataAsyncTest(int sec) {
  return Future.delayed(Duration(seconds: sec), () => 'fetchDataAsyncTest :::: $sec초 후 데이터');
}

// 1
Future<String> fetchDataAsync(int sec) {
  return Future.delayed(Duration(seconds: sec), () => 'fetchDataAsync :::: $sec초 후 데이터');
}

// 2
Future<String> fetchDataAsyncAwait(int sec) async {
  // Future 함수가 끝나기를 기다린다
  await Future.delayed(Duration(seconds: sec));
  return '$sec초 후 데이터';
}

String fetchData(void Function(String) onSuccess) {

  onSuccess('처리 완료');
  return 'success';
}
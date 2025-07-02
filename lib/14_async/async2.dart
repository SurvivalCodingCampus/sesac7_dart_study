void main() async {
  List<Future<int>> futures = [
    getInt1(),
    getInt1(),
    getInt1(),
    getInt1(),
  ];

  List<int> results = await Future.wait(futures);
  print(results);
}

Future<int> getInt1() async {
  await Future.delayed(Duration(seconds: 3));
  print('getInt1');
  return 1;
}
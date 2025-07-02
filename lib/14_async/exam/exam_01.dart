void main() async {
  await something();
}

Future<void> something() async {
  await Future.delayed(Duration(seconds: 1));
  print('끝');
}
int parseStringToInt({required String numString}) {
  try {
    print('numString 타입 : ${numString.runtimeType}');
    print('반환된 타입 : ${int.parse(numString).runtimeType}');
    return int.parse(numString);
  } on FormatException {
    print('파싱중 에러가 발생했습니다. 0을 반환합니다');
    return 0;
  }
}

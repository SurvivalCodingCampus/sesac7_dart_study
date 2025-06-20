void main() {
  const String str1 = 'hello';
  const String str2 = 'hello';
  print(identical(str1, str2));

  String str3 = String.fromCharCodes('hello'.codeUnits);
  print(str3);
  print(identical(str1, str3));

  const String str4 = 'hel' + 'lo';
  print(identical(str1, str4));

  final String str5 = 'hel' + getLo();
  print(identical(str1, str5));
}

String getLo() => 'lo';
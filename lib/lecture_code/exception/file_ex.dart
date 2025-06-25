import 'dart:io';

void main(){
  final file = File('asset/test.txt'); // 절대경로 써야함 -> 그래서 별도의 폴더에 저장하는것이 좋다
  file.writeAsStringSync('Hello\n');
  file.writeAsStringSync('Hello', mode: FileMode.append);

  print(file.readAsStringSync());
}
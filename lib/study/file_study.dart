import 'dart:io';

void main() {
  final file = File('asset/save.txt');
  file.writeAsStringSync('hello\n', mode: FileMode.append);
  file.writeAsStringSync('hello\n', mode: FileMode.append);
  file.writeAsStringSync('hello\n', mode: FileMode.append);

  print(file.path);
}

import 'dart:io';

void main() {
  final file = File('asset/save.txt');

  try {
    for (int i = 0; i < 3; i++) {
      file.writeAsStringSync('hello\n', mode: FileMode.append);
    }
  } catch (e) {
    print('예상치 못한 오류');
  }
}

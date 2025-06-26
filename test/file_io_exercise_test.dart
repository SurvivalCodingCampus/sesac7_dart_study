import 'dart:io';

import 'package:modu_3_dart_study/file_io_exercise.dart';
import 'package:test/test.dart';

void main() {
  test('file copy operation test', () {
    //given
    final file = File('save.txt');

    file.writeAsStringSync('Hello Flutter!\n');
    file.writeAsStringSync('Hello again!', mode: FileMode.append);

    final saveTxtText = file.readAsStringSync();
    // print(saveTxtText);

    DefaultFileOperations fileCopy = DefaultFileOperations();

    // when
    try {
      fileCopy.copy('save.txt', 'target.txt');
    } catch (e) {
      print(e);
    }

    final targetFile = File('target.txt');
    final targetTxtText = targetFile.readAsStringSync();

    // then
    expect(saveTxtText == targetTxtText, true);
  });
}

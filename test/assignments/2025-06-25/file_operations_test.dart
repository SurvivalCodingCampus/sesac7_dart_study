import 'dart:io';

import 'package:test/test.dart';
import 'package:modu_3_dart_study/assignments/2025-06-25/default_file_operations.dart';

void main() {
  test('Copy Operation tests', () {
    //given
    final DefaultFileOperations dfo = DefaultFileOperations();
    //when
    dfo.copy('hello.txt', 'target.txt');
    final String saveTxt = File('hello.txt').readAsStringSync();
    final String targetTxt = File('target.txt').readAsStringSync();
    //then
    expect(saveTxt == targetTxt, true);
  });
}

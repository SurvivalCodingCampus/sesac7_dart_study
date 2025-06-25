import 'dart:io';

import 'package:modu_3_dart_study/lecture_code/exception/file.dart';
import 'package:test/test.dart';

void main() {
  test('파일복사 test', () {
    //given(준비)
    DefaultFileOperations dfo = DefaultFileOperations();

    //when(실행)
    dfo.copy(dfo.sourcePath, dfo.targetPath);

    //then(검증)
    expect(
      File(dfo.sourcePath).readAsStringSync() ==
          File(dfo.targetPath).readAsStringSync(),
      true,
    );
  });

  test('PathNotFoundException test', () {
    //given(준비)
    DefaultFileOperations dfo = DefaultFileOperations();

    //when(실행)
    dfo.copy('a.txt', dfo.targetPath);

    //then(검증)
  });
}

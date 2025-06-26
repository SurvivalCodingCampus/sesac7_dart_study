import 'dart:io';

import 'package:modu_3_dart_study/lecture_code/exception/file.dart';
import 'package:test/test.dart';

void main() {
  // [sourcePath] 복사할 원본 파일의 경로
  final String sourcePath = 'asset/sourcetext.txt';

  // [targetPath] 파일이 복사될 대상 경로
  final String targetPath = 'asset/targettext.txt';
  test('파일복사 test', () {

    //given(준비)
    DefaultFileOperations dfo = DefaultFileOperations();

    //when(실행)
    dfo.copy(sourcePath, targetPath);

    //then(검증)
    expect(
      File(sourcePath).readAsStringSync() ==
          File(targetPath).readAsStringSync(),
      true,
    );
  });

  test('PathNotFoundException test', () {
    //given(준비)
    DefaultFileOperations dfo = DefaultFileOperations();

    //when(실행)
    dfo.copy('a.txt', targetPath);

    //then(검증)
    // 예외 메세지 확인
  });
}

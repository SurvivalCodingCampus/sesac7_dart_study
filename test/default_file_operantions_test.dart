import 'dart:io';

import 'package:modu_3_dart_study/file_control/default_file_operations.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  test('원본 파일 경로가 없는 경우 Throw 테스트', () {
    final String testOriginalFilePath = 'file_test/original_test.txt';
    final String testCopyFilePath = 'file_test/copy_test.txt';
    final File testOriginalFile = File(testOriginalFilePath);

    if (testOriginalFile.existsSync()) {
      testOriginalFile.deleteSync();
    }

    expect(
      () => DefaultFileOperations().copy(
        sourcePath: testOriginalFilePath,
        targetPath: testCopyFilePath,
      ),
      throwsException,
    );
  });

  test('파일 복사 후 내용 비교', () {
    final String testOriginalFilePath = 'file_test/original_test.txt';
    final String testCopyFilePath = 'file_test/copy_test.txt';
    final File testOriginalFile = File(testOriginalFilePath);
    final File testCopyFile = File(testCopyFilePath);
    final Directory fileTestDir = Directory('file_test');

    if (!fileTestDir.existsSync()) {
      Directory('file_test').createSync();
    }

    testOriginalFile.createSync();
    testOriginalFile.writeAsStringSync('contents');

    DefaultFileOperations().copy(
      sourcePath: testOriginalFilePath,
      targetPath: testCopyFilePath,
    );

    final String originalFileContent = File(
      testOriginalFilePath,
    ).readAsStringSync();
    final String copyFileContent = File(testCopyFilePath).readAsStringSync();

    expect(originalFileContent, equals(copyFileContent));

    // 테스트 후 정리
    if (testOriginalFile.existsSync()) {
      testOriginalFile.deleteSync();
    }
    if (testCopyFile.existsSync()) {
      testCopyFile.deleteSync();
    }
    if (fileTestDir.existsSync()) {
      fileTestDir.deleteSync();
    }
  });
}

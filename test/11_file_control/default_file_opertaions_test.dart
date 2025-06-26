import 'dart:io';

import 'package:modu_3_dart_study/11_file_control/default_file_operations.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('파일 복사 테스트', () {
    final defaultFileOperations = DefaultFileOperations();

    test('파일 복사 성공 테스트', () {
      final String sourcePath = 'save.txt';
      final String targetPath = 'copy.txt';
      final sourceFile = File(sourcePath);
      final targetFile = File(targetPath);

      sourceFile.writeAsStringSync('테스트 용');

      expect(
        () => defaultFileOperations.copy(sourcePath, targetPath),
        returnsNormally,
      );
      expect(
        sourceFile.readAsStringSync() == targetFile.readAsStringSync(),
        equals(true),
      );

      if (sourceFile.existsSync()) sourceFile.deleteSync();
      if (targetFile.existsSync()) targetFile.deleteSync();
    });

    test('원본 파일 경로가 없을 때 실패 테스트', () {
      final String sourcePath = 'saveOnly.txt';
      final String targetPath = '';
      final sourceFile = File(sourcePath);
      final targetFile = File(targetPath);

      sourceFile.writeAsStringSync('테스트 용');

      expect(
        () => defaultFileOperations.copy(sourcePath, targetPath),
        throwsException,
      );

      if (sourceFile.existsSync()) sourceFile.deleteSync();
      if (targetFile.existsSync()) targetFile.deleteSync();
    });

    test('타겟 파일 경로가 없을 때 실패 테스트', () {
      final String sourcePath = '';
      final String targetPath = 'copyOnly.txt';
      final sourceFile = File(sourcePath);
      final targetFile = File(targetPath);

      expect(
        () => defaultFileOperations.copy(sourcePath, targetPath),
        throwsException,
      );

      if (sourceFile.existsSync()) sourceFile.deleteSync();
      if (targetFile.existsSync()) targetFile.deleteSync();
    });
  });
}

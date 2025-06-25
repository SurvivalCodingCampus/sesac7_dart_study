import 'dart:io';

import 'package:modu_3_dart_study/assignments/file/default_file_operations.dart';
import 'package:modu_3_dart_study/assignments/file/file_operations.dart';
import 'package:test/test.dart';

void main() {
  const String sourcePath = 'assets/source.txt';
  const String targetPath = 'assets/target.txt';

  late FileOperations fileOperations;

  setUp(() {
    fileOperations = DefaultFileOperations();
  });

  group('copy', () {
    test(
      'If the copy is successful, the original and the copy are identical.',
      () {
        // given
        final sourceContents = readFile(sourcePath);

        // when
        fileOperations.copy(sourcePath, targetPath);

        // then
        final targetContents = readFile(targetPath);
        expect(sourceContents, targetContents);
      },
    );

    test(
      'Throws an exception if the sourcePath is invalid.',
      () {
        // given
        final invalidSourcePath = '';

        // when
        // then
        expect(
          () => fileOperations.copy(invalidSourcePath, targetPath),
          throwsException,
        );
      },
    );

    test(
      'Throws an exception if the targetPath is invalid.',
      () {
        // given
        final invalidTargetPath = '';

        // when
        // then
        expect(
          () => fileOperations.copy(sourcePath, invalidTargetPath),
          throwsException,
        );
      },
    );
  });
}

String readFile(String path) {
  return File(path).readAsStringSync();
}

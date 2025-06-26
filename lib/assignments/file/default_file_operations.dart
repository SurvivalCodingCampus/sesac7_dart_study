import 'dart:io';

import 'package:modu_3_dart_study/assignments/file/file_operations.dart';

class DefaultFileOperations implements FileOperations {
  @override
  void copy(String sourcePath, String targetPath) {
    final source = File(sourcePath);
    if (!source.existsSync()) {
      throw FileSystemException('Source file does not exist', sourcePath);
    }

    final target = File(targetPath);
    final targetDirectory = target.parent;
    if (!targetDirectory.existsSync()) {
      targetDirectory.createSync(recursive: true);
    }

    final contents = source.readAsStringSync();
    target.writeAsStringSync(contents);
  }
}

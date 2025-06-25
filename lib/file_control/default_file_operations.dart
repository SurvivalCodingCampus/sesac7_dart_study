import 'dart:io';

import 'package:modu_3_dart_study/interface/file_operations.dart';

class DefaultFileOperations implements FileOperations {
  @override
  void copy({required String sourcePath, required String targetPath}) {
    final originalFile = File(sourcePath);
    final copyFile = File(targetPath);

    if (!originalFile.existsSync()) {
      throw Exception('해당 경로에 파일이 없습니다.');
    }

    copyFile.writeAsStringSync(originalFile.readAsStringSync());
  }
}
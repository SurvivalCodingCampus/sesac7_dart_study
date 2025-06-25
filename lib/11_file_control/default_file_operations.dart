import 'dart:io';

import 'package:modu_3_dart_study/11_file_control/file_operations.dart';

class DefaultFileOperations implements FileOperations {
  @override
  void copy(String sourcePath, String targetPath) {
    try {
      final sourceFile = File(sourcePath);
      final targetFile = File(targetPath);

      targetFile.writeAsStringSync(sourceFile.readAsStringSync());
    } catch (e) {
      throw Exception('파일 복사에 실패했습니다');
    }
  }
}

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

void main() {
  DefaultFileOperations defFO = DefaultFileOperations();
  try {
    defFO.copy(sourcePath: 'file_test/original_test.txt', targetPath: 'file_test/copy_test.txt');
  } on FileSystemException {
    print('파일 복사에 실패했습니다.');
  }
}

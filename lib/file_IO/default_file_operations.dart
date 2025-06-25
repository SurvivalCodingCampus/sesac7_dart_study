import 'dart:io';

import 'package:modu_3_dart_study/file_IO/file_operations.dart';

class DefaultFileOperations implements FileOperations {
  @override
  void copy(String sourcePath, String targetPath) {
    if (sourcePath.isEmpty || targetPath.isEmpty) {
      print('경로는 비어있지 않아야 합니다.');
      return;
    }

    final sourceFile = File(sourcePath); // 복사할 파일
    final targetFile = File(targetPath); // 붙여넣을 파일

    // 주어진 경로에 기존 파일이 있으면 그 위에 덮어쓰거나 덧붙이고,
    // 기존 파일이 없다면 새로 만들어서 작업을 한다.
    // 그러나 기존 파일이 없다고 해서 파일을 제멋대로 만들어 read를 할 수는 없을 것이다.
    // writeAsStringSync와는 다르게 readAsStringSync에서는 에러가 발생한다.
    try {
      final String source = sourceFile
          .readAsStringSync(); // 해당 줄에서 FileSystemException을 throw

      // writeAsStringSync는 기존 파일이 없으면 인자로 받은 내용을 토대로 파일을 새로 만듦
      // 따라서 에러 x
      targetFile.writeAsStringSync(source);
    } on FileSystemException {
      print('파일 작업 중 에러');
    } catch (e) {
      print('예상치 못한 에러');
    }
  }
}

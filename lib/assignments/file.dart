import 'dart:io';

abstract interface class FileOperations {
  void copy(String sourcePath, String targetPath);
}

class FileOperation implements FileOperations {
  @override
  void copy(String sourcePath, String targetPath) {
    try {
      if (sourcePath.isEmpty || targetPath.isEmpty) {
        throw ArgumentError('경로가 비어있습니다');
      }
      File(sourcePath).copySync(targetPath);
    } on FileSystemException catch (e) {
      throw FileOperationException('파일 복사 오류가 발생했습니다.');
    }
  }
}

class FileOperationException implements Exception {
  final String message;

  FileOperationException(this.message);

  @override
  String toString() {
    return 'FileException: $message';
  }
}

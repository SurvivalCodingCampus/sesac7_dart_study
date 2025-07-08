/*
파일을 복사하는 DefaultFileOperations 클래스를 작성하시오
원본 파일 경로와 복사할 파일 경로는 프로그램 실행시 파라미터로 전달되는 것으로 하고, 예외 처리는 자유롭게 할 것,
*/
import 'dart:io';

abstract interface class FileOperations {
  // 지정된 경로의 파일을 다른 경로로 복사합니다.

  void copy(String sourcePath, String targetPath);
}

class DefaultFileOperations extends FileOperations {
  @override
  void copy(String sourcePath, String targetPath) {
    try {
      // sourcepath 파일을 열기
      final sourceFile = File(sourcePath);

      // sourcepath 파일을 읽기 => 읽은 내용을 저장하기
      String text = sourceFile.readAsStringSync();

      // targetpath 파일을 열기
      final targetFile = File(targetPath);

      // 읽은 내용을 targetpath에 쓰기
      targetFile.writeAsStringSync(text);
    } on PathNotFoundException {
      print('PathNotFoundException');
    } on FileSystemException catch (e) {
      print('FileSystemException : $e');
    } catch (e) {
      print('error: $e');
    }
  }
}

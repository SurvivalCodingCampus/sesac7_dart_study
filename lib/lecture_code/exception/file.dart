/*
파일을 복사하는 DefaultFileOperations 클래스를 작성하시오
원본 파일 경로와 복사할 파일 경로는 프로그램 실행시 파라미터로 전달되는 것으로 하고, 예외 처리는 자유롭게 할 것,
*/
import 'dart:io';

abstract interface class FileOperations {
  // 지정된 경로의 파일을 다른 경로로 복사합니다.

  // [sourcePath] 복사할 원본 파일의 경로
  // [targetPath] 파일이 복사될 대상 경로
  String sourcePath = 'asset/sourcetext.txt';
  String targetPath = 'b';

  void copy(String sourcePath, String targetPath);
}

class DefaultFileOperations extends FileOperations {

  @override
  void copy(String sourcePath, String targetPath) {

    // sourcepath 파일을 열기
    final file = File(sourcePath);

    // sourcepath 파일을 읽기
    print(file.readAsStringSync());

    // 읽은 내용을 저장하기

    // targetpath 파일을 열기

    // 읽은 내용을 targetpath에 쓰기
  }
}
void main(){
  DefaultFileOperations dfo = DefaultFileOperations();
  print(dfo.sourcePath);
  print(Directory.current.path);
  dfo.copy(dfo.sourcePath, dfo.targetPath);
}


/*
파일을 복사하는 DefaultFileOperations 클래스를 작성하시오
원본 파일 경로와 복사할 파일 경로는 프로그램 실행시 파라미터로 전달되는 것으로 하고, 예외 처리는 자유롭게 할 것,
*/

abstract interface class FileOperations {
  // 지정된 경로의 파일을 다른 경로로 복사합니다.

  // [sourcePath] 복사할 원본 파일의 경로
  // [targetPath] 파일이 복사될 대상 경로
  String sourcePath = 'a';
  String targetPath = 'b';

  void copy(String sourcePath, String targetPath);
}

class DefaultFileOperations extends FileOperations {
  @override
  void copy(String sourcePath, String targetPath) {

  }
}
void main(){
  DefaultFileOperations dfo = DefaultFileOperations();
  print(dfo.targetPath);

}

/*
file 쓰기
파일열기
final myFile = File('save.txt');

내용쓰기
myFIle.writeAsStringSync('Hello World');
*/

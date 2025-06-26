import 'dart:io';

abstract interface class FileOperations {
  // 지정된 경로의 파일을 다른 경로로 복사합니다.

  // [sourcePath] 복사할 원본 파일의 경로
  // [targetPath] 파일이 복사될 대상 경로

  // 복사란 읽어서 쓰기
  void copy(String sourcePath, String targetPath);
  
}

class CopyFile implements FileOperations {

  String sourcePath;
  String targetPath;
  // CopyFile(this.sourcePath, targetPath): _targetPath = targetPath{
  //   targetPath = '${sourcePath}_copy';
  // }

  CopyFile(this.sourcePath, this.targetPath);

  @override
  void copy(String sourcePath, String targetPath) {
    
    try {
      final file = File(sourcePath);
      final newFile = File(targetPath);

      // 원본 파일이 존재하지 않으면 경로에 해당 파일 새로 생성
      if (!file.existsSync()) {
        file.writeAsStringSync('');
      }

      final readFile = file.readAsStringSync(); // 읽기
      // file.writeAsStringSync('_copy', mode: FileMode.append);
      newFile.writeAsStringSync(readFile, mode: FileMode.write); // 쓰기
      
    } on FileSystemException catch (e) {
      throw Exception('파일복사중 오류발생 ${e.message}');
    }
    
  }

}
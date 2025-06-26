import 'package:modu_3_dart_study/250625/file_operation.dart';
import 'dart:io';

class DefaultFileOperations implements FileOperation {
  @override
  void copy(String sourcePath, String targetPath) {
    //소스패스와 타겟패스가 같으면 return
    if (sourcePath == targetPath) {
      throw Exception('소스 경로와 대상 경로가 동일합니다: $sourcePath');
    }

    //소스파일이 없다.
    final sourceFile = File(sourcePath);
    if (sourceFile.existsSync() == false) {
      throw Exception('소스 파일이 존재하지 않습니다: $sourcePath');
    }

    //타겟파일이 이미 있다.
    final targetFile = File(targetPath);
    if (targetFile.existsSync()) {
      throw Exception('대상 파일이 이미 존재합니다: $targetPath');
    }

    String fileString;
    try {
      //소스패스 파일로 부터 내용 읽어들이기
      //읽어들일때 예외처리
      final sourceFile = File(sourcePath);
      fileString = sourceFile.readAsStringSync();
    } catch (e) {
      throw Exception('소스 파일을 읽을 수 없습니다: $sourcePath');
    }

    try {
      //타겟패스 파일로 읽어들인 내용 쓰기
      //쓸때 예외처리
      final targetFile = File(targetPath);
      targetFile.writeAsStringSync(fileString);
    } catch (e) {
      throw Exception('대상 파일에 쓸 수 없습니다: $targetPath');
    }
  }
}

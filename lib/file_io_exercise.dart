import 'dart:io';

void main() {
  final file = File('save.txt');

  file.writeAsStringSync('Hello Flutter!\n');
  file.writeAsStringSync('Hello again!', mode: FileMode.append);

  final saveTxtText = file.readAsStringSync();
  print(saveTxtText);

  DefaultFileOperations fileCopy = DefaultFileOperations();
  fileCopy.copy('save.txt', 'target.txt');

  final targetFile = File('target.txt');
  print(targetFile.readAsStringSync());
}

abstract interface class FileOperations {
  void copy(String sourcePath, String targetPath);
}

class DefaultFileOperations implements FileOperations {
  @override
  void copy(String sourcePath, String targetPath) {
    final sourceFile = File(sourcePath);
    final sourceText = sourceFile.readAsStringSync();

    final targetFile = File(targetPath);
    targetFile.writeAsStringSync(sourceText);
  }
}

// 예외처리 복사할 원본 파일이 없을 때, 타겟 파일이 이미 있을 때

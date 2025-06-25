import 'dart:io';

import 'package:modu_3_dart_study/20250625/my_exception.dart';

abstract interface class FileOperations {
  void copy(String sourcePath, String targetPath);
}

class DefaultFileOperations extends FileOperations {

  String _contents = "";

  @override
  void copy(String sourcePath, String targetPath) {
    if(sourcePath.isEmpty || targetPath.isEmpty) throw MyException(MyException.FILE_NAME_EMPTY);

    final sourceFile = File(sourcePath);
    if (!sourceFile.existsSync()) throw MyException(MyException.FILE_NOT_FOUND);

    _contents = sourceFile.readAsStringSync();

    if(_contents.isEmpty) throw MyException(MyException.FILE_CONTENTS_EMPTY);

    final targetFile = File(targetPath);
    try {
      targetFile.writeAsStringSync(_contents);
    } catch (e) {
      throw Exception("파일 쓰기 실패: ${e.toString()}");
    }
  }
}

void main() {
  final fileOperations = DefaultFileOperations();
  try {
    fileOperations.copy('save', 'aaa');
  } catch (e) {
    if (e is MyException) {
      print('내 예외 : ${e.toString()}');
    } else {
      print('기타 : ${e.toString()}');
    }
  }
}
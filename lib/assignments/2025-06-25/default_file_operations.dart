import 'dart:io';
import 'package:modu_3_dart_study/assignments/2025-06-25/file_operations.dart';

class DefaultFileOperations implements FileOperations {
  @override
  void copy(String sourcePath, String targetPath) {
    final File sourceFile;
    final File targetFile;

    try {
      sourceFile = File(sourcePath);
    } catch (e) {
      throw Exception("Unable to open file : $sourcePath");
    }

    try {
      targetFile = File(targetPath);
    } catch (e) {
      throw Exception("Unable to open file : $targetPath");
    }

    try {
      final text = sourceFile.readAsStringSync();
      targetFile.writeAsStringSync(text);
    } catch (e) {
      throw Exception("There were error during copying operation");
    }
  }
}

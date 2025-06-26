import 'dart:io';

import 'package:modu_3_dart_study/assignments/file.dart';
import 'package:test/test.dart';

void main() {
  group('파일 복사 테스트', () {
    final fileOperations = FileOperation();

    Directory? tempDirectory;

    setUpAll(() {
      tempDirectory = Directory.systemTemp.createTempSync('test_');
      print('디렉토리 생성: ${tempDirectory!.path}');
    });

    tearDownAll(() {
      tempDirectory?.deleteSync(recursive: true);
      print('디렉토리 삭제');
    });

    test('파일 복사 성공 시, 내용 일치 여부', () {
      final sourceFile = File('${tempDirectory!.path}/original.txt');
      sourceFile.writeAsStringSync('파일 내용입니다');
      final targetFile = File('${tempDirectory!.path}/copy.txt');

      fileOperations.copy(sourceFile.path, targetFile.path);

      expect(targetFile.existsSync(), isTrue);
    });

    test('원본 파일이 존재하지 않을 때 FileException 테스트', () {
      final noneSourcePath = '${tempDirectory!.path}/empty_file.txt';
      final targetPath = '${tempDirectory!.path}/target.txt';

      expect(
        () => fileOperations.copy(noneSourcePath, targetPath),
        throwsA(isA<FileOperationException>()),
      );
    });

    test('대상 경로가 유효하지 않을 때 FileException 테스트', () {
      final sourceFile = File('${tempDirectory!.path}/another_original.txt');
      sourceFile.writeAsStringSync('some data');
      final invalidTargetPath = tempDirectory!.path;

      expect(
        () => fileOperations.copy(sourceFile.path, invalidTargetPath),
        throwsA(isA<FileOperationException>()),
      );
    });
  });
}

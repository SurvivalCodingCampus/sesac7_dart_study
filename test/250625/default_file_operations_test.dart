import 'dart:io';

import 'package:modu_3_dart_study/250625/default_file_operations.dart';
import 'package:test/test.dart';

void main() {
  group('copy테스트', () {
    //target.txt가 있으면 삭제
    final file = File('asset/target.txt');
    if (file.existsSync()) {
      file.delete();
    }

    test('copy테스트: 패스가 같을때', () {
      final defaultFileOperations = DefaultFileOperations();
      expect(
        () =>
            defaultFileOperations.copy('asset/source.txt', 'asset/source.txt'),
        throwsA(isA<Exception>()),
      );
    });

    test('copy테스트: 소스파일이 없을때', () {
      final defaultFileOperations = DefaultFileOperations();
      expect(
        () => defaultFileOperations.copy(
          'asset/nosource.txt',
          'asset/target.txt',
        ),
        throwsA(isA<Exception>()),
      );
    });

    test('copy테스트: 문제없을때', () {
      final defaultFileOperations = DefaultFileOperations();
      expect(
        () =>
            defaultFileOperations.copy('asset/source.txt', 'asset/target.txt'),
        returnsNormally,
      );
    });

    test('copy테스트: 타겟파일이 이미 있을때', () {
      final defaultFileOperations = DefaultFileOperations();
      expect(
        () =>
            defaultFileOperations.copy('asset/source.txt', 'asset/target.txt'),
        throwsA(isA<Exception>()),
      );
    });
  });
}

import 'dart:io';

import 'package:modu_3_dart_study/20250625/file.dart';
import 'package:modu_3_dart_study/20250625/my_exception.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  late DefaultFileOperations fileOperationsEx;
  group('20250625 테스트', ()
  {
    setUp((){
      fileOperationsEx = DefaultFileOperations();
    });
    test('파일명이 없을때', () {
      expect(() => fileOperationsEx.copy('', ''), throwsA(isA<MyException>()));
      expect(() => fileOperationsEx.copy('aaa', ''), throwsA(isA<MyException>()));
      expect(() => fileOperationsEx.copy('', 'bbb'), throwsA(isA<MyException>()));
    });

    test('파일 내용이 없을때', () {
      expect(() => fileOperationsEx.copy('empty.txt', 'target.txt'), throwsA(isA<MyException>()));
    });

    test('MY 예외클래스 사용', () {
      expect(() => fileOperationsEx.copy('', ''),
          throwsA(isA<Exception>().having((e) => e.toString(), 'message', 'MyException: ${MyException.FILE_NAME_EMPTY}')));
      expect(() => fileOperationsEx.copy('aaa', ''),
          throwsA(isA<Exception>().having((e) => e.toString(), 'message', 'MyException: ${MyException.FILE_NAME_EMPTY}')));
      expect(() => fileOperationsEx.copy('empty.txt', 'bbb'),
          throwsA(isA<Exception>().having((e) => e.toString(), 'message', 'MyException: ${MyException.FILE_CONTENTS_EMPTY}')));
    });

    test('원본 파일이 없을때', () {
      expect(() => fileOperationsEx.copy('aaa', 'target.txt'),
          throwsA(isA<Exception>().having((e) => e.toString(), 'message', 'MyException: ${MyException.FILE_NOT_FOUND}')));
    });

    test('정상', () {
      fileOperationsEx.copy('save.txt', 'target.txt');
      final targetFile = File('target.txt');
      expect(targetFile.existsSync() , isTrue);
    });
  });
}
import 'dart:io';
import 'package:test/test.dart';
import 'package:modu_3_dart_study/file.dart';


void main () {


  final source = './test_file_01.txt';
  final target = './test_file_01_copy.txt';

  test('원본파일의 경로에 원본파일이 없을 경우 생성한다', (){
    
    // 같은 이름으로 같은 자리에 생성할때 파일이름 뒤에 _copy 를 붙이고 싶을때
    final testFile = CopyFile(source, target);
    testFile.copy(source, target);

    expect(File(source).existsSync(), isTrue);
  });

  test('원본파일에 내용을 추가하고 복사했을때 복사된 파일은 정확히 원본파일과 일치한다', (){
    final sourceFile = File(source);

    sourceFile.writeAsStringSync('hello', mode: FileMode.append); 

    final targetFile = File(target);

    final testFile02 = CopyFile(source, target);
    testFile02.copy(source, target);

    expect(sourceFile.readAsStringSync(), targetFile.readAsStringSync());
  });
}
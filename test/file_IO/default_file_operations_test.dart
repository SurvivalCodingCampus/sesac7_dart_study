import 'dart:io';

import 'package:modu_3_dart_study/file_IO/default_file_operations.dart';
import 'package:test/test.dart';

void main() {
  late Directory tempDir;

  // 테스트 시작 전 테스트용 임시 디렉토리 생성
  setUp(() {
    tempDir = Directory.systemTemp.createTempSync('test_');
  });

  // 테스트가 끝난 후 사용한 임시 디렉토리 제거
  tearDown(() {
    if (tempDir.existsSync()) {
      tempDir.deleteSync(recursive: true);
    }
  });

  test('복사할 파일 경로와 붙여넣을 파일 경로 상에 모두 기존 파일이 존재할 경우', () {
    // given
    final String testLocation1 = '${tempDir.path}/source.txt';
    final String testLocation2 = '${tempDir.path}/target.txt';
    final DefaultFileOperations defaultFileOperations = DefaultFileOperations();

    // 테스트용 소스 파일 생성
    File(testLocation1).writeAsStringSync('test content');
    File(testLocation2).writeAsStringSync('existing content');

    // when
    defaultFileOperations.copy(testLocation1, testLocation2);

    // then
    // 주어진 경로에 존재하던 기존 파일을 읽어오므로 Exception이 발생하지 않는다.
    expect(() => File(testLocation1).readAsStringSync(), returnsNormally);

    // 기준 파일을 복사하여 타겟 경로에 이미 존재하는 파일에 붙여넣을 것이므로,
    // 타겟 파일의 내용을 읽어올 때 또한 Exception이 발생하지 않는다.
    expect(() => File(testLocation2).readAsStringSync(), returnsNormally);

    // 파일을 복사한 것이므로 두 파일의 내용이 같아야 함.
    expect(
      File(testLocation1).readAsStringSync() ==
          File(testLocation2).readAsStringSync(),
      isTrue,
    );
  });

  test('복사할 파일 경로에는 기존 파일이 없고, 붙여넣을 파일 경로에는 기존 파일이 존재할 경우', () {
    // given
    final String testLocation1 = '${tempDir.path}/source.txt';
    final String testLocation2 = '${tempDir.path}/target.txt';
    final String testMessage = 'target content';
    final DefaultFileOperations defaultFileOperations = DefaultFileOperations();

    // 테스트용 소스 파일 생성
    File(testLocation2).writeAsStringSync(testMessage);

    // when
    defaultFileOperations.copy(testLocation1, testLocation2);

    // then
    // 주어진 경로에 기존 파일이 없는 상태이므로, existsSync 메소드로 검사하면 false.
    expect(File(testLocation1).existsSync(), isFalse);

    // 주어진 경로에 기존 파일이 없는 상태이므로, 읽어올 수 있는 내용이 없어 Exception이 발생.
    expect(() => File(testLocation1).readAsStringSync(), throwsException);

    // 타겟 경로에 있던 파일은 내용이 변하지 않았다.
    expect(File(testLocation2).readAsStringSync(), equals(testMessage));
  });

  test('복사할 파일 경로에는 기존 파일이 존재하고, 붙여넣을 파일 경로에는 기존 파일이 없는 경우', () {
    // given
    final String testLocation1 = '${tempDir.path}/source.txt';
    final String testLocation2 = '${tempDir.path}/target.txt';
    final String testMessage = 'target content';
    final DefaultFileOperations defaultFileOperations = DefaultFileOperations();

    // 테스트용 소스 파일 생성
    File(testLocation1).writeAsStringSync(testMessage);

    // when & then
    // 타겟 경로에 기존 파일이 없는 상태이므로, existsSync 메소드로 검사하면 false.
    expect(File(testLocation2).existsSync(), isFalse);

    // 복사 실행
    defaultFileOperations.copy(testLocation1, testLocation2);

    // 주어진 경로에 존재하던 기존 파일을 읽어오므로 Exception이 발생하지 않는다.
    expect(() => File(testLocation1).readAsStringSync(), returnsNormally);

    // 복사 과정에서 writeAsStringSync를 통해 새 파일이 만들어졌을 것이므로,
    // existsSync 메소드로 검사하면 true.
    expect(File(testLocation2).existsSync(), isTrue);

    // 복사된 값은 testMessage와 같을 것이다.
    expect(File(testLocation2).readAsStringSync(), equals(testMessage));

    // 정상적으로 복사가 되었을 것이므로 두 파일의 내용이 같다.
    expect(
      File(testLocation1).readAsStringSync() ==
          File(testLocation2).readAsStringSync(),
      isTrue,
    );
  });

  test('복사할 파일 경로와 붙여넣을 파일 경로 상에 모두 기존 파일이 없는 경우', () {
    // given
    final String testLocation1 = '${tempDir.path}/source.txt';
    final String testLocation2 = '${tempDir.path}/target.txt';
    final DefaultFileOperations defaultFileOperations = DefaultFileOperations();

    // when
    defaultFileOperations.copy(testLocation1, testLocation2);

    // then
    // 주어진 경로에 기존 파일이 없는 상태이므로, existsSync 메소드로 검사하면 false.
    expect(File(testLocation1).existsSync(), isFalse);

    // 타겟 경로 역시 파일이 없는 상태이므로, existsSync 메소드로 검사하면 false.
    expect(File(testLocation2).existsSync(), isFalse);
  });
}

/*

### 테스트 케이스 정리
1. 복사할 파일 경로와 붙여넣을 파일 경로 상에 모두 기존 파일이 존재할 경우
2. 복사할 파일 경로에는 기존 파일이 없고, 붙여넣을 파일 경로에는 기존 파일이 존재할 경우
3. 복사할 파일 경로에는 기존 파일이 존재하고, 붙여넣을 파일 경로에는 기존 파일이 없는 경우
4. 복사할 파일 경로와 붙여넣을 파일 경로 상에 모두 기존 파일이 없는 경우

 */

import 'dart:io';

import 'package:modu_3_dart_study/file_IO/default_file_operations.dart';
import 'package:test/test.dart';

void main() {
  test('복사할 파일 경로와 붙여넣을 파일 경로 상에 모두 기존 파일이 존재할 경우', () {
    // given
    final String testLocation1 = 'lib/person.dart';
    final String testLocation2 = 'hello.txt';
    final DefaultFileOperations defaultFileOperations = DefaultFileOperations();

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
    final String testLocation1 = 'lib/study/person.dart'; // study에는 해당 파일 없음
    final String testLocation2 = 'hello.txt';
    final DefaultFileOperations defaultFileOperations = DefaultFileOperations();

    // when
    // copy 메소드 내부에 예외 처리를 해놨기 때문에, 실행 했을 때 Exception이 발생하면 안됨.
    expect(
      () => defaultFileOperations.copy(testLocation1, testLocation2),
      returnsNormally,
    );

    // then
    // 주어진 경로에 기존 파일이 없는 상태이므로, 읽어올 수 있는 내용이 없어 Exception이 발생.
    expect(() => File(testLocation1).readAsStringSync(), throwsException);

    // 타겟 경로에 있던 기존 파일을 읽어오는 것은 문제가 없다.
    expect(() => File(testLocation2).readAsStringSync(), returnsNormally);
  });

  test('복사할 파일 경로에는 기존 파일이 존재하고, 붙여넣을 파일 경로에는 기존 파일이 없는 경우', () {
    // given
    final String testLocation1 = 'lib/person.dart';
    final String testLocation2 = 'lib/hello.txt'; // lib에는 해당 파일 없음
    final DefaultFileOperations defaultFileOperations = DefaultFileOperations();

    // when
    // copy 메소드 내부에 예외 처리를 해놨기 때문에, 실행 했을 때 Exception이 발생하면 안됨.
    expect(
      () => defaultFileOperations.copy(testLocation1, testLocation2),
      returnsNormally,
    );

    // then
    // 주어진 경로에 존재하던 기존 파일을 읽어오므로 Exception이 발생하지 않는다.
    expect(() => File(testLocation1).readAsStringSync(), returnsNormally);

    // 기존 파일이 없었지만 writeAsStringSync를 통해 새 파일이 만들어졌을 것이므로,
    // Exception이 발생하지 않는다.
    expect(() => File(testLocation2).readAsStringSync(), returnsNormally);

    // 정상적으로 복사가 되었을 것이므로 두 파일의 내용이 같다.
    expect(
      File(testLocation1).readAsStringSync() ==
          File(testLocation2).readAsStringSync(),
      isTrue,
    );
  });

  test('복사할 파일 경로와 붙여넣을 파일 경로 상에 모두 기존 파일이 없는 경우', () {
    // given
    final String testLocation1 = 'lib/study/person.dart'; // study에는 해당 파일 없음
    final String testLocation2 = 'lib/hello.txt'; // lib에는 해당 파일 없음
    final DefaultFileOperations defaultFileOperations = DefaultFileOperations();

    // when
    // copy 메소드 내부에 예외 처리를 해놨기 때문에, 실행 했을 때 Exception이 발생하면 안됨.
    expect(
      () => defaultFileOperations.copy(testLocation1, testLocation2),
      returnsNormally,
    );

    // then
    // 주어진 경로에 기존 파일이 없는 상태이므로, 읽어올 수 있는 내용이 없어 Exception이 발생.
    expect(() => File(testLocation1).readAsStringSync(), throwsException);

    // 타겟 경로에 있던 기존 파일을 읽어오는 것은 문제가 없다.
    expect(() => File(testLocation2).readAsStringSync(), returnsNormally);
  });
}

/*

### 테스트 케이스 정리
1. 복사할 파일 경로와 붙여넣을 파일 경로 상에 모두 기존 파일이 존재할 경우
2. 복사할 파일 경로에는 기존 파일이 없고, 붙여넣을 파일 경로에는 기존 파일이 존재할 경우
3. 복사할 파일 경로에는 기존 파일이 존재하고, 붙여넣을 파일 경로에는 기존 파일이 없는 경우
4. 복사할 파일 경로와 붙여넣을 파일 경로 상에 모두 기존 파일이 없는 경우

 */

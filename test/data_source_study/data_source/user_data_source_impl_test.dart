import 'package:modu_3_dart_study/data_source_study/data_source/user_data_source_impl.dart';
import 'package:test/test.dart';

void main() {
  test('읽어올 파일 경로를 잘못 입력할 시 예외 처리가 올바르게 작동하는가?', () {
    // given
    final String wrongUserPath = 'wrongPath/users.json';
    final UserDataSourceImpl testUserSource = UserDataSourceImpl();

    // when
    testUserSource.userFilePath = wrongUserPath;

    // then
    expect(testUserSource.getUsers(), throwsException);
  });
}

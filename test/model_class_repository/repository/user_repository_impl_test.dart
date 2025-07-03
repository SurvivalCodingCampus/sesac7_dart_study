import 'package:modu_3_dart_study/model_class_repository/data_source/user_data_source.dart';
import 'package:modu_3_dart_study/model_class_repository/repository/user_repository_impl.dart';
import 'package:test/test.dart';

import '../mocks/mock_user_data_source_impl.dart';

void main() {
  test('user 리스트를 정확히 반환하는가? (정렬 x)', () async {
    // given
    final int givenLength = 10;
    final UserDataSource userDataSource = MockUserDataSourceImpl();
    final UserRepositoryImpl userRepositoryImpl = UserRepositoryImpl(
      userDataSource: userDataSource,
    );

    // when
    final result = await userRepositoryImpl.getUsers();

    // then
    expect(result.length, equals(givenLength));
  });

  test('user의 이름에 따라 정렬이 가능한가?', () async {
    // given
    final int givenFirstIndex = 0;
    final int givenLastIndex = 9;
    final int givenLength = 10;
    final String givenFirstName = 'Chelsey Dietrich';
    final String givenLastName = 'Patricia Lebsack';
    final UserDataSource userDataSource = MockUserDataSourceImpl();
    final UserRepositoryImpl userRepositoryImpl = UserRepositoryImpl(
      userDataSource: userDataSource,
    );

    // when
    final result = await userRepositoryImpl.getUsersTop10ByUserName();

    // then
    expect(result.length, equals(givenLength));
    expect(result[givenFirstIndex].name, equals(givenFirstName));
    expect(result[givenLastIndex].name, equals(givenLastName));
  });
}

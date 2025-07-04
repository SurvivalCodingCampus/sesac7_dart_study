
import 'package:modu_3_dart_study/repository/data_source/user_data_source.dart';
import 'package:modu_3_dart_study/repository/repository/user_repository.dart';
import 'package:modu_3_dart_study/repository/repository/user_repository_impl.dart';
import 'package:test/test.dart';

import 'mocks/mock_user_repository_impl.dart';

void main() {
  test('Repository 작성 연습 4 test', () async {
    //given(준비)
    final int completedId = 1;
    final int top10Length = 5;
    final String usernameNo5 = 'Kamren';
    final UserDataSource userDataSource = MockUserRepositoryImpl();
    final UserRepository repository = UserRepositoryImpl(userDataSource);

    //when(실행)
    final users = await repository.getUsers();
    final top10username = await repository.getUsersTop10ByUserName();

    //then(검증)
    expect(users.first.id, completedId); // 첫번째 completed
    expect(top10username.length, top10Length);
    expect(top10username[4].username, usernameNo5);
  });
}

import 'package:modu_3_dart_study/assignments/2025-07-02/data_source/user_data_source.dart';
import 'package:modu_3_dart_study/assignments/2025-07-03/repository/user_repository.dart';
import 'package:modu_3_dart_study/assignments/2025-07-03/repository/user_repository_impl.dart';
import 'package:test/test.dart';

import 'mocks/mock_user_data_source_impl.dart';

void main() {
  test('user_repository_impl_test', () async {
    final UserDataSource userDataSource = MockUserDataSourceImpl();
    final UserRepository userRepository = UserRepositoryImpl(
      userDataSource,
    );

    final usersList = await userRepository.getUsers();

    expect(usersList.length, 10);
    expect(usersList.first.name, "Leanne Graham");

    final top5ByUserName = await userRepository.getUsersTop5ByUserName();
    expect(top5ByUserName.length, 5);
  });
}

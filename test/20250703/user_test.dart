import 'package:modu_3_dart_study/20250703/data_source/user_data_source.dart';
import 'package:modu_3_dart_study/20250703/repository/user_repository.dart';
import 'package:modu_3_dart_study/20250703/repository/user_repository_impl.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../mocks/mock_user_data_source_impl.dart';

void main() {
  test('user_repository_impl_test', () async {
    final UserDataSource mockDataSource = MockUserDataSourceImpl();
    final UserRepository repository = UserRepositoryImpl(mockDataSource);

    final users1 = await repository.getUsers();
    final users2 = await repository.getUsersTop10ByUserName();

    expect(users1.length, 12);
    expect(users1.first.name, 'Leanne Graham');

    expect(users2.length, 10);
    expect(users2.first.name, 'Chelsey Dietrich');

  });
}
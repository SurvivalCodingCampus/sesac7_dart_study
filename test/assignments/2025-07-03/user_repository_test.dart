import 'package:modu_3_dart_study/assignments/2025-07-03/model/user.dart';
import 'package:modu_3_dart_study/assignments/2025-07-03/repository/user_repository.dart';
import 'package:modu_3_dart_study/assignments/2025-07-03/repository/user_repository_impl.dart';
import 'package:test/test.dart';

import 'mocks/mock_user_data_source_impl.dart';

void main() {
  test('Testing UserRepositoryImpl with MockUserDataSource', () async {
    //given
    final UserRepository testRepo = UserRepositoryImpl(
      MockUserDataSourceImpl(),
    );

    //when

    final List<User> results = await testRepo.getUsers();
    final List<User> top10Results = await testRepo.getUsersTop10ByUserName();

    //then
    expect(top10Results.length, 3);
    print(top10Results);

    expect(results.length, 3);
    print(results);
  });
}

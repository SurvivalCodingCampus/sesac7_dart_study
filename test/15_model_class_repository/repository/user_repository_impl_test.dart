import 'package:modu_3_dart_study/15_model_class_repository/data_source/user_data_source.dart';
import 'package:modu_3_dart_study/15_model_class_repository/repository/user_repository.dart';
import 'package:modu_3_dart_study/15_model_class_repository/repository/user_repository_impl.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../../mocks/mock_user_data_source_impl.dart';

void main() {
  group('UserRepositoryImpl Test', () {
    final UserDataSource dataSource = MockUserDataSourceImpl();
    final UserRepository repository = UserRepositoryImpl(dataSource);

    test('getUsers() Test', () async {
      final users = (await repository.getUsers());
      expect(users.length, 3);
    });

    test('getUsersTop10ByUserName() Test', () async {
      final testUserName1 = 'Antonette';
      final testUserName2 = 'Bret';
      final testUserName3 = 'Samantha';
      final users = (await repository.getUsersTop10ByUserName());

      expect(users.length, 3);
      expect(
        users[0].userName == testUserName1,
        isTrue,
      );
      expect(
        users[1].userName == testUserName2,
        isTrue,
      );
      expect(
        users[2].userName == testUserName3,
        isTrue,
      );
    });
  });
}

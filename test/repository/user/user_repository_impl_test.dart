import 'package:modu_3_dart_study/data_source/user/user_data_source.dart';
import 'package:modu_3_dart_study/model/user.dart';
import 'package:modu_3_dart_study/repository/user/user_repository.dart';
import 'package:modu_3_dart_study/repository/user/user_repository_impl.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../../mocks/mock_user_data_source_impl.dart';

void main() {
  group('UserRepositoryImpl Test', () {
    test('getUsers Test', () async {
      final UserDataSource userDataSourceImpl = MockUserDataSourceImpl();
      final UserRepository userRepositoryImpl = UserRepositoryImpl(dataSource: userDataSourceImpl);
      final List<User> users = await userRepositoryImpl.getUsers();
      final User firstUser = users.first;

      expect(users.length, equals(13));
      expect(firstUser.id, equals(1));
      expect(firstUser.name, equals('Leanne Graham'));
      expect(firstUser.username, equals('Bret'));
      expect(firstUser.email, equals('Sincere@april.biz'));
      expect(firstUser.address?.street, equals('Kulas Light'));
      expect(firstUser.address?.suite, equals('Apt. 556'));
      expect(firstUser.address?.city, equals('Gwenborough'));
      expect(firstUser.address?.zipcode, equals('92998-3874'));
      expect(firstUser.address?.geo?.lat, equals('-37.3159'));
      expect(firstUser.address?.geo?.lng, equals('81.1496'));
      expect(firstUser.phone, equals('1-770-736-8031 x56442'));
      expect(firstUser.website, equals('hildegard.org'));
      expect(firstUser.company?.name, equals('Romaguera-Crona'));
      expect(firstUser.company?.catchPhrase, equals('Multi-layered client-server neural-net'));
      expect(firstUser.company?.bs, equals('harness real-time e-markets'));
    });

    test('getUsersTop10ByUserName Test', () async {
      final UserDataSource userDataSourceImpl = MockUserDataSourceImpl();
      final UserRepository userRepositoryImpl = UserRepositoryImpl(dataSource: userDataSourceImpl);
      final List<User> top10Users = await userRepositoryImpl.getUsersTop10ByUserName();

      expect(top10Users.length, equals(10));
      for (int i = 0; i < top10Users.length; i++) {
        expect(top10Users[i].id, equals(i + 1));
      }
    });
  });
}
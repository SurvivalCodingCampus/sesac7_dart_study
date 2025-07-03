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

      expect((await userRepositoryImpl.getUsers()).length, equals(13));
      expect((await userRepositoryImpl.getUsers()).first.id, equals(1));
      expect((await userRepositoryImpl.getUsers()).first.name, equals('Leanne Graham'));
      expect((await userRepositoryImpl.getUsers()).first.username, equals('Bret'));
      expect((await userRepositoryImpl.getUsers()).first.email, equals('Sincere@april.biz'));
      expect((await userRepositoryImpl.getUsers()).first.address?.street, equals('Kulas Light'));
      expect((await userRepositoryImpl.getUsers()).first.address?.suite, equals('Apt. 556'));
      expect((await userRepositoryImpl.getUsers()).first.address?.city, equals('Gwenborough'));
      expect((await userRepositoryImpl.getUsers()).first.address?.zipcode, equals('92998-3874'));
      expect((await userRepositoryImpl.getUsers()).first.address?.geo?.lat, equals('-37.3159'));
      expect((await userRepositoryImpl.getUsers()).first.address?.geo?.lng, equals('81.1496'));
      expect((await userRepositoryImpl.getUsers()).first.phone, equals('1-770-736-8031 x56442'));
      expect((await userRepositoryImpl.getUsers()).first.website, equals('hildegard.org'));
      expect((await userRepositoryImpl.getUsers()).first.company?.name, equals('Romaguera-Crona'));
      expect((await userRepositoryImpl.getUsers()).first.company?.catchPhrase, equals('Multi-layered client-server neural-net'));
      expect((await userRepositoryImpl.getUsers()).first.company?.bs, equals('harness real-time e-markets'));
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
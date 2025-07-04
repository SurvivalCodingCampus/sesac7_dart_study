import 'package:modu_3_dart_study/data_source/user_data_source.dart';
import 'package:modu_3_dart_study/model/address.dart';
import 'package:modu_3_dart_study/model/company.dart';
import 'package:modu_3_dart_study/model/geo.dart';
import 'package:modu_3_dart_study/repository/user_repository.dart';
import 'package:modu_3_dart_study/repository/user_repository_impl.dart';
import 'package:test/test.dart';

import '../mocks/mock_user_data_source_impl.dart';

void main() {
  final UserDataSource dataSource = MockUserDataSourceImpl();
  final UserRepository repository = UserRepositoryImpl(dataSource: dataSource);

  group(
    'getUsers',
    () {
      test('getUsers returns 2 result.', () async {
        // given
        final expectedLength = 2;

        // when
        final result = await repository.getUsers();

        // then
        expect(result.length, expectedLength);
      });

      test('The result of getUsers has all values.', () async {
        // given
        final expectedId = 1;
        final expectedName = "Leanne Graham";
        final expectedUserName = "Bret";
        final expectedEmail = "Sincere@april.biz";
        final expectedAddress = Address(
          street: "Kulas Light",
          suite: "Apt. 556",
          city: "Gwenborough",
          zipcode: "92998-3874",
          geo: Geo(lat: "-37.3159", lng: "81.1496"),
        );
        final expectedPhone = "1-770-736-8031 x56442";
        final expectedWebsite = "hildegard.org";
        final expectedCompany = Company(
          name: "Romaguera-Crona",
          catchPhrase: "Multi-layered client-server neural-net",
          bs: "harness real-time e-markets",
        );

        // when
        final result = await repository.getUsers();
        final user = result.first;

        // then
        expect(user.id, expectedId);
        expect(user.name, expectedName);
        expect(user.username, expectedUserName);
        expect(user.email, expectedEmail);
        expect(user.address, expectedAddress);
        expect(user.phone, expectedPhone);
        expect(user.website, expectedWebsite);
        expect(user.company, expectedCompany);
      });

      test(
        'If an exception is thrown by dataSource, the result of getUsers is an empty list.',
        () async {
          // given
          final expectedResult = [];
          final UserDataSource dataSource = MockUserDataSourceImpl(
            isException: true,
          );
          final UserRepository repository = UserRepositoryImpl(
            dataSource: dataSource,
          );

          // when
          final result = await repository.getUsers();

          // then
          expect(result, expectedResult);
        },
      );
    },
  );

  group(
    'getUsersTop10ByUserName',
    () {
      test('getUsersTop10ByUserName returns 2 result.', () async {
        // given
        final expectedLength = 2;

        // when
        final result = await repository.getUsersTop10ByUserName();

        // then
        expect(result.length, expectedLength);
      });

      test('The result of getUsersTop10ByUserName has all values.', () async {
        // given
        final expectedId = 2;
        final expectedName = "Ervin Howell";
        final expectedUserName = "Antonette";
        final expectedEmail = "Shanna@melissa.tv";
        final expectedAddress = Address(
          street: "Victor Plains",
          suite: "Suite 879",
          city: "Wisokyburgh",
          zipcode: "90566-7771",
          geo: Geo(lat: "-43.9509", lng: "-34.4618"),
        );
        final expectedPhone = "010-692-6593 x09125";
        final expectedWebsite = "anastasia.net";
        final expectedCompany = Company(
          name: "Deckow-Crist",
          catchPhrase: "Proactive didactic contingency",
          bs: "synergize scalable supply-chains",
        );

        // when
        final result = await repository.getUsersTop10ByUserName();
        final user = result.first;

        // then
        expect(user.id, expectedId);
        expect(user.name, expectedName);
        expect(user.username, expectedUserName);
        expect(user.email, expectedEmail);
        expect(user.address, expectedAddress);
        expect(user.phone, expectedPhone);
        expect(user.website, expectedWebsite);
        expect(user.company, expectedCompany);
      });

      test(
        'If an exception is thrown by dataSource, the result of getUsersTop10ByUserName is an empty list.',
        () async {
          // given
          final expectedResult = [];
          final UserDataSource dataSource = MockUserDataSourceImpl(
            isException: true,
          );
          final UserRepository repository = UserRepositoryImpl(
            dataSource: dataSource,
          );

          // when
          final result = await repository.getUsersTop10ByUserName();

          // then
          expect(result, expectedResult);
        },
      );

      test(
        'The list returned by getUsersTop10ByUserName has 10 values when the total data is 11.',
        () async {
          // given
          final expectedLength = 10;
          final UserDataSource dataSource = MockUserDataSourceImpl(
            isOver10Data: true,
          );
          final UserRepository repository = UserRepositoryImpl(
            dataSource: dataSource,
          );

          // when
          final result = await repository.getUsersTop10ByUserName();

          // then
          expect(result.length, expectedLength);
        },
      );
    },
  );
}

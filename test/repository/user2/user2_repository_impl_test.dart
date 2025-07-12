import 'dart:async';

import 'package:modu_3_dart_study/core/network_error.dart';
import 'package:modu_3_dart_study/core/network_validator_impl.dart';
import 'package:modu_3_dart_study/core/result.dart';
import 'package:modu_3_dart_study/data_source/user2/user2_data_source.dart';
import 'package:modu_3_dart_study/model/user2/user2.dart';
import 'package:modu_3_dart_study/repository/user2/user2_repository.dart';
import 'package:modu_3_dart_study/repository/user2/user2_repository_impl.dart';
import 'package:test/test.dart';

import '../../mocks/mock_user2_data_source_impl.dart';

void main() {
  final User2DataSource dataSource = MockUser2DataSourceImpl(statusCode: 200);
  final User2Repository repository = User2RepositoryImpl(
    dataSource: dataSource,
    validator: NetworkValidatorImpl(),
  );
  final userId = 1;
  final user = User2(
    id: userId,
    name: 'Alice Smith',
    age: 28,
    address: '123 Maple St, Anytown',
    phoneNumber: '555-123-4567',
  );

  group(
    'createUser',
    () {
      test(
        'If the statusCode is 200, return the User2 that performed the create.',
        () async {
          // given

          // when
          final result = await repository.createUser(
            name: user.name,
            age: user.age,
            address: user.address,
            phoneNumber: user.phoneNumber,
          );

          // then
          expect(result, Result<User2, NetworkError>.success(user));
        },
      );

      test(
        'Returns NetworkError.notFound if statusCode is 404.',
        () async {
          // given
          final User2DataSource dataSource = MockUser2DataSourceImpl(
            statusCode: 404,
          );
          final User2Repository repository = User2RepositoryImpl(
            dataSource: dataSource,
            validator: NetworkValidatorImpl(),
          );

          // when
          final result = await repository.createUser(
            name: user.name,
            age: user.age,
            address: user.address,
            phoneNumber: user.phoneNumber,
          );

          // then
          expect(
            result,
            Result<User2, NetworkError>.error(NetworkError.notFound),
          );
        },
      );

      test(
        'Returns NetworkError.requestTimeout if a TimeoutException is thrown.',
        () async {
          // given
          final User2DataSource dataSource = MockUser2DataSourceImpl(
            statusCode: 200,
            exception: TimeoutException('message'),
          );
          final User2Repository repository = User2RepositoryImpl(
            dataSource: dataSource,
            validator: NetworkValidatorImpl(),
          );

          // when
          final result = await repository.createUser(
            name: user.name,
            age: user.age,
            address: user.address,
            phoneNumber: user.phoneNumber,
          );

          // then
          expect(
            result,
            Result<User2, NetworkError>.error(NetworkError.requestTimeout),
          );
        },
      );

      test(
        'Returns NetworkError.parseError if a FormatException is thrown.',
        () async {
          // given
          final User2DataSource dataSource = MockUser2DataSourceImpl(
            statusCode: 200,
            exception: FormatException('message'),
          );
          final User2Repository repository = User2RepositoryImpl(
            dataSource: dataSource,
            validator: NetworkValidatorImpl(),
          );

          // when
          final result = await repository.createUser(
            name: user.name,
            age: user.age,
            address: user.address,
            phoneNumber: user.phoneNumber,
          );

          // then
          expect(
            result,
            Result<User2, NetworkError>.error(NetworkError.parseError),
          );
        },
      );
    },
  );

  group(
    'getUser',
    () {
      test(
        'Returns User2 if a user with the matching id exists.',
        () async {
          // given

          // when
          final result = await repository.getUser(userId);

          // then
          expect(result, Result<User2, NetworkError>.success(user));
        },
      );

      test(
        'Returns NetworkError.notFound if no user with a matching id exists.',
        () async {
          // given
          final wrongId = -1;

          // when
          final result = await repository.getUser(wrongId);

          // then
          expect(
            result,
            Result<User2, NetworkError>.error(NetworkError.notFound),
          );
        },
      );

      test(
        'Returns NetworkError.notFound if statusCode is 404.',
        () async {
          // given
          final User2DataSource dataSource = MockUser2DataSourceImpl(
            statusCode: 404,
          );
          final User2Repository repository = User2RepositoryImpl(
            dataSource: dataSource,
            validator: NetworkValidatorImpl(),
          );

          // when
          final result = await repository.getUser(userId);

          // then
          expect(
            result,
            Result<User2, NetworkError>.error(NetworkError.notFound),
          );
        },
      );

      test(
        'Returns NetworkError.requestTimeout if a TimeoutException is thrown.',
        () async {
          // given
          final User2DataSource dataSource = MockUser2DataSourceImpl(
            statusCode: 200,
            exception: TimeoutException('message'),
          );
          final User2Repository repository = User2RepositoryImpl(
            dataSource: dataSource,
            validator: NetworkValidatorImpl(),
          );

          // when
          final result = await repository.getUser(userId);

          // then
          expect(
            result,
            Result<User2, NetworkError>.error(NetworkError.requestTimeout),
          );
        },
      );

      test(
        'Returns NetworkError.parseError if a FormatException is thrown.',
        () async {
          // given
          final User2DataSource dataSource = MockUser2DataSourceImpl(
            statusCode: 200,
            exception: FormatException('message'),
          );
          final User2Repository repository = User2RepositoryImpl(
            dataSource: dataSource,
            validator: NetworkValidatorImpl(),
          );

          // when
          final result = await repository.getUser(userId);

          // then
          expect(
            result,
            Result<User2, NetworkError>.error(NetworkError.parseError),
          );
        },
      );
    },
  );

  group(
    'getUsers',
    () {
      test(
        'If the statusCode is 200, return the User2 list.',
        () async {
          // given
          final users = [
            user,
            User2(
              id: 2,
              name: "Bob Johnson",
              age: 34,
              address: "456 Oak Ave, Somewhere",
              phoneNumber: "555-987-6543",
            ),
            User2(
              id: 3,
              name: "Charlie Brown",
              age: 22,
              address: "789 Pine Ln, Nowhere",
              phoneNumber: "555-111-2222",
            ),
          ];

          // when
          final result = await repository.getUsers();

          // then
          expect(result, Result<List<User2>, NetworkError>.success(users));
        },
      );

      test(
        'Returns NetworkError.notFound if statusCode is 404.',
        () async {
          // given
          final User2DataSource dataSource = MockUser2DataSourceImpl(
            statusCode: 404,
          );
          final User2Repository repository = User2RepositoryImpl(
            dataSource: dataSource,
            validator: NetworkValidatorImpl(),
          );

          // when
          final result = await repository.getUsers();

          // then
          expect(
            result,
            Result<List<User2>, NetworkError>.error(NetworkError.notFound),
          );
        },
      );

      test(
        'Returns NetworkError.requestTimeout if a TimeoutException is thrown.',
        () async {
          // given
          final User2DataSource dataSource = MockUser2DataSourceImpl(
            statusCode: 200,
            exception: TimeoutException('message'),
          );
          final User2Repository repository = User2RepositoryImpl(
            dataSource: dataSource,
            validator: NetworkValidatorImpl(),
          );

          // when
          final result = await repository.getUsers();

          // then
          expect(
            result,
            Result<List<User2>, NetworkError>.error(
              NetworkError.requestTimeout,
            ),
          );
        },
      );

      test(
        'Returns NetworkError.parseError if a FormatException is thrown.',
        () async {
          // given
          final User2DataSource dataSource = MockUser2DataSourceImpl(
            statusCode: 200,
            exception: FormatException('message'),
          );
          final User2Repository repository = User2RepositoryImpl(
            dataSource: dataSource,
            validator: NetworkValidatorImpl(),
          );

          // when
          final result = await repository.getUsers();

          // then
          expect(
            result,
            Result<List<User2>, NetworkError>.error(NetworkError.parseError),
          );
        },
      );
    },
  );
}

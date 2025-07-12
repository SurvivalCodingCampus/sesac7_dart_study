import 'package:modu_3_dart_study/18_result_pattern/core/network_error.dart';
import 'package:modu_3_dart_study/18_result_pattern/core/result.dart';
import 'package:modu_3_dart_study/18_result_pattern/model/user.dart';
import 'package:modu_3_dart_study/18_result_pattern/repository/user_repository_impl.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../../mocks/mock_user_data_source_impl_for_result.dart';

void main() {
  group('UserRepositoryImpl Network Test', () {
    final baseUrl = 'https://test.com/users';
    final unauthorized = 'unauthorized';
    final timeout = 'timeout';
    final notFound = 'not_found';
    final parseError = 'parseError';
    final unknown = '????';

    group('getUser Success, fail Test', () {
      test('getUser Success Test', () async {
        final dataSource = MockUserDataSourceImpl();
        final repository = UserRepositoryImpl(dataSource);
        final result = await repository.getUser(1);
        switch (result) {
          case Success<User, NetworkError>():
            final user = result.data;
            expect(user.id, 1);
            expect(user.name, 'Kim');
          case Error<User, NetworkError>():
            switch (result.error) {
              case NetworkError.requestTimeout:
                expect(result.error, NetworkError.requestTimeout);
              case NetworkError.unauthorized:
                expect(result.error, NetworkError.unauthorized);
              case NetworkError.notFound:
                expect(result.error, NetworkError.notFound);
              case NetworkError.serverError:
                expect(result.error, NetworkError.serverError);
              case NetworkError.parseError:
                expect(result.error, NetworkError.parseError);
              default:
                expect(result.error, NetworkError.unknown);
            }
        }
      });
      test('getUser unauthorized Test', () async {
        final dataSource = MockUserDataSourceImpl();
        dataSource.baseUrl = baseUrl + unauthorized;
        final repository = UserRepositoryImpl(dataSource);
        final result = await repository.getUser(1);
        switch (result) {
          case Success<User, NetworkError>():
            final user = result.data;
            expect(user.id, 1);
            expect(user.name, 'Kim');
          case Error<User, NetworkError>():
            switch (result.error) {
              case NetworkError.requestTimeout:
                expect(result.error, NetworkError.requestTimeout);
              case NetworkError.unauthorized:
                expect(result.error, NetworkError.unauthorized);
              case NetworkError.notFound:
                expect(result.error, NetworkError.notFound);
              case NetworkError.serverError:
                expect(result.error, NetworkError.serverError);
              case NetworkError.parseError:
                expect(result.error, NetworkError.parseError);
              default:
                expect(result.error, NetworkError.unknown);
            }
        }
      });
      test('getUser timeout Test', () async {
        final dataSource = MockUserDataSourceImpl();
        final repository = UserRepositoryImpl(dataSource);
        dataSource.baseUrl = baseUrl + timeout;
        final result = await repository.getUser(1);
        switch (result) {
          case Success<User, NetworkError>():
            final user = result.data;
            expect(user.id, 1);
            expect(user.name, 'Kim');
          case Error<User, NetworkError>():
            switch (result.error) {
              case NetworkError.requestTimeout:
                expect(result.error, NetworkError.requestTimeout);
              case NetworkError.unauthorized:
                expect(result.error, NetworkError.unauthorized);
              case NetworkError.notFound:
                expect(result.error, NetworkError.notFound);
              case NetworkError.serverError:
                expect(result.error, NetworkError.serverError);
              case NetworkError.parseError:
                expect(result.error, NetworkError.parseError);
              default:
                expect(result.error, NetworkError.unknown);
            }
        }
      });
      test('getUser not found Test', () async {
        final dataSource = MockUserDataSourceImpl();
        final repository = UserRepositoryImpl(dataSource);
        dataSource.baseUrl = baseUrl + notFound;
        final result = await repository.getUser(1);
        switch (result) {
          case Success<User, NetworkError>():
            final user = result.data;
            expect(user.id, 1);
            expect(user.name, 'Kim');
          case Error<User, NetworkError>():
            switch (result.error) {
              case NetworkError.requestTimeout:
                expect(result.error, NetworkError.requestTimeout);
              case NetworkError.unauthorized:
                expect(result.error, NetworkError.unauthorized);
              case NetworkError.notFound:
                expect(result.error, NetworkError.notFound);
              case NetworkError.serverError:
                expect(result.error, NetworkError.serverError);
              case NetworkError.parseError:
                expect(result.error, NetworkError.parseError);
              default:
                expect(result.error, NetworkError.unknown);
            }
        }
      });
      test('getUser parse error Test', () async {
        final dataSource = MockUserDataSourceImpl();
        final repository = UserRepositoryImpl(dataSource);
        dataSource.baseUrl = baseUrl + parseError;
        final result = await repository.getUser(1);
        switch (result) {
          case Success<User, NetworkError>():
            final user = result.data;
            expect(user.id, 1);
            expect(user.name, 'Kim');
          case Error<User, NetworkError>():
            switch (result.error) {
              case NetworkError.requestTimeout:
                expect(result.error, NetworkError.requestTimeout);
              case NetworkError.unauthorized:
                expect(result.error, NetworkError.unauthorized);
              case NetworkError.notFound:
                expect(result.error, NetworkError.notFound);
              case NetworkError.serverError:
                expect(result.error, NetworkError.serverError);
              case NetworkError.parseError:
                expect(result.error, NetworkError.parseError);
              default:
                expect(result.error, NetworkError.unknown);
            }
        }
      });
      test('getUser Success, fail Test', () async {
        final dataSource = MockUserDataSourceImpl();
        final repository = UserRepositoryImpl(dataSource);
        dataSource.baseUrl = unknown;
        final result = await repository.getUser(1);
        switch (result) {
          case Success<User, NetworkError>():
            final user = result.data;
            expect(user.id, 1);
            expect(user.name, 'Kim');
          case Error<User, NetworkError>():
            switch (result.error) {
              case NetworkError.requestTimeout:
                expect(result.error, NetworkError.requestTimeout);
              case NetworkError.unauthorized:
                expect(result.error, NetworkError.unauthorized);
              case NetworkError.notFound:
                expect(result.error, NetworkError.notFound);
              case NetworkError.serverError:
                expect(result.error, NetworkError.serverError);
              case NetworkError.parseError:
                expect(result.error, NetworkError.parseError);
              default:
                expect(result.error, NetworkError.unknown);
            }
        }
      });
    });

    test('getUsers Success, fail Test', () async {
      final dataSource = MockUserDataSourceImpl();
      final repository = UserRepositoryImpl(dataSource);
      final result = await repository.getUsers();
      switch (result) {
        case Success<List<User>, NetworkError>():
          final users = result.data;
          expect(users.length, 3);
        case Error<List<User>, NetworkError>():
          switch (result.error) {
            case NetworkError.requestTimeout:
              expect(result.error, NetworkError.requestTimeout);
            case NetworkError.unauthorized:
              expect(result.error, NetworkError.unauthorized);
            case NetworkError.notFound:
              expect(result.error, NetworkError.notFound);
            case NetworkError.serverError:
              expect(result.error, NetworkError.serverError);
            case NetworkError.parseError:
              expect(result.error, NetworkError.parseError);
            default:
              expect(result.error, NetworkError.unknown);
          }
      }
    });

    test('createUser Success, fail Test', () async {
      final user = User(id: 4, name: 'Jo');
      final dataSource = MockUserDataSourceImpl();
      final repository = UserRepositoryImpl(dataSource);
      final result = await repository.createUser('Jo');
      switch (result) {
        case Success<String, NetworkError>():
          final response = result.data;
          expect(response, '생성 성공 ${user.toString()}');
        case Error<String, NetworkError>():
          switch (result.error) {
            case NetworkError.requestTimeout:
              expect(result.error, NetworkError.requestTimeout);
            case NetworkError.unauthorized:
              expect(result.error, NetworkError.unauthorized);
            case NetworkError.notFound:
              expect(result.error, NetworkError.notFound);
            case NetworkError.serverError:
              expect(result.error, NetworkError.serverError);
            case NetworkError.parseError:
              expect(result.error, NetworkError.parseError);
            default:
              expect(result.error, NetworkError.unknown);
          }
      }
    });
  });
}

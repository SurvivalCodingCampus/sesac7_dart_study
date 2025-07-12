import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:modu_3_dart_study/250710/core/enums.dart';
import 'package:modu_3_dart_study/250710/core/response.dart';
import 'package:modu_3_dart_study/250710/core/result.dart';
import 'package:modu_3_dart_study/250710/data_source/remote_user_data_source_impl.dart';
import 'package:modu_3_dart_study/250710/data_source/user_data_source.dart';
import 'package:modu_3_dart_study/250710/dto/user_dto.dart';
import 'package:modu_3_dart_study/250710/model/user.dart';
import 'package:modu_3_dart_study/250710/repository/user_repository_impl.dart';
import 'package:test/test.dart';

import 'user_repository_impl_test.mocks.dart';

@GenerateMocks([RemoteUserDataSourceImpl]) //표시
void main() {
  group('user_repository_impl getUser test', () {
    test('Success', () async {
      final UserDataSource dataSource = MockRemoteUserDataSourceImpl();
      final userRepository = UserRepositoryImpl(dataSource);

      when(
        dataSource.getUser(id: 0),
      ).thenAnswer((_) async {
        await Future.delayed(Duration(seconds: 1));
        return Response<UserDto>(
          statusCode: 200,
          header: {},
          body: UserDto(id: 0, name: 'Sujin0'),
        );
      });

      final result =
          (await userRepository.getUser(id: 0)) as Success<User, NetworkError>;
      expect(result.data.id, 0);
      expect(result.data.name, 'Sujin0');
    });

    test('NetworkError.parseError', () async {
      final UserDataSource dataSource = MockRemoteUserDataSourceImpl();
      final userRepository = UserRepositoryImpl(dataSource);

      when(
        dataSource.getUser(id: 0),
      ).thenAnswer((_) async {
        await Future.delayed(Duration(seconds: 1));
        return Response<UserDto>(
          statusCode: 200,
          header: {},
          body: UserDto(id: '0', name: 'Sujin0'),
        );
      });

      final result =
          (await userRepository.getUser(id: 0)) as Error<User, NetworkError>;
      expect(result.e.statusCode, NetworkError.parseError.statusCode);
    });

    test('11초, NetworkError.requestTimeout', () async {
      final UserDataSource dataSource = MockRemoteUserDataSourceImpl();
      final userRepository = UserRepositoryImpl(dataSource);

      when(
        dataSource.getUser(id: 0),
      ).thenAnswer((_) async {
        await Future.delayed(Duration(seconds: 11));
        return Response<UserDto>(
          statusCode: 200,
          header: {},
          body: UserDto(id: '0', name: 'Sujin0'),
        );
      });

      final result =
          (await userRepository.getUser(id: 0)) as Error<User, NetworkError>;
      expect(result.e.statusCode, NetworkError.requestTimeout.statusCode);
    });

    test('NetworkError.notFound', () async {
      final UserDataSource dataSource = MockRemoteUserDataSourceImpl();
      final userRepository = UserRepositoryImpl(dataSource);

      when(
        dataSource.getUser(id: 0),
      ).thenAnswer((_) async {
        await Future.delayed(Duration(seconds: 1));
        return Response<UserDto>(
          statusCode: NetworkError.notFound.statusCode,
          header: {},
          body: UserDto(id: null, name: null),
        );
      });

      final result =
          (await userRepository.getUser(id: 0)) as Error<User, NetworkError>;
      expect(result.e.statusCode, NetworkError.notFound.statusCode);
    });

    test('NetworkError.serverError', () async {
      final UserDataSource dataSource = MockRemoteUserDataSourceImpl();
      final userRepository = UserRepositoryImpl(dataSource);

      when(
        dataSource.getUser(id: 0),
      ).thenAnswer((_) async {
        await Future.delayed(Duration(seconds: 1));
        return Response<UserDto>(
          statusCode: NetworkError.serverError.statusCode,
          header: {},
          body: UserDto(id: null, name: null),
        );
      });

      final result =
          (await userRepository.getUser(id: 0)) as Error<User, NetworkError>;
      expect(result.e.statusCode, NetworkError.serverError.statusCode);
    });

    test('NetworkError.unauthorized', () async {
      final UserDataSource dataSource = MockRemoteUserDataSourceImpl();
      final userRepository = UserRepositoryImpl(dataSource);

      when(
        dataSource.getUser(id: 0),
      ).thenAnswer((_) async {
        await Future.delayed(Duration(seconds: 1));
        return Response<UserDto>(
          statusCode: NetworkError.unauthorized.statusCode,
          header: {},
          body: UserDto(id: null, name: null),
        );
      });

      final result =
          (await userRepository.getUser(id: 0)) as Error<User, NetworkError>;
      expect(result.e.statusCode, NetworkError.unauthorized.statusCode);
    });

    test('NetworkError.unknown', () async {
      final UserDataSource dataSource = MockRemoteUserDataSourceImpl();
      final userRepository = UserRepositoryImpl(dataSource);

      when(
        dataSource.getUser(id: 0),
      ).thenAnswer((_) async {
        await Future.delayed(Duration(seconds: 1));
        return Response<UserDto>(
          statusCode: NetworkError.unknown.statusCode,
          header: {},
          body: UserDto(id: null, name: null),
        );
      });

      final result =
          (await userRepository.getUser(id: 0)) as Error<User, NetworkError>;
      expect(result.e.statusCode, NetworkError.unknown.statusCode);
    });
  });

  group('user_repository_impl getUsers test', () {
    test('Success', () async {
      final UserDataSource dataSource = MockRemoteUserDataSourceImpl();
      final userRepository = UserRepositoryImpl(dataSource);

      when(
        dataSource.getUsers(),
      ).thenAnswer((_) async {
        await Future.delayed(Duration(seconds: 1));
        return Response<List<UserDto>>(
          statusCode: 200,
          header: {},
          body: [
            UserDto(id: 0, name: 'Sujin0'),
            UserDto(id: 1, name: 'Sujin1'),
            UserDto(id: 2, name: 'Sujin2'),
            UserDto(id: 3, name: 'Sujin3'),
            UserDto(id: 4, name: 'Sujin4'),
          ],
        );
      });

      final result =
          (await userRepository.getUsers())
              as Success<List<User>, NetworkError>;
      expect(result.data.first.id, 0);
      expect(result.data.first.name, 'Sujin0');
    });

    test('NetworkError.parseError', () async {
      final UserDataSource dataSource = MockRemoteUserDataSourceImpl();
      final userRepository = UserRepositoryImpl(dataSource);

      when(
        dataSource.getUsers(),
      ).thenAnswer((_) async {
        await Future.delayed(Duration(seconds: 1));
        return Response(
          statusCode: 200,
          header: {},
          body: [
            UserDto(id: 0, name: 'Sujin0'),
            UserDto(id: "1", name: 'Sujin1'),
            UserDto(id: 2, name: null),
            UserDto(id: 3, name: 'Sujin3'),
            UserDto(id: 4, name: 'Sujin4'),
          ],
        );
      });

      final result = await userRepository.getUsers();
      if (result is Error<List<User>, NetworkError>) {
        expect(result.e.statusCode, NetworkError.parseError.statusCode);
      }
    });

    test('11초, NetworkError.requestTimeout', () async {
      final UserDataSource dataSource = MockRemoteUserDataSourceImpl();
      final userRepository = UserRepositoryImpl(dataSource);

      when(
        dataSource.getUsers(),
      ).thenAnswer((_) async {
        await Future.delayed(Duration(seconds: 11));
        return Response<List<UserDto>>(
          statusCode: 200,
          header: {},
          body: [
            UserDto(id: 0, name: 'Sujin0'),
            UserDto(id: 1, name: 'Sujin1'),
            UserDto(id: 2, name: 'Sujin2'),
            UserDto(id: 3, name: 'Sujin3'),
            UserDto(id: 4, name: 'Sujin4'),
          ],
        );
      });

      final result =
          (await userRepository.getUsers()) as Error<List<User>, NetworkError>;
      expect(result.e.statusCode, NetworkError.requestTimeout.statusCode);
    });

    test('NetworkError.notFound', () async {
      final UserDataSource dataSource = MockRemoteUserDataSourceImpl();
      final userRepository = UserRepositoryImpl(dataSource);

      when(
        dataSource.getUsers(),
      ).thenAnswer((_) async {
        await Future.delayed(Duration(seconds: 1));
        return Response(
          statusCode: NetworkError.notFound.statusCode,
          header: {},
          body: [
            UserDto(id: 0, name: 'Sujin0'),
            UserDto(id: 1, name: 'Sujin1'),
            UserDto(id: 2, name: 'Sujin2'),
            UserDto(id: 3, name: 'Sujin3'),
            UserDto(id: 4, name: 'Sujin4'),
          ],
        );
      });

      final result =
          (await userRepository.getUsers()) as Error<List<User>, NetworkError>;
      expect(result.e.statusCode, NetworkError.notFound.statusCode);
    });

    test('NetworkError.serverError', () async {
      final UserDataSource dataSource = MockRemoteUserDataSourceImpl();
      final userRepository = UserRepositoryImpl(dataSource);

      when(
        dataSource.getUsers(),
      ).thenAnswer((_) async {
        await Future.delayed(Duration(seconds: 1));
        return Response<List<UserDto>>(
          statusCode: NetworkError.serverError.statusCode,
          header: {},
          body: [
            UserDto(id: 0, name: 'Sujin0'),
            UserDto(id: 1, name: 'Sujin1'),
            UserDto(id: 2, name: 'Sujin2'),
            UserDto(id: 3, name: 'Sujin3'),
            UserDto(id: 4, name: 'Sujin4'),
          ],
        );
      });

      final result =
          (await userRepository.getUsers()) as Error<List<User>, NetworkError>;
      expect(result.e.statusCode, NetworkError.serverError.statusCode);
    });

    test('NetworkError.unauthorized', () async {
      final UserDataSource dataSource = MockRemoteUserDataSourceImpl();
      final userRepository = UserRepositoryImpl(dataSource);

      when(
        dataSource.getUsers(),
      ).thenAnswer((_) async {
        await Future.delayed(Duration(seconds: 1));
        return Response<List<UserDto>>(
          statusCode: NetworkError.unauthorized.statusCode,
          header: {},
          body: [
            UserDto(id: 0, name: 'Sujin0'),
            UserDto(id: 1, name: 'Sujin1'),
            UserDto(id: 2, name: 'Sujin2'),
            UserDto(id: 3, name: 'Sujin3'),
            UserDto(id: 4, name: 'Sujin4'),
          ],
        );
      });

      final result =
          (await userRepository.getUsers()) as Error<List<User>, NetworkError>;
      expect(result.e.statusCode, NetworkError.unauthorized.statusCode);
    });

    test('NetworkError.unknown', () async {
      final UserDataSource dataSource = MockRemoteUserDataSourceImpl();
      final userRepository = UserRepositoryImpl(dataSource);

      when(
        dataSource.getUsers(),
      ).thenAnswer((_) async {
        await Future.delayed(Duration(seconds: 1));
        return Response<List<UserDto>>(
          statusCode: NetworkError.unknown.statusCode,
          header: {},
          body: [
            UserDto(id: 0, name: 'Sujin0'),
            UserDto(id: 1, name: 'Sujin1'),
            UserDto(id: 2, name: 'Sujin2'),
            UserDto(id: 3, name: 'Sujin3'),
            UserDto(id: 4, name: 'Sujin4'),
          ],
        );
      });

      final result =
          (await userRepository.getUsers()) as Error<List<User>, NetworkError>;
      expect(result.e.statusCode, NetworkError.unknown.statusCode);
    });
  });

  group('user_repository_impl addUser test', () {
    test('Success', () async {
      final UserDataSource dataSource = MockRemoteUserDataSourceImpl();
      final userRepository = UserRepositoryImpl(dataSource);

      when(
        dataSource.addUser(userDto: UserDto(id: 1, name: 'Sujin1')),
      ).thenAnswer((_) async {
        await Future.delayed(Duration(seconds: 1));
        return Response<UserDto>(
          statusCode: 200,
          header: {},
          body: UserDto(id: 4, name: 'Sujin4'),
        );
      });

      final result =
          (await userRepository.addUser(user: User(id: 1, name: 'Sujin1')))
              as Success<User, NetworkError>;
      expect(result.data.id, 4);
      expect(result.data.name, 'Sujin4');
    });

    test('NetworkError.parseError', () async {
      final UserDataSource dataSource = MockRemoteUserDataSourceImpl();
      final userRepository = UserRepositoryImpl(dataSource);

      when(
        dataSource.addUser(userDto: UserDto(id: 1, name: 'Sujin1')),
      ).thenAnswer((_) async {
        await Future.delayed(Duration(seconds: 1));
        return Response<UserDto>(
          statusCode: 200,
          header: {},
          body: UserDto(id: '2', name: 'Sujin2'),
        );
      });

      final result =
          (await userRepository.addUser(user: User(id: 1, name: 'Sujin1')))
              as Error<User, NetworkError>;
      expect(result.e.statusCode, NetworkError.parseError.statusCode);
    });

    test('11초, NetworkError.requestTimeout', () async {
      final UserDataSource dataSource = MockRemoteUserDataSourceImpl();
      final userRepository = UserRepositoryImpl(dataSource);

      when(
        dataSource.addUser(userDto: UserDto(id: 1, name: 'Sujin1')),
      ).thenAnswer((_) async {
        await Future.delayed(Duration(seconds: 11));
        return Response<UserDto>(
          statusCode: 200,
          header: {},
          body: UserDto(id: 1, name: 'Sujin1'),
        );
      });

      final result =
          (await userRepository.addUser(user: User(id: 1, name: 'Sujin1')))
              as Error<User, NetworkError>;
      expect(result.e.statusCode, NetworkError.requestTimeout.statusCode);
    });

    test('NetworkError.notFound', () async {
      final UserDataSource dataSource = MockRemoteUserDataSourceImpl();
      final userRepository = UserRepositoryImpl(dataSource);

      when(
        dataSource.addUser(userDto: UserDto(id: 1, name: 'Sujin1')),
      ).thenAnswer((_) async {
        await Future.delayed(Duration(seconds: 1));
        return Response<UserDto>(
          statusCode: NetworkError.notFound.statusCode,
          header: {},
          body: UserDto(id: 1, name: 'Sujin1'),
        );
      });

      final result =
          (await userRepository.addUser(user: User(id: 1, name: 'Sujin1')))
              as Error<User, NetworkError>;
      expect(result.e.statusCode, NetworkError.notFound.statusCode);
    });

    test('NetworkError.serverError', () async {
      final UserDataSource dataSource = MockRemoteUserDataSourceImpl();
      final userRepository = UserRepositoryImpl(dataSource);

      when(
        dataSource.addUser(userDto: UserDto(id: 1, name: 'Sujin1')),
      ).thenAnswer((_) async {
        await Future.delayed(Duration(seconds: 1));
        return Response<UserDto>(
          statusCode: NetworkError.serverError.statusCode,
          header: {},
          body: UserDto(id: 1, name: 'Sujin1'),
        );
      });

      final result =
          (await userRepository.addUser(user: User(id: 1, name: 'Sujin1')))
              as Error<User, NetworkError>;
      expect(result.e.statusCode, NetworkError.serverError.statusCode);
    });

    test('NetworkError.unauthorized', () async {
      final UserDataSource dataSource = MockRemoteUserDataSourceImpl();
      final userRepository = UserRepositoryImpl(dataSource);

      when(
        dataSource.addUser(userDto: UserDto(id: 1, name: 'Sujin1')),
      ).thenAnswer((_) async {
        await Future.delayed(Duration(seconds: 1));
        return Response<UserDto>(
          statusCode: NetworkError.unauthorized.statusCode,
          header: {},
          body: UserDto(id: 1, name: 'Sujin1'),
        );
      });

      final result =
          (await userRepository.addUser(user: User(id: 1, name: 'Sujin1')))
              as Error<User, NetworkError>;
      expect(result.e.statusCode, NetworkError.unauthorized.statusCode);
    });

    test('NetworkError.unknown', () async {
      final UserDataSource dataSource = MockRemoteUserDataSourceImpl();
      final userRepository = UserRepositoryImpl(dataSource);

      when(
        dataSource.addUser(userDto: UserDto(id: 1, name: 'Sujin1')),
      ).thenAnswer((_) async {
        await Future.delayed(Duration(seconds: 1));
        return Response<UserDto>(
          statusCode: NetworkError.unknown.statusCode,
          header: {},
          body: UserDto(id: 1, name: 'Sujin1'),
        );
      });

      final result =
          (await userRepository.addUser(user: User(id: 1, name: 'Sujin1')))
              as Error<User, NetworkError>;
      expect(result.e.statusCode, NetworkError.unknown.statusCode);
    });
  });
}

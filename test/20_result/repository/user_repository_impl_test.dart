import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:modu_3_dart_study/18_http/core/response.dart';
import 'package:modu_3_dart_study/20_result/core/network_error.dart';
import 'package:modu_3_dart_study/20_result/core/result.dart';
import 'package:modu_3_dart_study/20_result/data_source/user_data_source_impl.dart';
import 'package:modu_3_dart_study/20_result/dto/user_dto.dart';
import 'package:modu_3_dart_study/20_result/model/user.dart';
import 'package:modu_3_dart_study/20_result/repository/user_repository.dart';
import 'package:modu_3_dart_study/20_result/repository/user_repository_impl.dart';
import 'package:test/test.dart';

import '../../mocks/mock_status_code_user_data_source_impl.dart';
import '../../mocks/mock_timeout_user_data_source_impl.dart';

import 'package:modu_3_dart_study/20_result/data_source/user_data_source.dart';

import 'user_repository_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<UserDataSource>()])
void main() {
  test('잘못된 Json String', () async {
    final UserDataSource mockUserDataSource = MockUserDataSource();
    final UserRepository userRepository = UserRepositoryImpl(
      mockUserDataSource,
    );

    when(mockUserDataSource.getUsers()).thenAnswer((_) async {
      final json = """[
      {"id": 1, "name": "1", "email": "1"},
      {"id": 2, "name": "2", "email": "2"}
      ]
      """;

      return Response<List<UserDto>>(
        statusCode: 200,
        header: {},
        body: (jsonDecode(json) as List)
            .map((e) => UserDto.fromJson(e))
            .toList(),
      );
    });

    final result = await userRepository.getUsers();
    expect(
      result,
      Result<List<User>, NetworkError>.success([
        User(id: 1, name: '1', email: '1'),
        User(id: 2, name: '2', email: '2'),
      ]),
    );

    verify(mockUserDataSource.getUsers()).called(1);
  });

  test('타임아웃 10초 테스트', () async {
    final UserDataSource mockUserDataSource = MockTimeoutUserDataSourceImpl();
    final UserRepository userRepository = UserRepositoryImpl(
      mockUserDataSource,
    );

    final result = await userRepository.getUser(1);
    expect(
      result,
      Result<User, NetworkError>.error(NetworkError.requestTimeout),
    );
  });

  test('status code 테스트', () async {
    final UserDataSource mockUserDataSource =
        MockStatusCodeUserDataSourceImpl();
    final UserRepository userRepository = UserRepositoryImpl(
      mockUserDataSource,
    );

    var result = await userRepository.getUser(200);
    expect(
      result,
      Result<User, NetworkError>.success(
        User(id: 200, name: '200', email: '200'),
      ),
    );

    result = await userRepository.getUser(404);
    expect(
      result,
      Result<User, NetworkError>.error(NetworkError.notFound),
    );

    result = await userRepository.getUser(500);
    expect(
      result,
      Result<User, NetworkError>.error(NetworkError.serverError),
    );

    result = await userRepository.getUser(401);
    expect(
      result,
      Result<User, NetworkError>.error(NetworkError.unauthorized),
    );

    result = await userRepository.getUser(600);
    expect(
      result,
      Result<User, NetworkError>.error(NetworkError.unknown),
    );
  });

  test('Json 파싱 에러', () async {
    final http.Client client = MockClient((request) async {
      return http.Response('''{id: '1'}''', 200);
    });

    final UserDataSource mockUserDataSource = UserDataSourceImpl(
      client: client,
    );
    final UserRepository userRepository = UserRepositoryImpl(
      mockUserDataSource,
    );

    final result = await userRepository.getUser(1);
    expect(
      result,
      Result<User, NetworkError>.error(NetworkError.parseError),
    );
  });
}

import 'dart:convert';

import 'package:http/testing.dart';
import 'package:modu_3_dart_study/20250710/core/network_error.dart';
import 'package:modu_3_dart_study/20250710/core/result.dart';
import 'package:modu_3_dart_study/20250710/model/user.dart';
import 'package:modu_3_dart_study/20250710/repository/user_repository_impl.dart';
import 'package:modu_3_dart_study/20250710/data_source/user_data_source_impl.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';
import 'package:http/http.dart' as http;

void main() {
  group('user 통신 테스트', () {
    test('user 데이터 오류(서버오류) 테스트', () async {
      final mockClient = MockClient((request) async {
        return http.Response(jsonEncode({
        }), 500);
      });
      UserDataSourceImpl userDataSourceImpl = UserDataSourceImpl(client: mockClient);
      UserRepositoryImpl userRepositoryImpl = UserRepositoryImpl(userDataSourceImpl);
      final result = await userRepositoryImpl.getUsers();

      if (result is Error<List<User>, NetworkError>) {
        expect(result.error , NetworkError.serverError);
      }
    });

    test('user 데이터 오류(페이지없음) 테스트', () async {
      final mockClient = MockClient((request) async {
        return http.Response(jsonEncode({
        }), 404);
      });
      UserDataSourceImpl userDataSourceImpl = UserDataSourceImpl(client: mockClient);
      UserRepositoryImpl userRepositoryImpl = UserRepositoryImpl(userDataSourceImpl);
      final result = await userRepositoryImpl.getUsers();

      if (result is Error<List<User>, NetworkError>) {
        expect(result.error , NetworkError.notFound);
      }
    });

    test('user 데이터 오류(인증오류) 테스트', () async {
      final mockClient = MockClient((request) async {
        return http.Response(jsonEncode({
        }), 401);
      });
      UserDataSourceImpl userDataSourceImpl = UserDataSourceImpl(client: mockClient);
      UserRepositoryImpl userRepositoryImpl = UserRepositoryImpl(userDataSourceImpl);
      final result = await userRepositoryImpl.getUsers();

      if (result is Error<List<User>, NetworkError>) {
        expect(result.error , NetworkError.unauthorized);
      }
    });

    test('user 데이터 오류(timeout) 테스트', () async {
      final mockClient = MockClient((request) async {
        await Future.delayed(Duration(seconds: 5)); // 테스트를 위해 client timeout을 3초로 했음
        return http.Response(jsonEncode({
        }), 200);
      });
      UserDataSourceImpl userDataSourceImpl = UserDataSourceImpl(client: mockClient);
      UserRepositoryImpl userRepositoryImpl = UserRepositoryImpl(userDataSourceImpl);
      final result = await userRepositoryImpl.getUsers();

      if (result is Error<List<User>, NetworkError>) {
        expect(result.error , NetworkError.requestTimeout);
      }
    });

    test('user 데이터 오류(파싱오류) 테스트', () async {
      final mockClient = MockClient((request) async {
        return http.Response('[', 200);
      });
      UserDataSourceImpl userDataSourceImpl = UserDataSourceImpl(client: mockClient);
      UserRepositoryImpl userRepositoryImpl = UserRepositoryImpl(userDataSourceImpl);
      final result = await userRepositoryImpl.getUsers();

      if (result is Error<List<User>, NetworkError>) {
        expect(result.error , NetworkError.parseError);
      }
    });
  });
}
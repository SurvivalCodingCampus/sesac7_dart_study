import 'dart:convert';

import 'package:http/testing.dart';
import 'package:modu_3_dart_study/core/network_error.dart';
import 'package:modu_3_dart_study/core/result.dart';
import 'package:modu_3_dart_study/dto/app_user_dto.dart';
import 'package:modu_3_dart_study/model/app_user.dart';
import 'package:modu_3_dart_study/repository/app_user_repository_impl.dart';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;
import 'package:modu_3_dart_study/data_source/remote/app_user_data_source_impl.dart';

void main() {
  test('getUser의 실제 api 호출이 정상적으로 작동한다', () async {
    final dataSource = AppUserDataSourceImpl(
      baseUrl: 'http://jsonplaceholder.typicode.com/posts',
    );
    final result = await dataSource.getUser(1);

    switch (result) {
      case Success<AppUser, NetworkError> success:
        expect(success.value.id, equals(1));
        break;
      case Failure<AppUser, NetworkError> failure:
        fail('api 호출 실패: ${failure.error}');
    }
  });

  test('getUserList 실제 api 호출이 정상적으로 작동한다', () async {
    final dataSource = AppUserDataSourceImpl(
      baseUrl: 'http://jsonplaceholder.typicode.com/posts',
    );
    final result = await dataSource.getUserList();

    switch (result) {
      case Success<List<AppUser>, NetworkError> success:
        expect(success.value[0].userId, equals(1));
        break;
      case Failure<List<AppUser>, NetworkError> failure:
        fail('api 호출 실패: ${failure.error}');
    }
  });

  test('creatUser 실제 api 호출이 정상적으로 작동한다', () async {
    final mockClient = MockClient((request) async {
      final mockResponse = {"userId": 1, "id": 101, "title": "mockUser"};

      return http.Response(jsonEncode(mockResponse), 201); // 201 Created
    });

    final dataSource = AppUserRepositoryImpl(
      AppUserDataSourceImpl(
        client: mockClient,
        baseUrl: 'https://mock.api/create',
      ),
    );

    final AppUser mockUser = AppUser(userId: 1, id: 101, title: 'mockUser');
    final result = await dataSource.createUser(mockUser);

    switch (result) {
      case Success<AppUserDto, NetworkError> success:
        expect(success.value.userId, equals(1));
        break;
      case Failure<AppUserDto, NetworkError> failure:
        fail('api 호출 실패: ${failure.error}');
    }
  });
}

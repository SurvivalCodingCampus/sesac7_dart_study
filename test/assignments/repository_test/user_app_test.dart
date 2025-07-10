import 'dart:async'; // TimeoutException을 위해 필요

import 'package:http/http.dart' as http; // 실제 http.Client를 위해
import 'package:modu_3_dart_study/assignments/result_pattern/data_source/user_data_source_impl.dart';
import 'package:modu_3_dart_study/assignments/result_pattern/dto/user_dto.dart';
import 'package:test/test.dart'; // UserDto

class _TimeoutHttpClient extends http.BaseClient {
  final Duration delay;
  final http.Client _inner;

  _TimeoutHttpClient(this.delay) : _inner = http.Client();

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    await Future.delayed(delay);
    return _inner.send(request);
  }
}

void main() {
  late UserDataSourceImpl dataSource;
  final httpClient = http.Client();

  const String gistUsersUrl =
      'https://gist.githubusercontent.com/ParkGiTeak/87ea13ba3ffced3a6b3e6e6c598f7a3a/raw/b8d3d4071ad6ec83d451f029833ed87c237507a2/image_share_app_users.json';

  final newUserDto = UserDto(
    id: 999,
    name: 'Gist User',
    age: 30,
    address: 'Gist Address',
    phoneNumber: '010-0000-0000',
  );

  group('UserDataSourceImpl Gist 실제 통신 테스트', () {
    test('getUsers 테스트', () async {
      dataSource = UserDataSourceImpl(
        client: httpClient,
        baseUrl: gistUsersUrl,
      );
      final response = await dataSource.getUsers();

      expect(response.statusCode, 200);
      expect(response.body, isA<List<UserDto>>());
      expect(response.body.length, 10);
      expect(response.body[0].id, 1);
      expect(response.body[0].name, 'Alice Smith');
      expect(response.body[9].id, 10);
      expect(response.body[9].name, 'Jack Black');
    });

    test('getUserId 예외 처리 테스트', () async {
      const int targetId = 1;

      expect(
        () async => await dataSource.getUserId(targetId),
        throwsA(isA<Exception>()),
      );
    });

    test('getUsers 10초 강제 지연 시 타임아웃 예외', () async {
      final mockTimeoutClient = _TimeoutHttpClient(Duration(seconds: 10));
      dataSource = UserDataSourceImpl(
        client: mockTimeoutClient,
        baseUrl: gistUsersUrl,
      );

      expect(
        () async => await dataSource.getUsers(),
        throwsA(isA<TimeoutException>()),
      );
    }, timeout: Timeout(Duration(seconds: 15)));
  });
}

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:modu_3_dart_study/16_http/core/response.dart';
import 'package:modu_3_dart_study/18_result_pattern/data_source/user_data_source.dart';
import 'package:modu_3_dart_study/18_result_pattern/dto/user_dto.dart';
import 'package:modu_3_dart_study/18_result_pattern/model/user.dart';

final List<Map<String, dynamic>> _mockUsers = [
  {'id': 1, 'name': 'Kim'},
  {'id': 2, 'name': 'Lee'},
  {'id': 3, 'name': 'Park'},
];

class MockUserDataSourceImpl implements UserDataSource {
  String baseUrl = 'https://test.com/users';
  final http.Client _client = MockClient((request) async {
    final path = request.url.path;
    final queryParams = request.url.queryParameters;
    if (path == '/users') {
      if (request.url.path == '/users' && queryParams.containsKey('id')) {
        final String? idString = queryParams['id'];
        final int id = int.tryParse(idString ?? '0') ?? 0;
        return http.Response(
          jsonEncode(
            _mockUsers.where((e) => e[id]),
          ),
          200,
        );
      }
      return http.Response(
        jsonEncode(_mockUsers),
        200,
      );
    } else if (path == '/users/unauthorized') {
      return http.Response(
        '',
        401,
      );
    } else if (path == '/users/timeout') {
      await Future.delayed(Duration(seconds: 11));
      return http.Response(
        '',
        504,
      );
    } else if (path == '/users/not_found') {
      return http.Response(
        '',
        404,
      );
    } else if (request.method == 'POST' && path == '/users') {
      return http.Response(
        '',
        200,
      );
    } else if (path == '/users/parse_error') {
      throw FormatException('파싱 에러');
    }
    return http.Response(
      jsonEncode(_mockUsers),
      400,
    );
  });

  @override
  Future<Response<UserDto>> getUser(int id) async {
    final response = await _client.get(
      Uri.parse("$baseUrl/?id=$id"),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    return Response(
      statusCode: response.statusCode,
      header: response.headers,
      body: (jsonDecode(response.body) as List)
          .map((e) => UserDto.fromJson(e))
          .toList()
          .first,
    );
  }

  @override
  Future<Response<List<UserDto>>> getUsers() async {
    final response = await _client.get(
      Uri.parse(baseUrl),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    return Response(
      statusCode: response.statusCode,
      header: response.headers,
      body: (jsonDecode(response.body) as List)
          .map((e) => UserDto.fromJson(e))
          .toList(),
    );
  }

  @override
  Future<Response<void>> createUser(User user) async {
    final response = await _client.post(
      Uri.parse(baseUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(user.toJson()),
    );

    return Response(
      statusCode: response.statusCode,
      header: response.headers,
      body: null,
    );
  }
}

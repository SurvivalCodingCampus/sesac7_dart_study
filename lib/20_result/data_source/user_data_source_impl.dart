import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:modu_3_dart_study/18_http/core/response.dart';
import 'package:modu_3_dart_study/20_result/data_source/user_data_source.dart';
import 'package:modu_3_dart_study/20_result/dto/user_dto.dart';

class UserDataSourceImpl implements UserDataSource {
  static const baseUrl = 'http://jsonplaceholder.typicode.com';

  final http.Client _client;

  UserDataSourceImpl({http.Client? client}) : _client = client ?? http.Client();

  @override
  Future<Response<UserDto>> createUser(UserDto userDto) async {
    final response = await _client.post(
      Uri.parse('$baseUrl/users'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(userDto),
    );

    return Response(
      statusCode: response.statusCode,
      header: response.headers,
      body: UserDto.fromJson(jsonDecode(response.body)),
    );
  }

  @override
  Future<Response<UserDto>> getUser(int id) async {
    final response = await _client.get(
      Uri.parse('$baseUrl/users/$id'),
    );
    return Response(
      statusCode: response.statusCode,
      header: response.headers,
      body: UserDto.fromJson(jsonDecode(response.body)),
    );
  }

  @override
  Future<Response<List<UserDto>>> getUsers() async {
    final response = await _client.get(
      Uri.parse('$baseUrl/users'),
    );
    return Response(
      statusCode: response.statusCode,
      header: response.headers,
      body: (jsonDecode(response.body) as List)
          .map((e) => UserDto.fromJson(e))
          .toList(),
    );
  }
}

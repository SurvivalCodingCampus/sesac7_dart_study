import 'dart:convert';

import 'package:http/http.dart' as http;

import '../core/response.dart';
import '../dto/user_dto.dart';
import 'user_data_source.dart';

class RemoteUserDataSourceImpl implements UserDataSource {
  static const baseUrl = 'http://jsonplaceholder.typicode.com';

  final http.Client _client;

  RemoteUserDataSourceImpl({http.Client? client})
    : _client = client ?? http.Client();

  @override
  Future<Response<UserDto>> addUser({required UserDto userDto}) async {
    final response = await _client.post(
      Uri.parse('$baseUrl/posts'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: userDto.toJson(),
    );

    return Response(
      statusCode: response.statusCode,
      header: response.headers,
      body: jsonDecode(response.body),
    );
  }

  @override
  Future<Response<List<UserDto>>> getUsers() async {
    final response = await _client.get(Uri.parse('$baseUrl/posts'));

    return Response(
      statusCode: response.statusCode,
      header: response.headers,
      body: jsonDecode(response.body),
    );
  }

  @override
  Future<Response<UserDto>> getUser({required int id}) async {
    final response = await _client.get(
      Uri.parse('$baseUrl/posts/$id'),
    );

    return Response(
      statusCode: response.statusCode,
      header: response.headers,
      body: jsonDecode(response.body),
    );
  }
}

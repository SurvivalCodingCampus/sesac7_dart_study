import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:modu_3_dart_study/assignments/http_practice/core/response.dart';
import 'package:modu_3_dart_study/assignments/result_pattern/data_source/user_data_source.dart';
import 'package:modu_3_dart_study/assignments/result_pattern/dto/user_dto.dart';

class UserDataSourceImpl implements UserDataSource {
  final String baseUrl;
  final http.Client _client;

  UserDataSourceImpl({http.Client? client, required this.baseUrl})
    : _client = client ?? http.Client();

  @override
  Future<Response<UserDto>> getUserId(id) async {
    final response = await _client
        .get(Uri.parse('$baseUrl/$id'))
        .timeout(const Duration(seconds: 5));
    ;
    return Response(
      statusCode: response.statusCode,
      header: {'Content-Type': 'application/json'},
      body: UserDto.fromJson(jsonDecode(response.body)),
    );
  }

  @override
  Future<Response<List<UserDto>>> getUsers() async {
    final response = await _client
        .get(Uri.parse(baseUrl))
        .timeout(const Duration(seconds: 5));
    ;
    final decoded = jsonDecode(response.body) as List;

    return Response<List<UserDto>>(
      statusCode: response.statusCode,
      header: {'Content-Type': 'application/json'},
      body: decoded.map((e) => UserDto.fromJson(e)).toList(),
    );
  }

  @override
  Future<Response<UserDto>> createUser(UserDto dto) async {
    final response = await _client
        .post(
          Uri.parse(baseUrl),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(dto.toJson()),
        )
        .timeout(const Duration(seconds: 5));

    return Response<UserDto>(
      statusCode: response.statusCode,
      header: {'Content-Type': 'application/json'},
      body: UserDto.fromJson(jsonDecode(response.body)),
    );
  }
}

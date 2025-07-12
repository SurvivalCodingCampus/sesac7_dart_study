import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:modu_3_dart_study/result_pattern/data_source/user_data_source.dart';
import 'package:modu_3_dart_study/result_pattern/dto/user_dto.dart';

import '../core/reponse.dart';

class UserDataSourceImpl implements UserDataSource {
  static const String defaultUrl =
      'https://gist.githubusercontent.com/ParkGiTeak/87ea13ba3ffced3a6b3e6e6c598f7a3a/raw/b8d3d4071ad6ec83d451f029833ed87c237507a2/image_share_app_users.json';

  final http.Client _client;

  UserDataSourceImpl({http.Client? client}) : _client = client ?? http.Client();

  @override
  Future<Response<List<UserDto>>> getUsers() async {
    // Response
    final response = await _client.get(Uri.parse(defaultUrl));

    return Response(
      statusCode: response.statusCode,
      header: response.headers,
      body: (jsonDecode(response.body) as List)
          .map((e) => UserDto.fromJson(e))
          .toList(),
    );
  }

  @override
  Future<Response<UserDto>> createUser(
    Map<String, dynamic> user,
  ) async {
    // Response
    final response = await _client.post(
      Uri.parse(defaultUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(user),
    );

    return Response(
      statusCode: response.statusCode,
      header: response.headers,
      body: UserDto.fromJson(jsonDecode(response.body)),
    );
  }

  @override
  Future<Response<UserDto>> getUser(int id) async {
    // Response
    final response = await _client.get(Uri.parse('$defaultUrl/id'));

    return Response(
      statusCode: response.statusCode,
      header: response.headers,
      body: UserDto.fromJson(jsonDecode(response.body)),
    );
  }
}

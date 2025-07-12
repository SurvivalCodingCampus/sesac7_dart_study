import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:modu_3_dart_study/core/response.dart';
import 'package:modu_3_dart_study/data_source/user2/user2_data_source.dart';
import 'package:modu_3_dart_study/dto/user2/user2_dto.dart';

class User2DataSourceImpl implements User2DataSource {
  static const baseUrl =
      'https://gist.githubusercontent.com/ParkGiTeak/87ea13ba3ffced3a6b3e6e6c598f7a3a/raw/b8d3d4071ad6ec83d451f029833ed87c237507a2/image_share_app_users.json';
  static const contentTypeKey = 'Content-Type';
  static const contentTypeValue = 'application/json; charset=utf-8';

  final http.Client _client;

  User2DataSourceImpl({http.Client? client})
    : _client = client ?? http.Client();

  @override
  Future<Response<User2Dto>> createUser(User2Dto user) async {
    final response = await _client.post(
      Uri.parse(baseUrl),
      headers: {contentTypeKey: contentTypeValue},
      body: jsonEncode(user.toJson()),
    );

    return Response(
      statusCode: response.statusCode,
      headers: response.headers,
      body: User2Dto.fromJson(jsonDecode(response.body)),
    );
  }

  @override
  Future<Response<List<User2Dto>>> getUsers() async {
    final response = await _client.get(
      Uri.parse(baseUrl),
    );

    return Response(
      statusCode: response.statusCode,
      headers: response.headers,
      body: (jsonDecode(response.body) as List)
          .map((e) => User2Dto.fromJson(e))
          .toList(),
    );
  }
}

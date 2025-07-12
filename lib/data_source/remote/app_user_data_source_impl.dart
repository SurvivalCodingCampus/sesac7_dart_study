import 'dart:convert';

import 'package:modu_3_dart_study/data_source/remote/app_user_data_source.dart';
import 'package:http/http.dart' as http;
import 'package:modu_3_dart_study/core/response.dart';
import 'package:modu_3_dart_study/dto/app_user_dto.dart';
import 'package:modu_3_dart_study/model/app_user.dart';

class AppUserDataSourceImpl implements AppUserDataSource {
  final String baseUrl;

  http.Client _client;
  AppUserDataSourceImpl({http.Client? client, required this.baseUrl})
    : _client = client ?? http.Client();

  @override
  Future<Response<AppUserDto>> getUser(int userId) async {
    final response = await _client.get(Uri.parse('$baseUrl/$userId'));

    return Response(
      statusCode: response.statusCode,
      header: {'Content-Type': 'application/json'},
      body: AppUserDto.fromJson(jsonDecode(response.body)),
    );
  }

  @override
  Future<Response<List<AppUserDto>>> getUserList() async {
    final response = await _client.get(Uri.parse(baseUrl));
    final decoded = jsonDecode(response.body) as List;
    // final decoded = jsonDecode(response.body) 이렇게만 써있을때는 타입 추론을 명확히 하지 못해서 에러가 난다
    // type 'List<dynamic>' is not a subtype of type 'List<AppUserDto>'

    // as List 붙여주면 확실히 List<dynamic>이라는 것을 인지해서 에러가 안남

    // response.body는 항상 List<dynamic> 타입 반환

    return Response<List<AppUserDto>>(
      statusCode: response.statusCode,
      header: {'Content-Type': 'application/json'},
      body: decoded.map((e) => AppUserDto.fromJson(e)).toList(),
    );
  }

  @override
  Future<Response<AppUserDto>> createUser(AppUserDto dto) async {
    final response = await _client.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(dto.toJson()),
      // 서버와 통신해야하므로 dto 객체를 인자로 받고
      // dto.toJson : 객체를 Map 형태로 변환
      // Map을 json string 으로 변환
    );

    // response.body는 항상 List<dynamic> 타입 반환

    return Response<AppUserDto>(
      statusCode: response.statusCode,
      header: {'Content-Type': 'application/json'},
      body: AppUserDto.fromJson(jsonDecode(response.body)),
    );
  }
}

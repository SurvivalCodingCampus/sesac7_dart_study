import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:modu_3_dart_study/core/response.dart';
import 'package:modu_3_dart_study/data_source/image_share_app_user/image_share_app_user_data_source.dart';
import 'package:modu_3_dart_study/dto/image_share_app_user/image_share_app_user_dto.dart';

class MockImageShareAppDataSourceImpl implements ImageShareAppUserDataSource {
  final http.Client _client;

  MockImageShareAppDataSourceImpl(http.Client client) : _client = client;

  @override
  Future<Response<ImageShareAppUserDto>> createImageShareAppUser(
    ImageShareAppUserDto dto,
  ) async {
    final http.Response response = await _client.get(
      Uri.parse('https://mock.mock'),
    );
    final ImageShareAppUserDto imageShareAppUserDto =
        ImageShareAppUserDto.fromJson(jsonDecode(response.body));
    return Response(
      statusCode: response.statusCode,
      header: response.headers,
      body: imageShareAppUserDto,
    );
  }

  @override
  Future<Response<ImageShareAppUserDto>> getImageShareAppUserFindById(
    int id,
  ) async {
    final http.Response response = await _client.get(
      Uri.parse('https://mock.mock'),
    );
    final ImageShareAppUserDto imageShareAppUserDto =
        ImageShareAppUserDto.fromJson(jsonDecode(response.body));
    return Response(
      statusCode: response.statusCode,
      header: response.headers,
      body: imageShareAppUserDto,
    );
  }

  @override
  Future<Response<List<ImageShareAppUserDto>>> getImageShareAppUsers() async {
    final http.Response response = await _client.get(
      Uri.parse('https://mock.mock'),
    );
    final List<ImageShareAppUserDto> imageShareAppUserDtoList =
        (jsonDecode(response.body) as List)
            .map((e) => ImageShareAppUserDto.fromJson((e as Map<String, dynamic>)))
            .toList();
    return Response(
      statusCode: response.statusCode,
      header: response.headers,
      body: imageShareAppUserDtoList,
    );
  }
}

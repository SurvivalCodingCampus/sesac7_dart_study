import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:modu_3_dart_study/16_http/core/response.dart';
import 'package:modu_3_dart_study/17_dto_mapper/data_source/mask_store_data_source.dart';
import 'package:modu_3_dart_study/17_dto_mapper/dto/mask_store_dto.dart';

class MaskStoreDataSourceImpl implements MaskStoreDataSource {
  static const _baseUrl =
      'https://gist.githubusercontent.com/junsuk5/2b34223fb2368d2bf44c85082745649a/raw/00cb276cb4f4f9573d868e88382f6f7f6759df31/mask_store.json';
  final http.Client _client;

  MaskStoreDataSourceImpl({http.Client? client})
    : _client = client ?? http.Client();

  @override
  Future<Response<MaskStoreDto>> getMaskStore() async {
    final response = await _client.get(
      Uri.parse(_baseUrl),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    return Response(
      statusCode: response.statusCode,
      header: response.headers,
      body: MaskStoreDto.fromJson(
        jsonDecode(response.body) as Map,
      ),
    );
  }
}

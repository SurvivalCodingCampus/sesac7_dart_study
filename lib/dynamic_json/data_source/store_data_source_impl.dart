import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:modu_3_dart_study/dynamic_json/data_source/store_data_source.dart';
import 'package:modu_3_dart_study/dynamic_json/dto/store_result_dto.dart';

class StoreDataSourceImpl implements StoreDataSource {
  static const String defaultUrl =
      'http://gist.githubusercontent.com/junsuk5/2b34223fb2368d2bf44c85082745649a/raw/00cb276cb4f4f9573d868e88382f6f7f6759df31/mask_store.json';

  final http.Client _client;

  StoreDataSourceImpl({http.Client? client})
    : _client = client ?? http.Client();

  @override
  Future<StoreResultDto> getStores() async {
    final response = await _client.get(
      Uri.parse(defaultUrl),
    );

    return StoreResultDto.fromJson(jsonDecode(response.body));
  }
}

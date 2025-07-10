import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:modu_3_dart_study/assignments/2025-07-09/dto/store_data_dto.dart';

class StoreDataSource {
  final http.Client _client;

  // StoreDataSource(this._client);
  StoreDataSource({http.Client? client}) : _client = client ?? http.Client();

  // JsonPlaceHolderDataSourceImpl({http.Client? client})
  //     : _client = client ?? http.Client();

  Future<List<StoreDto>> getStores() async {
    final url =
        'https://gist.githubusercontent.com/junsuk5/2b34223fb2368d2bf44c85082745649a/raw/00cb276cb4f4f9573d868e88382f6f7f6759df31/mask_store.json';
    final response = await _client.get(Uri.parse(url));

    // final decodedData = jsonDecode(response.body);
    // final List<Map<String, dynamic>> stores = decodedData['stores'] as List;
    // return stores.map((json) => StoreDto.fromJson(json)).toList();
    return (jsonDecode(response.body)['stores'] as List)
        .map((json) => StoreDto.fromJson(json))
        .toList();
  }
}

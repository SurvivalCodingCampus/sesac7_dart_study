import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:modu_3_dart_study/core/response.dart';
import 'package:modu_3_dart_study/data_source/mask_stock/mask_stock_data_source.dart';
import 'package:modu_3_dart_study/dto/mask_stock_dto.dart';

class MaskStockDataSourceImpl implements MaskStockDataSource {
  final http.Client _client;

  MaskStockDataSourceImpl([http.Client? client])
    : _client = client ?? http.Client();

  @override
  Future<Response<MaskStockDto>> getMaskStockStores() async {
    final http.Response response = await _client.get(
      Uri.parse(
        'https://gist.githubusercontent.com/junsuk5/2b34223fb2368d2bf44c85082745649a/raw/00cb276cb4f4f9573d868e88382f6f7f6759df31/mask_store.json',
      ),
    );
    return Response(statusCode: response.statusCode, header: response.headers, body: MaskStockDto.fromJson(jsonDecode(response.body)));
  }
}

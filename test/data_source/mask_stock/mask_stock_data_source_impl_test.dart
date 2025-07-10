import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:modu_3_dart_study/core/response.dart';
import 'package:modu_3_dart_study/data_source/mask_stock/mask_stock_data_source.dart';
import 'package:modu_3_dart_study/data_source/mask_stock/mask_stock_data_source_impl.dart';
import 'package:modu_3_dart_study/dto/mask_stock_dto.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  final Map<String, dynamic> jsonMock = {
    'count': 3,
    'stores': [
      {
        'addr': '서울특별시 강북구 솔매로 38 (미아동)',
        'code': '11817488',
        'created_at': '2020/07/03 11:00:00',
        'lat': 37.6254369,
        'lng': 127.0164096,
        'name': '승약국',
        'remain_stat': 'plenty',
        'stock_at': '2020/07/02 18:05:00',
        'type': '01',
      },
      {
        'addr': '서울특별시 강북구 삼양로 247 3층 (미아동)',
        'code': '12856941',
        'created_at': '2020/07/03 11:00:00',
        'lat': 37.6255182,
        'lng': 127.017747,
        'name': '대지약국',
        'remain_stat': 'plenty',
        'stock_at': '2020/07/03 10:45:00',
        'type': '01',
      },
      {
        'addr': '서울특별시 강북구 삼양로 255 (미아동)',
        'code': '11819723',
        'created_at': '2020/07/03 11:00:00',
        'lat': 37.6261612,
        'lng': 127.0180494,
        'name': '청구약국',
        'remain_stat': 'plenty',
        'stock_at': '2020/07/03 10:40:00',
        'type': '01',
      },
    ],
  };
  test('MaskStockDataSourceImpl Test', () async {
    final MockClient mockClient = MockClient((request) async {
      return http.Response(
        jsonEncode(jsonMock),
        200,
        headers: {'content-type': 'application/json; charset=utf-8'},
      );
    });

    final MaskStockDataSource dataSource = MaskStockDataSourceImpl(mockClient);
    final Response response = await dataSource.getMaskStockStores();
    final MaskStockDto maskStockDto = response.body;

    expect(response.statusCode, equals(200));
    expect(maskStockDto.count, equals(3));
    expect(maskStockDto.stores?.length, equals(3));
  });
}

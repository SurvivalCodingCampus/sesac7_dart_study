import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:modu_3_dart_study/17_dto_mapper/data_source/mask_store_data_source.dart';
import 'package:modu_3_dart_study/17_dto_mapper/data_source/mask_store_data_source_impl.dart';
import 'package:modu_3_dart_study/17_dto_mapper/repository/store_repository.dart';
import 'package:modu_3_dart_study/17_dto_mapper/repository/store_repository_impl.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  test('StoreRepositoryImpl, getStores() Test', () async {
    final mockClient = MockClient((request) async {
      return http.Response.bytes(
        utf8.encode(
          jsonEncode({
            "count": 222,
            "stores": [
              {
                "addr": "서울특별시 강북구 솔매로 38 (미아동)",
                "code": "11817488",
                "lat": 37.6254369,
                "lng": 127.0164096,
                "name": "승약국",
                "remain_stat": "plenty",
                "stock_at": "2020/07/02 18:05:00",
                "type": "01",
              },
              {
                "addr": "서울특별시 강북구 삼양로 247 3층 (미아동)",
                "code": "12856941",
                "created_at": "2020/07/03 11:00:00",
                "lat": 37.6255182,
                "lng": 127.017747,
                "name": "대지약국",
                "remain_stat": null,
                "stock_at": "2020/07/03 10:45:00",
                "type": "01",
              },
              {
                "addr": "서울특별시 강북구 삼양로 255 (미아동)",
                "code": "11819723",
                "created_at": "2020/07/03 11:00:00",
                "lat": 37.6261612,
                "lng": 127.0180494,
                "name": "청구약국",
                "remain_stat": "plenty",
                "stock_at": "2020/07/03 10:40:00",
                "type": "01",
              },
            ],
          }),
        ),
        200,
      );
    });

    final MaskStoreDataSource dataSource = MaskStoreDataSourceImpl(
      client: mockClient,
    );

    final StoreRepository repository = StoreRepositoryImpl(dataSource);

    final response = await repository.getStores();

    expect(response.length, 1);
  });
}

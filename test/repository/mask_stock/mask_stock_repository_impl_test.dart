import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:modu_3_dart_study/data_source/mask_stock/mask_stock_data_source.dart';
import 'package:modu_3_dart_study/data_source/mask_stock/mask_stock_data_source_impl.dart';
import 'package:modu_3_dart_study/model/store.dart';
import 'package:modu_3_dart_study/repository/mask_stock/mask_stock_repository.dart';
import 'package:modu_3_dart_study/repository/mask_stock/mask_stock_repository_impl.dart';
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
  final Map<String, dynamic> nullableFieldJsonMock = {
    'count': 3,
    'stores': [
      {
        'addr': '서울특별시 강북구 솔매로 38 (미아동)',
        'code': '11817488',
        'created_at': '2020/07/03 11:00:00',
        'lat': 37.6254369,
        'lng': 127.0164096,
        'name': '승약국',
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
        'type': '01',
      },
      {
        'addr': '서울특별시 강북구 삼양로 255 (미아동)',
        'code': '11819723',
        'lat': 37.6261612,
        'lng': 127.0180494,
        'name': '청구약국',
        'remain_stat': 'plenty',
        'stock_at': '2020/07/03 10:40:00',
        'type': '01',
      },
    ],
  };

  group('MaskStockRepositoryImpl', () {
    test('MaskStockRepository get', () async {
      final MockClient mockClient = MockClient((request) async {
        return http.Response(
          jsonEncode(jsonMock),
          200,
          headers: {'content-type': 'application/json; charset=utf-8'},
        );
      });
      final MaskStockDataSource maskStockDataSource = MaskStockDataSourceImpl(mockClient);
      final MaskStockRepository maskStockRepository = MaskStockRepositoryImpl(dataStore: maskStockDataSource);
      final List<Store> maskStockStores = await maskStockRepository.getMaskStockStores();
      final Store firstStoreItem = maskStockStores.first;

      expect(maskStockStores.length, equals(3));
      expect(firstStoreItem.addr, equals('서울특별시 강북구 솔매로 38 (미아동)'));
      expect(firstStoreItem.code, equals('11817488'));
      expect(firstStoreItem.createdAt, equals('2020/07/03 11:00:00'));
      expect(firstStoreItem.lat, equals(37.6254369));
      expect(firstStoreItem.lng, equals(127.0164096));
      expect(firstStoreItem.name, equals('승약국'));
      expect(firstStoreItem.remainStat, equals('plenty'));
      expect(firstStoreItem.stockAt, equals('2020/07/02 18:05:00'));
      expect(firstStoreItem.type, equals('01'));
    });

    test('MaskStockRepository nullable field get', () async {
      final MockClient mockClient = MockClient((request) async {
        return http.Response(
          jsonEncode(nullableFieldJsonMock),
          200,
          headers: {'content-type': 'application/json; charset=utf-8'},
        );
      });
      final MaskStockDataSource maskStockDataSource = MaskStockDataSourceImpl(mockClient);
      final MaskStockRepository maskStockRepository = MaskStockRepositoryImpl(dataStore: maskStockDataSource);
      final List<Store> maskStockStores = await maskStockRepository.getMaskStockStores();

      expect(maskStockStores, equals(List.empty()));
    });
  });
}

import 'dart:convert';

import 'package:modu_3_dart_study/assignments/2025-07-09/data_source/store_data_source.dart';
import 'package:modu_3_dart_study/assignments/2025-07-09/dto/store_dto.dart';
import 'package:modu_3_dart_study/assignments/2025-07-09/dto/store_result_dto.dart';

class MockStoreDataSourceImpl implements StoreDataSource {
  final String mockString = """
{
  "count": 6,
  "stores": [
      {
      "addr": "서울특별시 강북구 삼양로87길 35 (수유동)",
      "code": "11817411",
      "created_at": null,
      "lat": 37.6358715,
      "lng": 127.0157532,
      "name": "한양약국",
      "remain_stat": null,
      "stock_at": null,
      "type": "01"
    },
    {
      "addr": "서울특별시 강북구 도봉로 308 1층 (번동)",
      "code": "11817542",
      "created_at": "2020/07/03 11:00:00",
      "lat": 37.6356641,
      "lng": 127.0238352,
      "name": "새암온누리약국",
      "remain_stat": "plenty",
      "stock_at": "2020/07/03 07:57:00",
      "type": "01"
    },
    {
      "addr": "서울특별시 강북구 수유로 83 (수유동)",
      "code": "11816899",
      "created_at": "2020/07/03 11:00:00",
      "lat": 37.6363726,
      "lng": 127.022781,
      "name": "수유동약국",
      "remain_stat": "plenty",
      "stock_at": "2020/07/03 10:24:00",
      "type": "01"
    },
    {
      "addr": "서울특별시 강북구 수유로23길 57 (수유동)",
      "code": "11817585",
      "created_at": "2020/07/03 11:00:00",
      "lat": 37.638916,
      "lng": 127.0220012,
      "name": "한독약국",
      "remain_stat": "plenty",
      "stock_at": "2020/07/02 14:48:00",
      "type": "01"
    },
    {
      "addr": "서울특별시 강북구 삼양로 423 (수유동)",
      "code": "11817593",
      "created_at": "2020/07/03 11:00:00",
      "lat": 37.6412547,
      "lng": 127.016616,
      "name": "지영약국",
      "remain_stat": "plenty",
      "stock_at": "2020/07/02 14:11:00",
      "type": "01"
    },
    {
      "addr": "서울특별시 강북구 삼양로 429 (수유동)",
      "code": "11818328",
      "created_at": null,
      "lat": 37.6418221,
      "lng": 127.0165334,
      "name": "대명약국",
      "remain_stat": null,
      "stock_at": null,
      "type": "01"
    }
  ]
}
""";

  @override
  List<Store_DTO> getStoreDTOs() {
    final mapOfData = jsonDecode(mockString);
    final StoreResultDto resultDto = StoreResultDto.fromJson(mapOfData);

    if (resultDto.stores == null) {
      throw Exception("MockDataSource caused error");
    }
    return resultDto.stores!;
  }
}

import 'package:modu_3_dart_study/250709/homework1/data_source/json_url_store_data_source_impl.dart';
import 'package:modu_3_dart_study/250709/homework1/data_source/store_data_source.dart';
import 'package:modu_3_dart_study/250709/homework1/dto/store_dto.dart';
import 'package:modu_3_dart_study/250709/homework1/dto/store_result_dto.dart';
import 'package:modu_3_dart_study/250709/homework1/repository/store_repository_impl.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';
import 'store_repository_impl_test.mocks.dart';

@GenerateMocks([StoreDataSource])
void main() {
  test('StoreRepositoryImpl test', () async {
    final StoreDataSource mockStoreDataSource = MockStoreDataSource();
    final storeRepositoryImpl = StoreRepositoryImpl(mockStoreDataSource);

    final json = {
      "count": 2,
      "stores": [
        {
          "addr": "서울특별시 강북구 솔매로 38 (미아동)",
          "code": "11817488",
          "created_at": "2020/07/03 11:00:00",
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
          "remain_stat": "plenty",
          "stock_at": "2020/07/03 10:45:00",
          "type": "01",
        },
      ],
    };
    final storeDtoList = StoreResultDto.fromJson(json).stores as List<StoreDto>;

    when(mockStoreDataSource.getStores()).thenAnswer((_) => storeDtoList);

    expect(storeRepositoryImpl.getStores().first.name, '승약국');
    expect(storeRepositoryImpl.getStores().first.type, '01');
  });
}

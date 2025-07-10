import 'package:modu_3_dart_study/dynamic_json/data_source/store_data_source.dart';
import 'package:modu_3_dart_study/dynamic_json/repository/store_repository.dart';
import 'package:modu_3_dart_study/dynamic_json/repository/store_repository_impl.dart';
import 'package:test/test.dart';

import '../mocks/mock_store_data_source_impl.dart';

void main() {
  test('StoreRepositoryImpl Test', () async {
    // given
    final int testCount = 4;
    final String testAddr1 = '서울특별시 강북구 솔매로 38 (미아동)';
    final String testAddr2 = '서울특별시 강북구 솔샘로 254 2층 2호 (미아동, 삼양아케이트)';
    final String testCode1 = "11817488";
    final String testCode2 = "11888571";
    final String testCreatedAt1 = "2020/07/03 11:00:00";
    final String testCreatedAt2 = "2020/07/03 11:00:00";
    final double testLat1 = 37.6254369;
    final double testLat2 = 37.627357;
    final double testLng1 = 127.0164096;
    final double testLng2 = 127.018375;
    final String testName1 = "승약국";
    final String testName2 = "민들레약국";
    final String testRemainStat1 = "plenty";
    final String testRemainStat2 = "plenty";
    final String testStockAt1 = "2020/07/02 18:05:00";
    final String testStockAt2 = "2020/06/29 08:12:00";
    final String testType1 = "01";
    final String testType2 = "01";

    final StoreDataSource storeDataSource = MockStoreDataSourceImpl();
    final StoreRepository storeRepository = StoreRepositoryImpl(
      storeDataSource: storeDataSource,
    );

    // when
    final result = await storeRepository.getValidStores();

    // then
    expect(result.count, equals(testCount));

    expect(result.stores.first.addr, equals(testAddr1));
    expect(result.stores.first.code, equals(testCode1));
    expect(result.stores.first.createdAt, equals(testCreatedAt1));
    expect(result.stores.first.lat, equals(testLat1));
    expect(result.stores.first.lng, equals(testLng1));
    expect(result.stores.first.name, equals(testName1));
    expect(result.stores.first.remainStat, equals(testRemainStat1));
    expect(result.stores.first.stockAt, equals(testStockAt1));
    expect(result.stores.first.type, equals(testType1));

    expect(result.stores.last.addr, equals(testAddr2));
    expect(result.stores.last.code, equals(testCode2));
    expect(result.stores.last.createdAt, equals(testCreatedAt2));
    expect(result.stores.last.lat, equals(testLat2));
    expect(result.stores.last.lng, equals(testLng2));
    expect(result.stores.last.name, equals(testName2));
    expect(result.stores.last.remainStat, equals(testRemainStat2));
    expect(result.stores.last.stockAt, equals(testStockAt2));
    expect(result.stores.last.type, equals(testType2));
  });
}

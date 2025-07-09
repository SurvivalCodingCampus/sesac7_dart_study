import 'package:modu_3_dart_study/assignments/dto_mapper_practice/model/store/store.dart';
import 'package:modu_3_dart_study/assignments/dto_mapper_practice/repository/store_repository_impl.dart';
import 'package:test/test.dart';

import '../mocks/mock_store_data_source_impl.dart';

void main() {
  test('데이터 필터링 테스트', () async {
    final dataSource = MockStoreDataSource();
    final repository = StoreRepositoryImpl(dataSource);

    final stores = await repository.getStores();
    expect(stores, isA<List<Store>>());

    expect(stores.length, lessThan(221)); // 필터링이 됬는지 확인

    expect(stores.any((e) => e.name == '없는약국'), false);

    final store1 = stores.firstWhere((e) => e.name == '승약국');
    expect(store1.remainStat, StoreStatus.plenty);

    final store2 = stores.firstWhere(
      (e) => e.addr == '서울특별시 강북구 삼양로 309 (수유동)',
    );
    expect(store2.name, equals('푸른약국'));
  });
}

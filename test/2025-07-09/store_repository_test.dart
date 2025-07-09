import 'package:modu_3_dart_study/assignments/2025-07-09/data_source/store_data_source.dart';
import 'package:modu_3_dart_study/assignments/2025-07-09/model/store.dart';
import 'package:modu_3_dart_study/assignments/2025-07-09/repository/store_repository.dart';
import 'package:test/test.dart';

void main() {
  test('store_repository_test', () async {
    final List<Store> storesData = await StoreRepository(
      StoreDataSource(),
    ).getStores();
    print(storesData.length);
    print(storesData.first.remainStat);
  });
}

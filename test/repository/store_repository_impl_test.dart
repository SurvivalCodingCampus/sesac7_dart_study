import 'package:test/test.dart';
import 'package:modu_3_dart_study/repository/store_repository_impl.dart';
import 'package:modu_3_dart_study/data_source/remote/remote_store_data_source_impl.dart';

void main() {
  final dataSource = RemoteStoreDataSourceImpl(
    baseUrl:
        'https://gist.githubusercontent.com/junsuk5/2b34223fb2368d2bf44c85082745649a/raw/00cb276cb4f4f9573d868e88382f6f7f6759df31/mask_store.json',
  );

  test('호출이 정상적으로 작동한다', () async {
    // final response = await http.get(
    //   Uri.parse(
    //     'https://gist.githubusercontent.com/junsuk5/2b34223fb2368d2bf44c85082745649a/raw/00cb276cb4f4f9573d868e88382f6f7f6759df31/mask_store.json',
    //   ),
    // );

    final response = await dataSource.getStores();

    expect(response.statusCode, 200);
    expect(response.body.isNotEmpty, true);
  });

  test('리포지토리 메서드가 정상적으로 작동한다', () async {
    final repository = StoreRepositoryImpl(dataSource);
    final stores = await repository.getStoreVaild();

    expect(stores.isNotEmpty, true);

    for (final store in stores) {
      expect(store.createdAt != null && store.createdAt!.isNotEmpty, true);
      expect(store.remainStat != null && store.remainStat!.isNotEmpty, true);
      expect(store.stockAt != null && store.stockAt!.isNotEmpty, true);
    }
  });
}

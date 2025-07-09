import 'package:modu_3_dart_study/assignments/2025-07-09/data_source/store_data_source.dart';
import 'package:modu_3_dart_study/assignments/2025-07-09/mapper/store_mapper.dart';

import '../model/store.dart';

class StoreRepository {
  final StoreDataSource _dataSource;

  StoreRepository(this._dataSource);

  Future<List<Store>> getStores() async {
    final storeDtos = await _dataSource.getStores();
    return storeDtos
        .map((dto) => dto.toStore())
        .where(
          (dto) =>
              dto.createdAt != '' && dto.remainStat != '' && dto.stockAt != '',
        )
        .toList();
  }
}

Future<void> main() async {
  final List<Store> storesData = await StoreRepository(
    StoreDataSource(),
  ).getStores();
  print(storesData.length);
  // print(storesData.first.remainStat);
}

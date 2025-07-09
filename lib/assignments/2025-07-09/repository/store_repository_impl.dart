import 'package:modu_3_dart_study/assignments/2025-07-09/model/store.dart';
import 'package:modu_3_dart_study/assignments/2025-07-09/data_source/store_data_source.dart';
import 'package:modu_3_dart_study/assignments/2025-07-09/mapper/store_mapper.dart';
import 'package:modu_3_dart_study/assignments/2025-07-09/repository/store_repository.dart';

class StoreRepositoryImpl implements StoreRepository {
  final StoreDataSource _dataSource;

  StoreRepositoryImpl(this._dataSource);

  @override
  List<Store> getStores() {
    final listOfDto = _dataSource.getStoreDTOs();
    final listOfStore = listOfDto.map((e) => e.toStore());
    final filteredList = listOfStore
        .where(
          (e) =>
              e.address != "null" &&
              e.code != "null" &&
              e.createdAt != "null" &&
              e.lat != 100.0 &&
              e.lng != 200.0 &&
              e.name != "null" &&
              e.remainStat != "null" &&
              e.stockAt != "null" &&
              e.type != "null",
        )
        .toList();

    return filteredList;
  }
}

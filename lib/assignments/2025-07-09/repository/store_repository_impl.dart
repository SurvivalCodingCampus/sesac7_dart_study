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
              e.address != StoreMapperConstants.nullPlaceholder &&
              e.code != StoreMapperConstants.nullPlaceholder &&
              e.createdAt != StoreMapperConstants.nullPlaceholder &&
              e.lat != StoreMapperConstants.latGarbageValue &&
              e.lng != StoreMapperConstants.lngGarbageValue &&
              e.name != StoreMapperConstants.nullPlaceholder &&
              e.remainStat != StoreMapperConstants.nullPlaceholder &&
              e.stockAt != StoreMapperConstants.nullPlaceholder &&
              e.type != StoreMapperConstants.nullPlaceholder,
        )
        .toList();

    return filteredList;
  }
}

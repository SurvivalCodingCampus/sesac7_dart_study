import 'package:modu_3_dart_study/250709/homework1/data_source/store_data_source.dart';
import 'package:modu_3_dart_study/250709/homework1/data_source/json_url_store_data_source_impl.dart';
import 'package:modu_3_dart_study/250709/homework1/dto/store_dto.dart';
import 'package:modu_3_dart_study/250709/homework1/mapper/store_mapper.dart';
import 'package:modu_3_dart_study/250709/homework1/model/store.dart';
import 'package:modu_3_dart_study/250709/homework1/repository/store_repository.dart';

class StoreRepositoryImpl implements StoreRepository {
  final StoreDataSource _storeDataSource;

  StoreRepositoryImpl(this._storeDataSource);

  @override
  List<Store> getStores() {
    return _storeDataSource
        .getStores()
        .map((StoreDto element) => element.toModel())
        .where(
          (Store e) =>
              e.createdAt != DATE_NOT_AVAILABLE &&
              e.stockAt != DATE_NOT_AVAILABLE &&
              e.remainStat != '',
        )
        .toList();
  }
}

void main() {
  final storeDataSource = JsonUrlStoreDataSourceImpl();
  final storeRepository = StoreRepositoryImpl(storeDataSource);
  storeRepository.getStores().forEach(
    (e) => print('${e.createdAt},${e.stockAt}'),
  );
}

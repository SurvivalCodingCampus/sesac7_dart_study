import 'package:modu_3_dart_study/17_dto_mapper/data_source/mask_store_data_source.dart';
import 'package:modu_3_dart_study/17_dto_mapper/data_source/mask_store_data_source_impl.dart';
import 'package:modu_3_dart_study/17_dto_mapper/dto/store_dto.dart';
import 'package:modu_3_dart_study/17_dto_mapper/mapper/store_mapper.dart';
import 'package:modu_3_dart_study/17_dto_mapper/model/store.dart';
import 'package:modu_3_dart_study/17_dto_mapper/repository/store_repository.dart';

class StoreRepositoryImpl implements StoreRepository {
  final MaskStoreDataSource _dataSource;

  StoreRepositoryImpl(this._dataSource);

  @override
  Future<List<Store>> getStores() async {
    final response = await _dataSource.getMaskStore();

    return (response.body.stores ?? [])
        .where(
          (e) => (e != null)
              ? (e.stockAt != null &&
                    e.remainStat != null &&
                    e.createdAt != null)
              : false,
        )
        .map((e) => (e ?? StoreDto()).toModel())
        .toList();
  }
}

void main() async {
  final dataSource = MaskStoreDataSourceImpl();
  final repository = StoreRepositoryImpl(dataSource);

  print((await repository.getStores()).length);
}

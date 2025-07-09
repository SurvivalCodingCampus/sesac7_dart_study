import 'package:modu_3_dart_study/assignments/dto_mapper_practice/data_source/store/store_data_source.dart';
import 'package:modu_3_dart_study/assignments/dto_mapper_practice/mapper/store/store_mapper.dart';
import 'package:modu_3_dart_study/assignments/dto_mapper_practice/model/store/store.dart';
import 'package:modu_3_dart_study/assignments/dto_mapper_practice/repository/store_repository.dart';

class StoreRepositoryImpl implements StoreRepository {
  final StoreDataSource _dataSource;

  StoreRepositoryImpl(this._dataSource);

  @override
  Future<List<Store>> getStores() async {
    try {
      final storeResultDto = await _dataSource.getStoreResult();

      final storeDtoList = storeResultDto.body.stores ?? [];

      final validDTO = storeDtoList.where((dto) {
        return dto.remainStat != null &&
            dto.stockAt != null &&
            dto.createdAt != null;
      }).toList();

      return validDTO.map((dto) => dto.toStore()).toList();
    } catch (e) {
      Exception('store repository error');
      return [];
    }
  }
}

import 'package:modu_3_dart_study/20250709/data_source/mask_store_data_source.dart';
import 'package:modu_3_dart_study/20250709/dto/mask_store_dto.dart';
import 'package:modu_3_dart_study/20250709/mapper/store_mapper.dart';
import 'package:modu_3_dart_study/20250709/repository/mask_store_repository.dart';

import '../model/store.dart';

class MaskStoreRepositoryImpl implements MaskStoreRepository {
  final MaskStoreDataSource _maskStoreDataSource;

  MaskStoreRepositoryImpl(this._maskStoreDataSource);

  @override
  Future<List<Store>> getStores() async {
    try {
      final result = await _maskStoreDataSource.getAllData();
      final maskStoreDTO = MaskStoreDto.fromJson(result);

      final storeList = maskStoreDTO.stores?.where((e) =>
      e.remainStat != null && e.stockAt != null && e.createdAt != null)
          .map((storeDTO) => storeDTO.toStore()).toList() ?? [];

      return storeList;

    } catch (e) {
      return [];
    }
  }
}
